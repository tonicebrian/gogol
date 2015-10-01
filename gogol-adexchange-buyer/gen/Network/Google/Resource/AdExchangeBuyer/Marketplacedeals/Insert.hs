{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.AdExchangeBuyer.Marketplacedeals.Insert
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Add new deals for the specified order
--
-- /See:/ <https://developers.google.com/ad-exchange/buyer-rest Ad Exchange Buyer API Reference> for @AdexchangebuyerMarketplacedealsInsert@.
module Network.Google.Resource.AdExchangeBuyer.Marketplacedeals.Insert
    (
    -- * REST Resource
      MarketplacedealsInsertResource

    -- * Creating a Request
    , marketplacedealsInsert'
    , MarketplacedealsInsert'

    -- * Request Lenses
    , mQuotaUser
    , mPrettyPrint
    , mUserIp
    , mKey
    , mOauthToken
    , mOrderId
    , mFields
    , mAlt
    ) where

import           Network.Google.AdExchangeBuyer.Types
import           Network.Google.Prelude

-- | A resource alias for @AdexchangebuyerMarketplacedealsInsert@ which the
-- 'MarketplacedealsInsert'' request conforms to.
type MarketplacedealsInsertResource =
     "marketplaceOrders" :>
       Capture "orderId" Text :>
         "deals" :>
           "insert" :>
             QueryParam "quotaUser" Text :>
               QueryParam "prettyPrint" Bool :>
                 QueryParam "userIp" Text :>
                   QueryParam "key" Text :>
                     QueryParam "oauth_token" Text :>
                       QueryParam "fields" Text :>
                         QueryParam "alt" Alt :>
                           Post '[JSON] AddOrderDealsResponse

-- | Add new deals for the specified order
--
-- /See:/ 'marketplacedealsInsert'' smart constructor.
data MarketplacedealsInsert' = MarketplacedealsInsert'
    { _mQuotaUser   :: !(Maybe Text)
    , _mPrettyPrint :: !Bool
    , _mUserIp      :: !(Maybe Text)
    , _mKey         :: !(Maybe Text)
    , _mOauthToken  :: !(Maybe Text)
    , _mOrderId     :: !Text
    , _mFields      :: !(Maybe Text)
    , _mAlt         :: !Alt
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'MarketplacedealsInsert'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mQuotaUser'
--
-- * 'mPrettyPrint'
--
-- * 'mUserIp'
--
-- * 'mKey'
--
-- * 'mOauthToken'
--
-- * 'mOrderId'
--
-- * 'mFields'
--
-- * 'mAlt'
marketplacedealsInsert'
    :: Text -- ^ 'orderId'
    -> MarketplacedealsInsert'
marketplacedealsInsert' pMOrderId_ =
    MarketplacedealsInsert'
    { _mQuotaUser = Nothing
    , _mPrettyPrint = True
    , _mUserIp = Nothing
    , _mKey = Nothing
    , _mOauthToken = Nothing
    , _mOrderId = pMOrderId_
    , _mFields = Nothing
    , _mAlt = JSON
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
mQuotaUser :: Lens' MarketplacedealsInsert' (Maybe Text)
mQuotaUser
  = lens _mQuotaUser (\ s a -> s{_mQuotaUser = a})

-- | Returns response with indentations and line breaks.
mPrettyPrint :: Lens' MarketplacedealsInsert' Bool
mPrettyPrint
  = lens _mPrettyPrint (\ s a -> s{_mPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
mUserIp :: Lens' MarketplacedealsInsert' (Maybe Text)
mUserIp = lens _mUserIp (\ s a -> s{_mUserIp = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
mKey :: Lens' MarketplacedealsInsert' (Maybe Text)
mKey = lens _mKey (\ s a -> s{_mKey = a})

-- | OAuth 2.0 token for the current user.
mOauthToken :: Lens' MarketplacedealsInsert' (Maybe Text)
mOauthToken
  = lens _mOauthToken (\ s a -> s{_mOauthToken = a})

-- | OrderId for which deals need to be added.
mOrderId :: Lens' MarketplacedealsInsert' Text
mOrderId = lens _mOrderId (\ s a -> s{_mOrderId = a})

-- | Selector specifying which fields to include in a partial response.
mFields :: Lens' MarketplacedealsInsert' (Maybe Text)
mFields = lens _mFields (\ s a -> s{_mFields = a})

-- | Data format for the response.
mAlt :: Lens' MarketplacedealsInsert' Alt
mAlt = lens _mAlt (\ s a -> s{_mAlt = a})

instance GoogleRequest MarketplacedealsInsert' where
        type Rs MarketplacedealsInsert' =
             AddOrderDealsResponse
        request = requestWithRoute defReq adExchangeBuyerURL
        requestWithRoute r u MarketplacedealsInsert'{..}
          = go _mQuotaUser (Just _mPrettyPrint) _mUserIp _mKey
              _mOauthToken
              _mOrderId
              _mFields
              (Just _mAlt)
          where go
                  = clientWithRoute
                      (Proxy :: Proxy MarketplacedealsInsertResource)
                      r
                      u