{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Network.Google.CloudDatastore.Types.Product
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Network.Google.CloudDatastore.Types.Product where

import           Network.Google.CloudDatastore.Types.Sum
import           Network.Google.Prelude

--
-- /See:/ 'allocateIdsRequest' smart constructor.
newtype AllocateIdsRequest = AllocateIdsRequest
    { _airKeys :: Maybe [Maybe Key]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'AllocateIdsRequest' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'airKeys'
allocateIdsRequest
    :: AllocateIdsRequest
allocateIdsRequest =
    AllocateIdsRequest
    { _airKeys = Nothing
    }

-- | A list of keys with incomplete key paths to allocate IDs for. No key may
-- be reserved\/read-only.
airKeys :: Lens' AllocateIdsRequest [Maybe Key]
airKeys
  = lens _airKeys (\ s a -> s{_airKeys = a}) . _Default
      . _Coerce

--
-- /See:/ 'allocateIdsResponse' smart constructor.
data AllocateIdsResponse = AllocateIdsResponse
    { _aKeys   :: !(Maybe [Maybe Key])
    , _aHeader :: !(Maybe (Maybe ResponseHeader))
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'AllocateIdsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'aKeys'
--
-- * 'aHeader'
allocateIdsResponse
    :: AllocateIdsResponse
allocateIdsResponse =
    AllocateIdsResponse
    { _aKeys = Nothing
    , _aHeader = Nothing
    }

-- | The keys specified in the request (in the same order), each with its key
-- path completed with a newly allocated ID.
aKeys :: Lens' AllocateIdsResponse [Maybe Key]
aKeys
  = lens _aKeys (\ s a -> s{_aKeys = a}) . _Default .
      _Coerce

aHeader :: Lens' AllocateIdsResponse (Maybe (Maybe ResponseHeader))
aHeader = lens _aHeader (\ s a -> s{_aHeader = a})

--
-- /See:/ 'beginTransactionRequest' smart constructor.
newtype BeginTransactionRequest = BeginTransactionRequest
    { _btrIsolationLevel :: Maybe BeginTransactionRequestIsolationLevel
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'BeginTransactionRequest' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'btrIsolationLevel'
beginTransactionRequest
    :: BeginTransactionRequest
beginTransactionRequest =
    BeginTransactionRequest
    { _btrIsolationLevel = Nothing
    }

-- | The transaction isolation level. Either snapshot or serializable. The
-- default isolation level is snapshot isolation, which means that another
-- transaction may not concurrently modify the data that is modified by
-- this transaction. Optionally, a transaction can request to be made
-- serializable which means that another transaction cannot concurrently
-- modify the data that is read or modified by this transaction.
btrIsolationLevel :: Lens' BeginTransactionRequest (Maybe BeginTransactionRequestIsolationLevel)
btrIsolationLevel
  = lens _btrIsolationLevel
      (\ s a -> s{_btrIsolationLevel = a})

--
-- /See:/ 'beginTransactionResponse' smart constructor.
data BeginTransactionResponse = BeginTransactionResponse
    { _btrTransaction :: !(Maybe Word8)
    , _btrHeader      :: !(Maybe (Maybe ResponseHeader))
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'BeginTransactionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'btrTransaction'
--
-- * 'btrHeader'
beginTransactionResponse
    :: BeginTransactionResponse
beginTransactionResponse =
    BeginTransactionResponse
    { _btrTransaction = Nothing
    , _btrHeader = Nothing
    }

-- | The transaction identifier (always present).
btrTransaction :: Lens' BeginTransactionResponse (Maybe Word8)
btrTransaction
  = lens _btrTransaction
      (\ s a -> s{_btrTransaction = a})

btrHeader :: Lens' BeginTransactionResponse (Maybe (Maybe ResponseHeader))
btrHeader
  = lens _btrHeader (\ s a -> s{_btrHeader = a})

--
-- /See:/ 'commitRequest' smart constructor.
data CommitRequest = CommitRequest
    { _crMode           :: !(Maybe CommitRequestMode)
    , _crMutation       :: !(Maybe (Maybe Mutation))
    , _crTransaction    :: !(Maybe Word8)
    , _crIgnoreReadOnly :: !(Maybe Bool)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CommitRequest' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'crMode'
--
-- * 'crMutation'
--
-- * 'crTransaction'
--
-- * 'crIgnoreReadOnly'
commitRequest
    :: CommitRequest
commitRequest =
    CommitRequest
    { _crMode = Nothing
    , _crMutation = Nothing
    , _crTransaction = Nothing
    , _crIgnoreReadOnly = Nothing
    }

-- | The type of commit to perform. Either TRANSACTIONAL or
-- NON_TRANSACTIONAL.
crMode :: Lens' CommitRequest (Maybe CommitRequestMode)
crMode = lens _crMode (\ s a -> s{_crMode = a})

-- | The mutation to perform. Optional.
crMutation :: Lens' CommitRequest (Maybe (Maybe Mutation))
crMutation
  = lens _crMutation (\ s a -> s{_crMutation = a})

-- | The transaction identifier, returned by a call to beginTransaction. Must
-- be set when mode is TRANSACTIONAL.
crTransaction :: Lens' CommitRequest (Maybe Word8)
crTransaction
  = lens _crTransaction
      (\ s a -> s{_crTransaction = a})

crIgnoreReadOnly :: Lens' CommitRequest (Maybe Bool)
crIgnoreReadOnly
  = lens _crIgnoreReadOnly
      (\ s a -> s{_crIgnoreReadOnly = a})

--
-- /See:/ 'commitResponse' smart constructor.
data CommitResponse = CommitResponse
    { _crMutationResult :: !(Maybe (Maybe MutationResult))
    , _crHeader         :: !(Maybe (Maybe ResponseHeader))
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CommitResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'crMutationResult'
--
-- * 'crHeader'
commitResponse
    :: CommitResponse
commitResponse =
    CommitResponse
    { _crMutationResult = Nothing
    , _crHeader = Nothing
    }

-- | The result of performing the mutation (if any).
crMutationResult :: Lens' CommitResponse (Maybe (Maybe MutationResult))
crMutationResult
  = lens _crMutationResult
      (\ s a -> s{_crMutationResult = a})

crHeader :: Lens' CommitResponse (Maybe (Maybe ResponseHeader))
crHeader = lens _crHeader (\ s a -> s{_crHeader = a})

-- | A filter that merges the multiple other filters using the given
-- operation.
--
-- /See:/ 'compositeFilter' smart constructor.
data CompositeFilter = CompositeFilter
    { _cfOperator :: !(Maybe CompositeFilterOperator)
    , _cfFilters  :: !(Maybe [Maybe Filter])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CompositeFilter' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cfOperator'
--
-- * 'cfFilters'
compositeFilter
    :: CompositeFilter
compositeFilter =
    CompositeFilter
    { _cfOperator = Nothing
    , _cfFilters = Nothing
    }

-- | The operator for combining multiple filters. Only \"and\" is currently
-- supported.
cfOperator :: Lens' CompositeFilter (Maybe CompositeFilterOperator)
cfOperator
  = lens _cfOperator (\ s a -> s{_cfOperator = a})

-- | The list of filters to combine. Must contain at least one filter.
cfFilters :: Lens' CompositeFilter [Maybe Filter]
cfFilters
  = lens _cfFilters (\ s a -> s{_cfFilters = a}) .
      _Default
      . _Coerce

-- | An entity.
--
-- /See:/ 'entity' smart constructor.
data Entity = Entity
    { _eKey        :: !(Maybe (Maybe Key))
    , _eProperties :: !(Maybe EntityProperties)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Entity' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'eKey'
--
-- * 'eProperties'
entity
    :: Entity
entity =
    Entity
    { _eKey = Nothing
    , _eProperties = Nothing
    }

-- | The entity\'s key. An entity must have a key, unless otherwise
-- documented (for example, an entity in Value.entityValue may have no
-- key). An entity\'s kind is its key\'s path\'s last element\'s kind, or
-- null if it has no key.
eKey :: Lens' Entity (Maybe (Maybe Key))
eKey = lens _eKey (\ s a -> s{_eKey = a})

-- | The entity\'s properties.
eProperties :: Lens' Entity (Maybe EntityProperties)
eProperties
  = lens _eProperties (\ s a -> s{_eProperties = a})

-- | The entity\'s properties.
--
-- /See:/ 'entityProperties' smart constructor.
data EntityProperties =
    EntityProperties
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'EntityProperties' with the minimum fields required to make a request.
--
entityProperties
    :: EntityProperties
entityProperties = EntityProperties

-- | The result of fetching an entity from the datastore.
--
-- /See:/ 'entityResult' smart constructor.
newtype EntityResult = EntityResult
    { _erEntity :: Maybe (Maybe Entity)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'EntityResult' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'erEntity'
entityResult
    :: EntityResult
entityResult =
    EntityResult
    { _erEntity = Nothing
    }

-- | The resulting entity.
erEntity :: Lens' EntityResult (Maybe (Maybe Entity))
erEntity = lens _erEntity (\ s a -> s{_erEntity = a})

-- | A holder for any type of filter. Exactly one field should be specified.
--
-- /See:/ 'filter'' smart constructor.
data Filter = Filter
    { _fCompositeFilter :: !(Maybe (Maybe CompositeFilter))
    , _fPropertyFilter  :: !(Maybe (Maybe PropertyFilter))
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Filter' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'fCompositeFilter'
--
-- * 'fPropertyFilter'
filter'
    :: Filter
filter' =
    Filter
    { _fCompositeFilter = Nothing
    , _fPropertyFilter = Nothing
    }

-- | A composite filter.
fCompositeFilter :: Lens' Filter (Maybe (Maybe CompositeFilter))
fCompositeFilter
  = lens _fCompositeFilter
      (\ s a -> s{_fCompositeFilter = a})

-- | A filter on a property.
fPropertyFilter :: Lens' Filter (Maybe (Maybe PropertyFilter))
fPropertyFilter
  = lens _fPropertyFilter
      (\ s a -> s{_fPropertyFilter = a})

-- | A GQL query.
--
-- /See:/ 'gqlQuery' smart constructor.
data GqlQuery = GqlQuery
    { _gqAllowLiteral :: !(Maybe Bool)
    , _gqNumberArgs   :: !(Maybe [Maybe GqlQueryArg])
    , _gqQueryString  :: !(Maybe Text)
    , _gqNameArgs     :: !(Maybe [Maybe GqlQueryArg])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GqlQuery' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gqAllowLiteral'
--
-- * 'gqNumberArgs'
--
-- * 'gqQueryString'
--
-- * 'gqNameArgs'
gqlQuery
    :: GqlQuery
gqlQuery =
    GqlQuery
    { _gqAllowLiteral = Nothing
    , _gqNumberArgs = Nothing
    , _gqQueryString = Nothing
    , _gqNameArgs = Nothing
    }

-- | When false, the query string must not contain a literal.
gqAllowLiteral :: Lens' GqlQuery (Maybe Bool)
gqAllowLiteral
  = lens _gqAllowLiteral
      (\ s a -> s{_gqAllowLiteral = a})

-- | Numbered binding site \'1 references the first numbered argument,
-- effectively using 1-based indexing, rather than the usual 0. A numbered
-- argument must NOT set field GqlQueryArg.name. For each binding site
-- numbered i in query_string, there must be an ith numbered argument. The
-- inverse must also be true.
gqNumberArgs :: Lens' GqlQuery [Maybe GqlQueryArg]
gqNumberArgs
  = lens _gqNumberArgs (\ s a -> s{_gqNumberArgs = a})
      . _Default
      . _Coerce

-- | The query string.
gqQueryString :: Lens' GqlQuery (Maybe Text)
gqQueryString
  = lens _gqQueryString
      (\ s a -> s{_gqQueryString = a})

-- | A named argument must set field GqlQueryArg.name. No two named arguments
-- may have the same name. For each non-reserved named binding site in the
-- query string, there must be a named argument with that name, but not
-- necessarily the inverse.
gqNameArgs :: Lens' GqlQuery [Maybe GqlQueryArg]
gqNameArgs
  = lens _gqNameArgs (\ s a -> s{_gqNameArgs = a}) .
      _Default
      . _Coerce

-- | A binding argument for a GQL query.
--
-- /See:/ 'gqlQueryArg' smart constructor.
data GqlQueryArg = GqlQueryArg
    { _gqaCursor :: !(Maybe Word8)
    , _gqaValue  :: !(Maybe (Maybe Value))
    , _gqaName   :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GqlQueryArg' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gqaCursor'
--
-- * 'gqaValue'
--
-- * 'gqaName'
gqlQueryArg
    :: GqlQueryArg
gqlQueryArg =
    GqlQueryArg
    { _gqaCursor = Nothing
    , _gqaValue = Nothing
    , _gqaName = Nothing
    }

gqaCursor :: Lens' GqlQueryArg (Maybe Word8)
gqaCursor
  = lens _gqaCursor (\ s a -> s{_gqaCursor = a})

gqaValue :: Lens' GqlQueryArg (Maybe (Maybe Value))
gqaValue = lens _gqaValue (\ s a -> s{_gqaValue = a})

-- | Must match regex \"[A-Za-z_$][A-Za-z_$0-9]*\". Must not match regex
-- \"__.*__\". Must not be \"\".
gqaName :: Lens' GqlQueryArg (Maybe Text)
gqaName = lens _gqaName (\ s a -> s{_gqaName = a})

-- | A unique identifier for an entity.
--
-- /See:/ 'key' smart constructor.
data Key = Key
    { _keyPartitionId :: !(Maybe (Maybe PartitionId))
    , _keyPath        :: !(Maybe [Maybe KeyPathElement])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Key' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'keyPartitionId'
--
-- * 'keyPath'
key
    :: Key
key =
    Key
    { _keyPartitionId = Nothing
    , _keyPath = Nothing
    }

-- | Entities are partitioned into subsets, currently identified by a dataset
-- (usually implicitly specified by the project) and namespace ID. Queries
-- are scoped to a single partition.
keyPartitionId :: Lens' Key (Maybe (Maybe PartitionId))
keyPartitionId
  = lens _keyPartitionId
      (\ s a -> s{_keyPartitionId = a})

-- | The entity path. An entity path consists of one or more elements
-- composed of a kind and a string or numerical identifier, which identify
-- entities. The first element identifies a root entity, the second element
-- identifies a child of the root entity, the third element a child of the
-- second entity, and so forth. The entities identified by all prefixes of
-- the path are called the element\'s ancestors. An entity path is always
-- fully complete: ALL of the entity\'s ancestors are required to be in the
-- path along with the entity identifier itself. The only exception is that
-- in some documented cases, the identifier in the last path element (for
-- the entity) itself may be omitted. A path can never be empty. The path
-- can have at most 100 elements.
keyPath :: Lens' Key [Maybe KeyPathElement]
keyPath
  = lens _keyPath (\ s a -> s{_keyPath = a}) . _Default
      . _Coerce

-- | A (kind, ID\/name) pair used to construct a key path. At most one of
-- name or ID may be set. If either is set, the element is complete. If
-- neither is set, the element is incomplete.
--
-- /See:/ 'keyPathElement' smart constructor.
data KeyPathElement = KeyPathElement
    { _kpeKind :: !(Maybe Text)
    , _kpeName :: !(Maybe Text)
    , _kpeId   :: !(Maybe Int64)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'KeyPathElement' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'kpeKind'
--
-- * 'kpeName'
--
-- * 'kpeId'
keyPathElement
    :: KeyPathElement
keyPathElement =
    KeyPathElement
    { _kpeKind = Nothing
    , _kpeName = Nothing
    , _kpeId = Nothing
    }

-- | The kind of the entity. A kind matching regex \"__.*__\" is
-- reserved\/read-only. A kind must not contain more than 500 characters.
-- Cannot be \"\".
kpeKind :: Lens' KeyPathElement (Maybe Text)
kpeKind = lens _kpeKind (\ s a -> s{_kpeKind = a})

-- | The name of the entity. A name matching regex \"__.*__\" is
-- reserved\/read-only. A name must not be more than 500 characters. Cannot
-- be \"\".
kpeName :: Lens' KeyPathElement (Maybe Text)
kpeName = lens _kpeName (\ s a -> s{_kpeName = a})

-- | The ID of the entity. Never equal to zero. Values less than zero are
-- discouraged and will not be supported in the future.
kpeId :: Lens' KeyPathElement (Maybe Int64)
kpeId = lens _kpeId (\ s a -> s{_kpeId = a})

-- | A representation of a kind.
--
-- /See:/ 'kindExpression' smart constructor.
newtype KindExpression = KindExpression
    { _keName :: Maybe Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'KindExpression' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'keName'
kindExpression
    :: KindExpression
kindExpression =
    KindExpression
    { _keName = Nothing
    }

-- | The name of the kind.
keName :: Lens' KindExpression (Maybe Text)
keName = lens _keName (\ s a -> s{_keName = a})

--
-- /See:/ 'lookupRequest' smart constructor.
data LookupRequest = LookupRequest
    { _lrKeys        :: !(Maybe [Maybe Key])
    , _lrReadOptions :: !(Maybe (Maybe ReadOptions))
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'LookupRequest' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lrKeys'
--
-- * 'lrReadOptions'
lookupRequest
    :: LookupRequest
lookupRequest =
    LookupRequest
    { _lrKeys = Nothing
    , _lrReadOptions = Nothing
    }

-- | Keys of entities to look up from the datastore.
lrKeys :: Lens' LookupRequest [Maybe Key]
lrKeys
  = lens _lrKeys (\ s a -> s{_lrKeys = a}) . _Default .
      _Coerce

-- | Options for this lookup request. Optional.
lrReadOptions :: Lens' LookupRequest (Maybe (Maybe ReadOptions))
lrReadOptions
  = lens _lrReadOptions
      (\ s a -> s{_lrReadOptions = a})

--
-- /See:/ 'lookupResponse' smart constructor.
data LookupResponse = LookupResponse
    { _lrDeferred :: !(Maybe [Maybe Key])
    , _lrFound    :: !(Maybe [Maybe EntityResult])
    , _lrMissing  :: !(Maybe [Maybe EntityResult])
    , _lrHeader   :: !(Maybe (Maybe ResponseHeader))
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'LookupResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lrDeferred'
--
-- * 'lrFound'
--
-- * 'lrMissing'
--
-- * 'lrHeader'
lookupResponse
    :: LookupResponse
lookupResponse =
    LookupResponse
    { _lrDeferred = Nothing
    , _lrFound = Nothing
    , _lrMissing = Nothing
    , _lrHeader = Nothing
    }

-- | A list of keys that were not looked up due to resource constraints.
lrDeferred :: Lens' LookupResponse [Maybe Key]
lrDeferred
  = lens _lrDeferred (\ s a -> s{_lrDeferred = a}) .
      _Default
      . _Coerce

-- | Entities found.
lrFound :: Lens' LookupResponse [Maybe EntityResult]
lrFound
  = lens _lrFound (\ s a -> s{_lrFound = a}) . _Default
      . _Coerce

-- | Entities not found, with only the key populated.
lrMissing :: Lens' LookupResponse [Maybe EntityResult]
lrMissing
  = lens _lrMissing (\ s a -> s{_lrMissing = a}) .
      _Default
      . _Coerce

lrHeader :: Lens' LookupResponse (Maybe (Maybe ResponseHeader))
lrHeader = lens _lrHeader (\ s a -> s{_lrHeader = a})

-- | A set of changes to apply.
--
-- /See:/ 'mutation' smart constructor.
data Mutation = Mutation
    { _mInsert       :: !(Maybe [Maybe Entity])
    , _mForce        :: !(Maybe Bool)
    , _mInsertAutoId :: !(Maybe [Maybe Entity])
    , _mUpsert       :: !(Maybe [Maybe Entity])
    , _mDelete       :: !(Maybe [Maybe Key])
    , _mUpdate       :: !(Maybe [Maybe Entity])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Mutation' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mInsert'
--
-- * 'mForce'
--
-- * 'mInsertAutoId'
--
-- * 'mUpsert'
--
-- * 'mDelete'
--
-- * 'mUpdate'
mutation
    :: Mutation
mutation =
    Mutation
    { _mInsert = Nothing
    , _mForce = Nothing
    , _mInsertAutoId = Nothing
    , _mUpsert = Nothing
    , _mDelete = Nothing
    , _mUpdate = Nothing
    }

-- | Entities to insert. Each inserted entity\'s key must have a complete
-- path and must not be reserved\/read-only.
mInsert :: Lens' Mutation [Maybe Entity]
mInsert
  = lens _mInsert (\ s a -> s{_mInsert = a}) . _Default
      . _Coerce

-- | Ignore a user specified read-only period. Optional.
mForce :: Lens' Mutation (Maybe Bool)
mForce = lens _mForce (\ s a -> s{_mForce = a})

-- | Insert entities with a newly allocated ID. Each inserted entity\'s key
-- must omit the final identifier in its path and must not be
-- reserved\/read-only.
mInsertAutoId :: Lens' Mutation [Maybe Entity]
mInsertAutoId
  = lens _mInsertAutoId
      (\ s a -> s{_mInsertAutoId = a})
      . _Default
      . _Coerce

-- | Entities to upsert. Each upserted entity\'s key must have a complete
-- path and must not be reserved\/read-only.
mUpsert :: Lens' Mutation [Maybe Entity]
mUpsert
  = lens _mUpsert (\ s a -> s{_mUpsert = a}) . _Default
      . _Coerce

-- | Keys of entities to delete. Each key must have a complete key path and
-- must not be reserved\/read-only.
mDelete :: Lens' Mutation [Maybe Key]
mDelete
  = lens _mDelete (\ s a -> s{_mDelete = a}) . _Default
      . _Coerce

-- | Entities to update. Each updated entity\'s key must have a complete path
-- and must not be reserved\/read-only.
mUpdate :: Lens' Mutation [Maybe Entity]
mUpdate
  = lens _mUpdate (\ s a -> s{_mUpdate = a}) . _Default
      . _Coerce

--
-- /See:/ 'mutationResult' smart constructor.
data MutationResult = MutationResult
    { _mrInsertAutoIdKeys :: !(Maybe [Maybe Key])
    , _mrIndexUpdates     :: !(Maybe Int32)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'MutationResult' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mrInsertAutoIdKeys'
--
-- * 'mrIndexUpdates'
mutationResult
    :: MutationResult
mutationResult =
    MutationResult
    { _mrInsertAutoIdKeys = Nothing
    , _mrIndexUpdates = Nothing
    }

-- | Keys for insertAutoId entities. One per entity from the request, in the
-- same order.
mrInsertAutoIdKeys :: Lens' MutationResult [Maybe Key]
mrInsertAutoIdKeys
  = lens _mrInsertAutoIdKeys
      (\ s a -> s{_mrInsertAutoIdKeys = a})
      . _Default
      . _Coerce

-- | Number of index writes.
mrIndexUpdates :: Lens' MutationResult (Maybe Int32)
mrIndexUpdates
  = lens _mrIndexUpdates
      (\ s a -> s{_mrIndexUpdates = a})

-- | An identifier for a particular subset of entities. Entities are
-- partitioned into various subsets, each used by different datasets and
-- different namespaces within a dataset and so forth.
--
-- /See:/ 'partitionId' smart constructor.
data PartitionId = PartitionId
    { _piNamespace :: !(Maybe Text)
    , _piDatasetId :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'PartitionId' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'piNamespace'
--
-- * 'piDatasetId'
partitionId
    :: PartitionId
partitionId =
    PartitionId
    { _piNamespace = Nothing
    , _piDatasetId = Nothing
    }

-- | The namespace.
piNamespace :: Lens' PartitionId (Maybe Text)
piNamespace
  = lens _piNamespace (\ s a -> s{_piNamespace = a})

-- | The dataset ID.
piDatasetId :: Lens' PartitionId (Maybe Text)
piDatasetId
  = lens _piDatasetId (\ s a -> s{_piDatasetId = a})

-- | An entity property.
--
-- /See:/ 'property' smart constructor.
data Property = Property
    { _pKeyValue      :: !(Maybe (Maybe Key))
    , _pBlobKeyValue  :: !(Maybe Text)
    , _pDateTimeValue :: !(Maybe UTCTime)
    , _pIntegerValue  :: !(Maybe Int64)
    , _pEntityValue   :: !(Maybe (Maybe Entity))
    , _pDoubleValue   :: !(Maybe Double)
    , _pStringValue   :: !(Maybe Text)
    , _pListValue     :: !(Maybe [Maybe Value])
    , _pIndexed       :: !(Maybe Bool)
    , _pBooleanValue  :: !(Maybe Bool)
    , _pMeaning       :: !(Maybe Int32)
    , _pBlobValue     :: !(Maybe Word8)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Property' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pKeyValue'
--
-- * 'pBlobKeyValue'
--
-- * 'pDateTimeValue'
--
-- * 'pIntegerValue'
--
-- * 'pEntityValue'
--
-- * 'pDoubleValue'
--
-- * 'pStringValue'
--
-- * 'pListValue'
--
-- * 'pIndexed'
--
-- * 'pBooleanValue'
--
-- * 'pMeaning'
--
-- * 'pBlobValue'
property
    :: Property
property =
    Property
    { _pKeyValue = Nothing
    , _pBlobKeyValue = Nothing
    , _pDateTimeValue = Nothing
    , _pIntegerValue = Nothing
    , _pEntityValue = Nothing
    , _pDoubleValue = Nothing
    , _pStringValue = Nothing
    , _pListValue = Nothing
    , _pIndexed = Nothing
    , _pBooleanValue = Nothing
    , _pMeaning = Nothing
    , _pBlobValue = Nothing
    }

-- | A key value.
pKeyValue :: Lens' Property (Maybe (Maybe Key))
pKeyValue
  = lens _pKeyValue (\ s a -> s{_pKeyValue = a})

-- | A blob key value.
pBlobKeyValue :: Lens' Property (Maybe Text)
pBlobKeyValue
  = lens _pBlobKeyValue
      (\ s a -> s{_pBlobKeyValue = a})

-- | A timestamp value.
pDateTimeValue :: Lens' Property (Maybe UTCTime)
pDateTimeValue
  = lens _pDateTimeValue
      (\ s a -> s{_pDateTimeValue = a})

-- | An integer value.
pIntegerValue :: Lens' Property (Maybe Int64)
pIntegerValue
  = lens _pIntegerValue
      (\ s a -> s{_pIntegerValue = a})

-- | An entity value. May have no key. May have a key with an incomplete key
-- path. May have a reserved\/read-only key.
pEntityValue :: Lens' Property (Maybe (Maybe Entity))
pEntityValue
  = lens _pEntityValue (\ s a -> s{_pEntityValue = a})

-- | A double value.
pDoubleValue :: Lens' Property (Maybe Double)
pDoubleValue
  = lens _pDoubleValue (\ s a -> s{_pDoubleValue = a})

-- | A UTF-8 encoded string value. When indexed is true, may have at most 500
-- characters.
pStringValue :: Lens' Property (Maybe Text)
pStringValue
  = lens _pStringValue (\ s a -> s{_pStringValue = a})

-- | A list value. Cannot contain another list value. A Value instance that
-- sets field list_value must not set field meaning or field indexed.
pListValue :: Lens' Property [Maybe Value]
pListValue
  = lens _pListValue (\ s a -> s{_pListValue = a}) .
      _Default
      . _Coerce

-- | If the value should be indexed. The indexed property may be set for a
-- null value. When indexed is true, stringValue is limited to 500
-- characters and the blob value is limited to 500 bytes. Input values by
-- default have indexed set to true; however, you can explicitly set
-- indexed to true if you want. (An output value never has indexed
-- explicitly set to true.) If a value is itself an entity, it cannot have
-- indexed set to true.
pIndexed :: Lens' Property (Maybe Bool)
pIndexed = lens _pIndexed (\ s a -> s{_pIndexed = a})

-- | A boolean value.
pBooleanValue :: Lens' Property (Maybe Bool)
pBooleanValue
  = lens _pBooleanValue
      (\ s a -> s{_pBooleanValue = a})

-- | The meaning field is reserved and should not be used.
pMeaning :: Lens' Property (Maybe Int32)
pMeaning = lens _pMeaning (\ s a -> s{_pMeaning = a})

-- | A blob value. May be a maximum of 1,000,000 bytes. When indexed is true,
-- may have at most 500 bytes.
pBlobValue :: Lens' Property (Maybe Word8)
pBlobValue
  = lens _pBlobValue (\ s a -> s{_pBlobValue = a})

-- | A representation of a property in a projection.
--
-- /See:/ 'propertyExpression' smart constructor.
data PropertyExpression = PropertyExpression
    { _peProperty            :: !(Maybe (Maybe PropertyReference))
    , _peAggregationFunction :: !(Maybe PropertyExpressionAggregationFunction)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'PropertyExpression' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'peProperty'
--
-- * 'peAggregationFunction'
propertyExpression
    :: PropertyExpression
propertyExpression =
    PropertyExpression
    { _peProperty = Nothing
    , _peAggregationFunction = Nothing
    }

-- | The property to project.
peProperty :: Lens' PropertyExpression (Maybe (Maybe PropertyReference))
peProperty
  = lens _peProperty (\ s a -> s{_peProperty = a})

-- | The aggregation function to apply to the property. Optional. Can only be
-- used when grouping by at least one property. Must then be set on all
-- properties in the projection that are not being grouped by. Aggregation
-- functions: first selects the first result as determined by the query\'s
-- order.
peAggregationFunction :: Lens' PropertyExpression (Maybe PropertyExpressionAggregationFunction)
peAggregationFunction
  = lens _peAggregationFunction
      (\ s a -> s{_peAggregationFunction = a})

-- | A filter on a specific property.
--
-- /See:/ 'propertyFilter' smart constructor.
data PropertyFilter = PropertyFilter
    { _pfProperty :: !(Maybe (Maybe PropertyReference))
    , _pfOperator :: !(Maybe PropertyFilterOperator)
    , _pfValue    :: !(Maybe (Maybe Value))
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'PropertyFilter' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pfProperty'
--
-- * 'pfOperator'
--
-- * 'pfValue'
propertyFilter
    :: PropertyFilter
propertyFilter =
    PropertyFilter
    { _pfProperty = Nothing
    , _pfOperator = Nothing
    , _pfValue = Nothing
    }

-- | The property to filter by.
pfProperty :: Lens' PropertyFilter (Maybe (Maybe PropertyReference))
pfProperty
  = lens _pfProperty (\ s a -> s{_pfProperty = a})

-- | The operator to filter by. One of lessThan, lessThanOrEqual,
-- greaterThan, greaterThanOrEqual, equal, or hasAncestor.
pfOperator :: Lens' PropertyFilter (Maybe PropertyFilterOperator)
pfOperator
  = lens _pfOperator (\ s a -> s{_pfOperator = a})

-- | The value to compare the property to.
pfValue :: Lens' PropertyFilter (Maybe (Maybe Value))
pfValue = lens _pfValue (\ s a -> s{_pfValue = a})

-- | The desired order for a specific property.
--
-- /See:/ 'propertyOrder' smart constructor.
data PropertyOrder = PropertyOrder
    { _poProperty  :: !(Maybe (Maybe PropertyReference))
    , _poDirection :: !(Maybe PropertyOrderDirection)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'PropertyOrder' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'poProperty'
--
-- * 'poDirection'
propertyOrder
    :: PropertyOrder
propertyOrder =
    PropertyOrder
    { _poProperty = Nothing
    , _poDirection = Nothing
    }

-- | The property to order by.
poProperty :: Lens' PropertyOrder (Maybe (Maybe PropertyReference))
poProperty
  = lens _poProperty (\ s a -> s{_poProperty = a})

-- | The direction to order by. One of ascending or descending. Optional,
-- defaults to ascending.
poDirection :: Lens' PropertyOrder (Maybe PropertyOrderDirection)
poDirection
  = lens _poDirection (\ s a -> s{_poDirection = a})

-- | A reference to a property relative to the kind expressions.
--
-- /See:/ 'propertyReference' smart constructor.
newtype PropertyReference = PropertyReference
    { _prName :: Maybe Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'PropertyReference' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'prName'
propertyReference
    :: PropertyReference
propertyReference =
    PropertyReference
    { _prName = Nothing
    }

-- | The name of the property.
prName :: Lens' PropertyReference (Maybe Text)
prName = lens _prName (\ s a -> s{_prName = a})

-- | A query.
--
-- /See:/ 'query' smart constructor.
data Query = Query
    { _qGroupBy     :: !(Maybe [Maybe PropertyReference])
    , _qStartCursor :: !(Maybe Word8)
    , _qOffset      :: !(Maybe Int32)
    , _qEndCursor   :: !(Maybe Word8)
    , _qLimit       :: !(Maybe Int32)
    , _qProjection  :: !(Maybe [Maybe PropertyExpression])
    , _qFilter      :: !(Maybe (Maybe Filter))
    , _qKinds       :: !(Maybe [Maybe KindExpression])
    , _qOrder       :: !(Maybe [Maybe PropertyOrder])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Query' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'qGroupBy'
--
-- * 'qStartCursor'
--
-- * 'qOffset'
--
-- * 'qEndCursor'
--
-- * 'qLimit'
--
-- * 'qProjection'
--
-- * 'qFilter'
--
-- * 'qKinds'
--
-- * 'qOrder'
query
    :: Query
query =
    Query
    { _qGroupBy = Nothing
    , _qStartCursor = Nothing
    , _qOffset = Nothing
    , _qEndCursor = Nothing
    , _qLimit = Nothing
    , _qProjection = Nothing
    , _qFilter = Nothing
    , _qKinds = Nothing
    , _qOrder = Nothing
    }

-- | The properties to group by (if empty, no grouping is applied to the
-- result set).
qGroupBy :: Lens' Query [Maybe PropertyReference]
qGroupBy
  = lens _qGroupBy (\ s a -> s{_qGroupBy = a}) .
      _Default
      . _Coerce

-- | A starting point for the query results. Optional. Query cursors are
-- returned in query result batches.
qStartCursor :: Lens' Query (Maybe Word8)
qStartCursor
  = lens _qStartCursor (\ s a -> s{_qStartCursor = a})

-- | The number of results to skip. Applies before limit, but after all other
-- constraints (optional, defaults to 0).
qOffset :: Lens' Query (Maybe Int32)
qOffset = lens _qOffset (\ s a -> s{_qOffset = a})

-- | An ending point for the query results. Optional. Query cursors are
-- returned in query result batches.
qEndCursor :: Lens' Query (Maybe Word8)
qEndCursor
  = lens _qEndCursor (\ s a -> s{_qEndCursor = a})

-- | The maximum number of results to return. Applies after all other
-- constraints. Optional.
qLimit :: Lens' Query (Maybe Int32)
qLimit = lens _qLimit (\ s a -> s{_qLimit = a})

-- | The projection to return. If not set the entire entity is returned.
qProjection :: Lens' Query [Maybe PropertyExpression]
qProjection
  = lens _qProjection (\ s a -> s{_qProjection = a}) .
      _Default
      . _Coerce

-- | The filter to apply (optional).
qFilter :: Lens' Query (Maybe (Maybe Filter))
qFilter = lens _qFilter (\ s a -> s{_qFilter = a})

-- | The kinds to query (if empty, returns entities from all kinds).
qKinds :: Lens' Query [Maybe KindExpression]
qKinds
  = lens _qKinds (\ s a -> s{_qKinds = a}) . _Default .
      _Coerce

-- | The order to apply to the query results (if empty, order is
-- unspecified).
qOrder :: Lens' Query [Maybe PropertyOrder]
qOrder
  = lens _qOrder (\ s a -> s{_qOrder = a}) . _Default .
      _Coerce

-- | A batch of results produced by a query.
--
-- /See:/ 'queryResultBatch' smart constructor.
data QueryResultBatch = QueryResultBatch
    { _qrbSkippedResults   :: !(Maybe Int32)
    , _qrbEntityResultType :: !(Maybe QueryResultBatchEntityResultType)
    , _qrbEntityResults    :: !(Maybe [Maybe EntityResult])
    , _qrbMoreResults      :: !(Maybe QueryResultBatchMoreResults)
    , _qrbEndCursor        :: !(Maybe Word8)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'QueryResultBatch' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'qrbSkippedResults'
--
-- * 'qrbEntityResultType'
--
-- * 'qrbEntityResults'
--
-- * 'qrbMoreResults'
--
-- * 'qrbEndCursor'
queryResultBatch
    :: QueryResultBatch
queryResultBatch =
    QueryResultBatch
    { _qrbSkippedResults = Nothing
    , _qrbEntityResultType = Nothing
    , _qrbEntityResults = Nothing
    , _qrbMoreResults = Nothing
    , _qrbEndCursor = Nothing
    }

-- | The number of results skipped because of Query.offset.
qrbSkippedResults :: Lens' QueryResultBatch (Maybe Int32)
qrbSkippedResults
  = lens _qrbSkippedResults
      (\ s a -> s{_qrbSkippedResults = a})

-- | The result type for every entity in entityResults. full for full
-- entities, projection for entities with only projected properties,
-- keyOnly for entities with only a key.
qrbEntityResultType :: Lens' QueryResultBatch (Maybe QueryResultBatchEntityResultType)
qrbEntityResultType
  = lens _qrbEntityResultType
      (\ s a -> s{_qrbEntityResultType = a})

-- | The results for this batch.
qrbEntityResults :: Lens' QueryResultBatch [Maybe EntityResult]
qrbEntityResults
  = lens _qrbEntityResults
      (\ s a -> s{_qrbEntityResults = a})
      . _Default
      . _Coerce

-- | The state of the query after the current batch. One of notFinished,
-- moreResultsAfterLimit, noMoreResults.
qrbMoreResults :: Lens' QueryResultBatch (Maybe QueryResultBatchMoreResults)
qrbMoreResults
  = lens _qrbMoreResults
      (\ s a -> s{_qrbMoreResults = a})

-- | A cursor that points to the position after the last result in the batch.
-- May be absent. TODO(arfuller): Once all plans produce cursors update
-- documentation here.
qrbEndCursor :: Lens' QueryResultBatch (Maybe Word8)
qrbEndCursor
  = lens _qrbEndCursor (\ s a -> s{_qrbEndCursor = a})

--
-- /See:/ 'readOptions' smart constructor.
data ReadOptions = ReadOptions
    { _roReadConsistency :: !(Maybe ReadOptionsReadConsistency)
    , _roTransaction     :: !(Maybe Word8)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ReadOptions' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'roReadConsistency'
--
-- * 'roTransaction'
readOptions
    :: ReadOptions
readOptions =
    ReadOptions
    { _roReadConsistency = Nothing
    , _roTransaction = Nothing
    }

-- | The read consistency to use. One of default, strong, or eventual. Cannot
-- be set when transaction is set. Lookup and ancestor queries default to
-- strong, global queries default to eventual and cannot be set to strong.
-- Optional. Default is default.
roReadConsistency :: Lens' ReadOptions (Maybe ReadOptionsReadConsistency)
roReadConsistency
  = lens _roReadConsistency
      (\ s a -> s{_roReadConsistency = a})

-- | The transaction to use. Optional.
roTransaction :: Lens' ReadOptions (Maybe Word8)
roTransaction
  = lens _roTransaction
      (\ s a -> s{_roTransaction = a})

--
-- /See:/ 'responseHeader' smart constructor.
newtype ResponseHeader = ResponseHeader
    { _rhKind :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ResponseHeader' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rhKind'
responseHeader
    :: ResponseHeader
responseHeader =
    ResponseHeader
    { _rhKind = "datastore#responseHeader"
    }

-- | Identifies what kind of resource this is. Value: the fixed string
-- \"datastore#responseHeader\".
rhKind :: Lens' ResponseHeader Text
rhKind = lens _rhKind (\ s a -> s{_rhKind = a})

--
-- /See:/ 'rollbackRequest' smart constructor.
newtype RollbackRequest = RollbackRequest
    { _rrTransaction :: Maybe Word8
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'RollbackRequest' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rrTransaction'
rollbackRequest
    :: RollbackRequest
rollbackRequest =
    RollbackRequest
    { _rrTransaction = Nothing
    }

-- | The transaction identifier, returned by a call to beginTransaction.
rrTransaction :: Lens' RollbackRequest (Maybe Word8)
rrTransaction
  = lens _rrTransaction
      (\ s a -> s{_rrTransaction = a})

--
-- /See:/ 'rollbackResponse' smart constructor.
newtype RollbackResponse = RollbackResponse
    { _rrHeader :: Maybe (Maybe ResponseHeader)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'RollbackResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rrHeader'
rollbackResponse
    :: RollbackResponse
rollbackResponse =
    RollbackResponse
    { _rrHeader = Nothing
    }

rrHeader :: Lens' RollbackResponse (Maybe (Maybe ResponseHeader))
rrHeader = lens _rrHeader (\ s a -> s{_rrHeader = a})

--
-- /See:/ 'runQueryRequest' smart constructor.
data RunQueryRequest = RunQueryRequest
    { _rqrPartitionId :: !(Maybe (Maybe PartitionId))
    , _rqrGqlQuery    :: !(Maybe (Maybe GqlQuery))
    , _rqrQuery       :: !(Maybe (Maybe Query))
    , _rqrReadOptions :: !(Maybe (Maybe ReadOptions))
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'RunQueryRequest' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rqrPartitionId'
--
-- * 'rqrGqlQuery'
--
-- * 'rqrQuery'
--
-- * 'rqrReadOptions'
runQueryRequest
    :: RunQueryRequest
runQueryRequest =
    RunQueryRequest
    { _rqrPartitionId = Nothing
    , _rqrGqlQuery = Nothing
    , _rqrQuery = Nothing
    , _rqrReadOptions = Nothing
    }

-- | Entities are partitioned into subsets, identified by a dataset (usually
-- implicitly specified by the project) and namespace ID. Queries are
-- scoped to a single partition. This partition ID is normalized with the
-- standard default context partition ID, but all other partition IDs in
-- RunQueryRequest are normalized with this partition ID as the context
-- partition ID.
rqrPartitionId :: Lens' RunQueryRequest (Maybe (Maybe PartitionId))
rqrPartitionId
  = lens _rqrPartitionId
      (\ s a -> s{_rqrPartitionId = a})

-- | The GQL query to run. Either this field or field query must be set, but
-- not both.
rqrGqlQuery :: Lens' RunQueryRequest (Maybe (Maybe GqlQuery))
rqrGqlQuery
  = lens _rqrGqlQuery (\ s a -> s{_rqrGqlQuery = a})

-- | The query to run. Either this field or field gql_query must be set, but
-- not both.
rqrQuery :: Lens' RunQueryRequest (Maybe (Maybe Query))
rqrQuery = lens _rqrQuery (\ s a -> s{_rqrQuery = a})

-- | The options for this query.
rqrReadOptions :: Lens' RunQueryRequest (Maybe (Maybe ReadOptions))
rqrReadOptions
  = lens _rqrReadOptions
      (\ s a -> s{_rqrReadOptions = a})

--
-- /See:/ 'runQueryResponse' smart constructor.
data RunQueryResponse = RunQueryResponse
    { _rqrBatch  :: !(Maybe (Maybe QueryResultBatch))
    , _rqrHeader :: !(Maybe (Maybe ResponseHeader))
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'RunQueryResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rqrBatch'
--
-- * 'rqrHeader'
runQueryResponse
    :: RunQueryResponse
runQueryResponse =
    RunQueryResponse
    { _rqrBatch = Nothing
    , _rqrHeader = Nothing
    }

-- | A batch of query results (always present).
rqrBatch :: Lens' RunQueryResponse (Maybe (Maybe QueryResultBatch))
rqrBatch = lens _rqrBatch (\ s a -> s{_rqrBatch = a})

rqrHeader :: Lens' RunQueryResponse (Maybe (Maybe ResponseHeader))
rqrHeader
  = lens _rqrHeader (\ s a -> s{_rqrHeader = a})

-- | A message that can hold any of the supported value types and associated
-- metadata.
--
-- /See:/ 'value' smart constructor.
data Value = Value
    { _vKeyValue      :: !(Maybe (Maybe Key))
    , _vBlobKeyValue  :: !(Maybe Text)
    , _vDateTimeValue :: !(Maybe UTCTime)
    , _vIntegerValue  :: !(Maybe Int64)
    , _vEntityValue   :: !(Maybe (Maybe Entity))
    , _vDoubleValue   :: !(Maybe Double)
    , _vStringValue   :: !(Maybe Text)
    , _vListValue     :: !(Maybe [Maybe Value])
    , _vIndexed       :: !(Maybe Bool)
    , _vBooleanValue  :: !(Maybe Bool)
    , _vMeaning       :: !(Maybe Int32)
    , _vBlobValue     :: !(Maybe Word8)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Value' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'vKeyValue'
--
-- * 'vBlobKeyValue'
--
-- * 'vDateTimeValue'
--
-- * 'vIntegerValue'
--
-- * 'vEntityValue'
--
-- * 'vDoubleValue'
--
-- * 'vStringValue'
--
-- * 'vListValue'
--
-- * 'vIndexed'
--
-- * 'vBooleanValue'
--
-- * 'vMeaning'
--
-- * 'vBlobValue'
value
    :: Value
value =
    Value
    { _vKeyValue = Nothing
    , _vBlobKeyValue = Nothing
    , _vDateTimeValue = Nothing
    , _vIntegerValue = Nothing
    , _vEntityValue = Nothing
    , _vDoubleValue = Nothing
    , _vStringValue = Nothing
    , _vListValue = Nothing
    , _vIndexed = Nothing
    , _vBooleanValue = Nothing
    , _vMeaning = Nothing
    , _vBlobValue = Nothing
    }

-- | A key value.
vKeyValue :: Lens' Value (Maybe (Maybe Key))
vKeyValue
  = lens _vKeyValue (\ s a -> s{_vKeyValue = a})

-- | A blob key value.
vBlobKeyValue :: Lens' Value (Maybe Text)
vBlobKeyValue
  = lens _vBlobKeyValue
      (\ s a -> s{_vBlobKeyValue = a})

-- | A timestamp value.
vDateTimeValue :: Lens' Value (Maybe UTCTime)
vDateTimeValue
  = lens _vDateTimeValue
      (\ s a -> s{_vDateTimeValue = a})

-- | An integer value.
vIntegerValue :: Lens' Value (Maybe Int64)
vIntegerValue
  = lens _vIntegerValue
      (\ s a -> s{_vIntegerValue = a})

-- | An entity value. May have no key. May have a key with an incomplete key
-- path. May have a reserved\/read-only key.
vEntityValue :: Lens' Value (Maybe (Maybe Entity))
vEntityValue
  = lens _vEntityValue (\ s a -> s{_vEntityValue = a})

-- | A double value.
vDoubleValue :: Lens' Value (Maybe Double)
vDoubleValue
  = lens _vDoubleValue (\ s a -> s{_vDoubleValue = a})

-- | A UTF-8 encoded string value. When indexed is true, may have at most 500
-- characters.
vStringValue :: Lens' Value (Maybe Text)
vStringValue
  = lens _vStringValue (\ s a -> s{_vStringValue = a})

-- | A list value. Cannot contain another list value. A Value instance that
-- sets field list_value must not set field meaning or field indexed.
vListValue :: Lens' Value [Maybe Value]
vListValue
  = lens _vListValue (\ s a -> s{_vListValue = a}) .
      _Default
      . _Coerce

-- | If the value should be indexed. The indexed property may be set for a
-- null value. When indexed is true, stringValue is limited to 500
-- characters and the blob value is limited to 500 bytes. Input values by
-- default have indexed set to true; however, you can explicitly set
-- indexed to true if you want. (An output value never has indexed
-- explicitly set to true.) If a value is itself an entity, it cannot have
-- indexed set to true.
vIndexed :: Lens' Value (Maybe Bool)
vIndexed = lens _vIndexed (\ s a -> s{_vIndexed = a})

-- | A boolean value.
vBooleanValue :: Lens' Value (Maybe Bool)
vBooleanValue
  = lens _vBooleanValue
      (\ s a -> s{_vBooleanValue = a})

-- | The meaning field is reserved and should not be used.
vMeaning :: Lens' Value (Maybe Int32)
vMeaning = lens _vMeaning (\ s a -> s{_vMeaning = a})

-- | A blob value. May be a maximum of 1,000,000 bytes. When indexed is true,
-- may have at most 500 bytes.
vBlobValue :: Lens' Value (Maybe Word8)
vBlobValue
  = lens _vBlobValue (\ s a -> s{_vBlobValue = a})
