{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.API.Compute.InstanceGroups.List
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Retrieves the list of instance groups that are located in the specified
-- project and zone.
--
-- /See:/ <https://developers.google.com/compute/docs/reference/latest/ Compute Engine API Reference> for @compute.instanceGroups.list@.
module Network.Google.API.Compute.InstanceGroups.List
    (
    -- * REST Resource
      InstanceGroupsListAPI

    -- * Creating a Request
    , instanceGroupsList'
    , InstanceGroupsList'

    -- * Request Lenses
    , iglQuotaUser
    , iglPrettyPrint
    , iglProject
    , iglUserIp
    , iglZone
    , iglKey
    , iglFilter
    , iglPageToken
    , iglOauthToken
    , iglMaxResults
    , iglFields
    , iglAlt
    ) where

import           Network.Google.Compute.Types
import           Network.Google.Prelude

-- | A resource alias for compute.instanceGroups.list which the
-- 'InstanceGroupsList'' request conforms to.
type InstanceGroupsListAPI =
     Capture "project" Text :>
       "zones" :>
         Capture "zone" Text :>
           "instanceGroups" :>
             QueryParam "quotaUser" Text :>
               QueryParam "prettyPrint" Bool :>
                 QueryParam "userIp" Text :>
                   QueryParam "key" Text :>
                     QueryParam "filter" Text :>
                       QueryParam "pageToken" Text :>
                         QueryParam "oauth_token" Text :>
                           QueryParam "maxResults" Word32 :>
                             QueryParam "fields" Text :>
                               QueryParam "alt" Alt :>
                                 Get '[JSON] InstanceGroupList

-- | Retrieves the list of instance groups that are located in the specified
-- project and zone.
--
-- /See:/ 'instanceGroupsList'' smart constructor.
data InstanceGroupsList' = InstanceGroupsList'
    { _iglQuotaUser   :: !(Maybe Text)
    , _iglPrettyPrint :: !Bool
    , _iglProject     :: !Text
    , _iglUserIp      :: !(Maybe Text)
    , _iglZone        :: !Text
    , _iglKey         :: !(Maybe Text)
    , _iglFilter      :: !(Maybe Text)
    , _iglPageToken   :: !(Maybe Text)
    , _iglOauthToken  :: !(Maybe Text)
    , _iglMaxResults  :: !Word32
    , _iglFields      :: !(Maybe Text)
    , _iglAlt         :: !Alt
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'InstanceGroupsList'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'iglQuotaUser'
--
-- * 'iglPrettyPrint'
--
-- * 'iglProject'
--
-- * 'iglUserIp'
--
-- * 'iglZone'
--
-- * 'iglKey'
--
-- * 'iglFilter'
--
-- * 'iglPageToken'
--
-- * 'iglOauthToken'
--
-- * 'iglMaxResults'
--
-- * 'iglFields'
--
-- * 'iglAlt'
instanceGroupsList'
    :: Text -- ^ 'project'
    -> Text -- ^ 'zone'
    -> InstanceGroupsList'
instanceGroupsList' pIglProject_ pIglZone_ =
    InstanceGroupsList'
    { _iglQuotaUser = Nothing
    , _iglPrettyPrint = True
    , _iglProject = pIglProject_
    , _iglUserIp = Nothing
    , _iglZone = pIglZone_
    , _iglKey = Nothing
    , _iglFilter = Nothing
    , _iglPageToken = Nothing
    , _iglOauthToken = Nothing
    , _iglMaxResults = 500
    , _iglFields = Nothing
    , _iglAlt = JSON
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
iglQuotaUser :: Lens' InstanceGroupsList' (Maybe Text)
iglQuotaUser
  = lens _iglQuotaUser (\ s a -> s{_iglQuotaUser = a})

-- | Returns response with indentations and line breaks.
iglPrettyPrint :: Lens' InstanceGroupsList' Bool
iglPrettyPrint
  = lens _iglPrettyPrint
      (\ s a -> s{_iglPrettyPrint = a})

-- | The project ID for this request.
iglProject :: Lens' InstanceGroupsList' Text
iglProject
  = lens _iglProject (\ s a -> s{_iglProject = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
iglUserIp :: Lens' InstanceGroupsList' (Maybe Text)
iglUserIp
  = lens _iglUserIp (\ s a -> s{_iglUserIp = a})

-- | The URL of the zone where the instance group is located.
iglZone :: Lens' InstanceGroupsList' Text
iglZone = lens _iglZone (\ s a -> s{_iglZone = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
iglKey :: Lens' InstanceGroupsList' (Maybe Text)
iglKey = lens _iglKey (\ s a -> s{_iglKey = a})

-- | Sets a filter expression for filtering listed resources, in the form
-- filter={expression}. Your {expression} must be in the format: FIELD_NAME
-- COMPARISON_STRING LITERAL_STRING. The FIELD_NAME is the name of the
-- field you want to compare. Only atomic field types are supported
-- (string, number, boolean). The COMPARISON_STRING must be either eq
-- (equals) or ne (not equals). The LITERAL_STRING is the string value to
-- filter to. The literal value must be valid for the type of field
-- (string, number, boolean). For string fields, the literal value is
-- interpreted as a regular expression using RE2 syntax. The literal value
-- must match the entire field. For example, filter=name ne
-- example-instance.
iglFilter :: Lens' InstanceGroupsList' (Maybe Text)
iglFilter
  = lens _iglFilter (\ s a -> s{_iglFilter = a})

-- | Specifies a page token to use. Use this parameter if you want to list
-- the next page of results. Set pageToken to the nextPageToken returned by
-- a previous list request.
iglPageToken :: Lens' InstanceGroupsList' (Maybe Text)
iglPageToken
  = lens _iglPageToken (\ s a -> s{_iglPageToken = a})

-- | OAuth 2.0 token for the current user.
iglOauthToken :: Lens' InstanceGroupsList' (Maybe Text)
iglOauthToken
  = lens _iglOauthToken
      (\ s a -> s{_iglOauthToken = a})

-- | Maximum count of results to be returned.
iglMaxResults :: Lens' InstanceGroupsList' Word32
iglMaxResults
  = lens _iglMaxResults
      (\ s a -> s{_iglMaxResults = a})

-- | Selector specifying which fields to include in a partial response.
iglFields :: Lens' InstanceGroupsList' (Maybe Text)
iglFields
  = lens _iglFields (\ s a -> s{_iglFields = a})

-- | Data format for the response.
iglAlt :: Lens' InstanceGroupsList' Alt
iglAlt = lens _iglAlt (\ s a -> s{_iglAlt = a})

instance GoogleRequest InstanceGroupsList' where
        type Rs InstanceGroupsList' = InstanceGroupList
        request = requestWithRoute defReq computeURL
        requestWithRoute r u InstanceGroupsList'{..}
          = go _iglQuotaUser (Just _iglPrettyPrint) _iglProject
              _iglUserIp
              _iglZone
              _iglKey
              _iglFilter
              _iglPageToken
              _iglOauthToken
              (Just _iglMaxResults)
              _iglFields
              (Just _iglAlt)
          where go
                  = clientWithRoute
                      (Proxy :: Proxy InstanceGroupsListAPI)
                      r
                      u