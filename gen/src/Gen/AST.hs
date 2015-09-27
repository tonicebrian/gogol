{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE KindSignatures             #-}
{-# LANGUAGE LambdaCase                 #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE RankNTypes                 #-}
{-# LANGUAGE RecordWildCards            #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TupleSections              #-}
{-# LANGUAGE ViewPatterns               #-}

-- Module      : Gen.AST
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : provisional
-- Portability : non-portable (GHC extensions)

module Gen.AST where

import           Control.Applicative
import           Control.Error
import           Control.Lens                 hiding (lens)
import           Control.Monad.Except
import           Control.Monad.State.Strict
import           Data.Char
import qualified Data.HashMap.Strict          as Map
import           Data.Semigroup               ((<>))
import qualified Data.Text                    as Text
import qualified Data.Text.Lazy               as LText
import qualified Data.Text.Lazy.Builder       as Build
import           Data.Traversable             (for)
import           Gen.Formatting
import           Gen.Solve
import           Gen.Syntax
import           Gen.Types
import           HIndent
import           Language.Haskell.Exts        (Name)
import           Language.Haskell.Exts.Build  (name)
import           Language.Haskell.Exts.Pretty
import           Prelude                      hiding (sum)

runAST :: Service (Fix Schema) Resource -> Either Error (Service Data API)
runAST svc =  evalState (runExceptT (render ss)) (initial (_svcSchemas ss))
  where
    ss = flatten svc

render :: Service (Schema Id) Resource -> AST (Service Data API)
render svc = do
    x <- kvTraverseMaybe typ (_svcSchemas svc)
    y <- api (_svcApi svc)
    return $! svc { _svcSchemas = x, _svcApi = y }
  where
    typ :: Id -> Schema Id -> AST (Maybe Data)
    typ k = \case
        Arr  {}      -> pure Nothing
        Ref  {}      -> pure Nothing
        Any  {}      -> pure Nothing
        Lit  {}      -> pure Nothing
        Enum i vs ds -> Just . sum' <$> prefix k
          where
            sum' p = Sum (dname k) (i ^. description) $
                zipWith (branch p) vs (ds ++ repeat "")

            branch p v = Branch (bname p v) v

        Obj i rs -> do
            p  <- prefix k
            ds <- derive k
            dd <- Map.traverseWithKey (const . solve . mkProp k) rs
            Just <$> prod k p i ds dd

    prod :: Id -> Pre -> Info -> [Derive] -> Map Local Solved -> AST Data
    prod k p i ds ts = Prod (dname k) (i ^. description)
        <$> pp Indent (objDecl k p ds ts)
        <*> ctor
        <*> traverse lens (Map.toList ts)
        <*> traverse (pp Print) (jsonDecls k p ts)
      where
        ctor = Fun' (cname k) (Just help)
            <$> (pp None   (ctorSig  k   ts) <&> comments ts)
            <*>  pp Indent (ctorDecl k p ts)

        lens (l, v) = Fun' (lname p l) (v ^. description)
            <$> pp None  (lensSig k p l v)
            <*> pp Print (lensDecl  p l v)

        help = rawHelpText $
            sformat ("Creates a value of '" % fid %
                     "' with the minimum fields required to make a request.\n")
                     k

    api :: Resource -> AST API
    api x = do
        as <- Map.fromList <$> top x
        API n <$> pp Print (apiAlias n (Map.keys as))
              <*> pure as
      where
        n = name (Text.unpack (svcAbbrev svc))

        top = \case
           Top rs -> traverse (uncurry sub)       (Map.toList rs) <&> concat
           Sub ms -> traverse (uncurry (verb "")) (Map.toList ms)

        sub l = \case
            Top rs -> traverse (uncurry  sub)     (Map.toList rs) <&> concat
            Sub ms -> traverse (uncurry (verb l)) (Map.toList ms)

        verb p l m = do
            let (k, i) = vname p l
            s      <- solve i
            Just d <- typ i (_schema s)
            fmap (k,) $
                Action k (actionNS svc p l) (_mDescription m)
                    <$> pp Print (verbAlias svc k m)
                    <*> pure d

flatten :: Service (Fix Schema) Resource -> Service (Schema Id) Resource
flatten svc = svc { _svcSchemas = execState run mempty }
  where
    run = mapM_ (uncurry sch) (Map.toList (_svcSchemas svc))
       >> api (_svcApi svc)

    sch :: Id -> Fix Schema -> State (Map Id (Schema Id)) Id
    sch n (Fix f) = go f >>= ins n
      where
        go = \case
            Obj i ps      -> Obj i <$> Map.traverseWithKey (prop n) ps
            Arr i (Fix e) -> Arr i <$> prop n "item" (Fix (e & required .~ True))

            Enum i vs ds  -> pure (Enum i vs ds)
            Lit  i x      -> pure (Lit  i x)
            Ref  i r      -> pure (Ref  i r)
            Any  i        -> pure (Any  i)

    prop :: Id -> Local -> Fix Schema -> State (Map Id (Schema Id)) Id
    prop n l (Fix f) = go f >>= ins this
      where
        go = \case
            Obj i ps      -> Obj i <$> Map.traverseWithKey (prop this) ps
            Arr i (Fix e) -> Arr i <$> prop this "item" (Fix (e & required .~ True))

            Enum i vs ds -> pure (Enum i vs ds)
            Lit  i x     -> pure (Lit  i x)
            Ref  i r     -> pure (Ref  i r)
            Any  i       -> pure (Any  i)

        this = mkProp n l

    api :: Resource -> State (Map Id (Schema Id)) ()
    api = \case
        Top rs -> mapM_ (uncurry sub)       (Map.toList rs)
        Sub ms -> mapM_ (uncurry (verb "")) (Map.toList ms)
      where
        sub l = \case
            Top rs -> mapM_ (uncurry sub)      (Map.toList rs)
            Sub ms -> mapM_ (uncurry (verb l)) (Map.toList ms)

        -- FIXME: Global parameters
        verb p l m = do
            let (_, i) = vname p l
            rs <- Map.traverseWithKey (\k v -> prop i k (paramSchema v)) (_mParameters m)
            void . ins i $
                Obj (Info (_mDescription m) Nothing False Nothing) rs

    ins :: Id -> Schema Id -> State (Map Id (Schema Id)) Id
    ins n x = do
        s <- gets (Map.lookup n)
        case s of
            Nothing -> modify (Map.insert n x) >> pure n
            -- FIXME:
            Just e  -> error $ "Already exists: " ++ show (n, e, x)

data PP
    = Indent
    | Print
    | None
      deriving (Eq)

pp :: Pretty a => PP -> a -> AST Rendered
pp i x
    | i == Indent = result (reformat johanTibell Nothing p)
    | otherwise   = pure p
  where
    result = hoistEither . bimap e Build.toLazyText

    e = flip mappend (", when formatting: " <> p) . LText.pack

    p = LText.dropWhile isSpace
      . LText.pack
      $ prettyPrintStyleMode s m x

    s = style
        { mode           = PageMode
        , lineLength     = 80
        , ribbonsPerLine = 1.5
        }

    m | i == Print  = defaultMode
      | i == Indent = defaultMode
      | otherwise   = defaultMode
          { layout  = PPNoLayout
          , spacing = False
          }

-- FIXME: dirty hack to render smart ctor parameter comments.
comments :: Map Local Solved -> Rendered -> Rendered
comments (Map.toList -> rs) =
      LText.replace     " :: " "\n    :: "
    . LText.intercalate "\n    -> "
    . zipWith rel ps
    . map LText.strip
    . LText.splitOn     "->"
  where
    ks = filter (parameter . _schema . snd) rs
    ps = map (Just . fst) ks ++ repeat Nothing

    rel Nothing  t = t
    rel (Just l) t = t <> " -- ^ '" <> LText.fromStrict (local l) <> "'"
