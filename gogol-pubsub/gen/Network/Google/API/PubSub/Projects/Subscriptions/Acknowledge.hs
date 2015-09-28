{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.API.PubSub.Projects.Subscriptions.Acknowledge
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Acknowledges the messages associated with the ack tokens in the
-- AcknowledgeRequest. The Pub\/Sub system can remove the relevant messages
-- from the subscription. Acknowledging a message whose ack deadline has
-- expired may succeed, but such a message may be redelivered later.
-- Acknowledging a message more than once will not result in an error.
--
-- /See:/ <https://cloud.google.com/pubsub/docs Google Cloud Pub/Sub API Reference> for @pubsub.projects.subscriptions.acknowledge@.
module Network.Google.API.PubSub.Projects.Subscriptions.Acknowledge
    (
    -- * REST Resource
      ProjectsSubscriptionsAcknowledgeAPI

    -- * Creating a Request
    , projectsSubscriptionsAcknowledge'
    , ProjectsSubscriptionsAcknowledge'

    -- * Request Lenses
    , psaXgafv
    , psaQuotaUser
    , psaPrettyPrint
    , psaUploadProtocol
    , psaPp
    , psaAccessToken
    , psaUploadType
    , psaBearerToken
    , psaKey
    , psaOauthToken
    , psaSubscription
    , psaFields
    , psaCallback
    , psaAlt
    ) where

import           Network.Google.Prelude
import           Network.Google.PubSub.Types

-- | A resource alias for pubsub.projects.subscriptions.acknowledge which the
-- 'ProjectsSubscriptionsAcknowledge'' request conforms to.
type ProjectsSubscriptionsAcknowledgeAPI =
     "v1beta2" :>
       "{+subscription}:acknowledge" :>
         QueryParam "$.xgafv" Text :>
           QueryParam "quotaUser" Text :>
             QueryParam "prettyPrint" Bool :>
               QueryParam "upload_protocol" Text :>
                 QueryParam "pp" Bool :>
                   QueryParam "access_token" Text :>
                     QueryParam "uploadType" Text :>
                       QueryParam "bearer_token" Text :>
                         QueryParam "key" Text :>
                           QueryParam "oauth_token" Text :>
                             QueryParam "fields" Text :>
                               QueryParam "callback" Text :>
                                 QueryParam "alt" Text :> Post '[JSON] Empty

-- | Acknowledges the messages associated with the ack tokens in the
-- AcknowledgeRequest. The Pub\/Sub system can remove the relevant messages
-- from the subscription. Acknowledging a message whose ack deadline has
-- expired may succeed, but such a message may be redelivered later.
-- Acknowledging a message more than once will not result in an error.
--
-- /See:/ 'projectsSubscriptionsAcknowledge'' smart constructor.
data ProjectsSubscriptionsAcknowledge' = ProjectsSubscriptionsAcknowledge'
    { _psaXgafv          :: !(Maybe Text)
    , _psaQuotaUser      :: !(Maybe Text)
    , _psaPrettyPrint    :: !Bool
    , _psaUploadProtocol :: !(Maybe Text)
    , _psaPp             :: !Bool
    , _psaAccessToken    :: !(Maybe Text)
    , _psaUploadType     :: !(Maybe Text)
    , _psaBearerToken    :: !(Maybe Text)
    , _psaKey            :: !(Maybe Text)
    , _psaOauthToken     :: !(Maybe Text)
    , _psaSubscription   :: !Text
    , _psaFields         :: !(Maybe Text)
    , _psaCallback       :: !(Maybe Text)
    , _psaAlt            :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ProjectsSubscriptionsAcknowledge'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'psaXgafv'
--
-- * 'psaQuotaUser'
--
-- * 'psaPrettyPrint'
--
-- * 'psaUploadProtocol'
--
-- * 'psaPp'
--
-- * 'psaAccessToken'
--
-- * 'psaUploadType'
--
-- * 'psaBearerToken'
--
-- * 'psaKey'
--
-- * 'psaOauthToken'
--
-- * 'psaSubscription'
--
-- * 'psaFields'
--
-- * 'psaCallback'
--
-- * 'psaAlt'
projectsSubscriptionsAcknowledge'
    :: Text -- ^ 'subscription'
    -> ProjectsSubscriptionsAcknowledge'
projectsSubscriptionsAcknowledge' pPsaSubscription_ =
    ProjectsSubscriptionsAcknowledge'
    { _psaXgafv = Nothing
    , _psaQuotaUser = Nothing
    , _psaPrettyPrint = True
    , _psaUploadProtocol = Nothing
    , _psaPp = True
    , _psaAccessToken = Nothing
    , _psaUploadType = Nothing
    , _psaBearerToken = Nothing
    , _psaKey = Nothing
    , _psaOauthToken = Nothing
    , _psaSubscription = pPsaSubscription_
    , _psaFields = Nothing
    , _psaCallback = Nothing
    , _psaAlt = "json"
    }

-- | V1 error format.
psaXgafv :: Lens' ProjectsSubscriptionsAcknowledge' (Maybe Text)
psaXgafv = lens _psaXgafv (\ s a -> s{_psaXgafv = a})

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters.
psaQuotaUser :: Lens' ProjectsSubscriptionsAcknowledge' (Maybe Text)
psaQuotaUser
  = lens _psaQuotaUser (\ s a -> s{_psaQuotaUser = a})

-- | Returns response with indentations and line breaks.
psaPrettyPrint :: Lens' ProjectsSubscriptionsAcknowledge' Bool
psaPrettyPrint
  = lens _psaPrettyPrint
      (\ s a -> s{_psaPrettyPrint = a})

-- | Upload protocol for media (e.g. \"raw\", \"multipart\").
psaUploadProtocol :: Lens' ProjectsSubscriptionsAcknowledge' (Maybe Text)
psaUploadProtocol
  = lens _psaUploadProtocol
      (\ s a -> s{_psaUploadProtocol = a})

-- | Pretty-print response.
psaPp :: Lens' ProjectsSubscriptionsAcknowledge' Bool
psaPp = lens _psaPp (\ s a -> s{_psaPp = a})

-- | OAuth access token.
psaAccessToken :: Lens' ProjectsSubscriptionsAcknowledge' (Maybe Text)
psaAccessToken
  = lens _psaAccessToken
      (\ s a -> s{_psaAccessToken = a})

-- | Legacy upload protocol for media (e.g. \"media\", \"multipart\").
psaUploadType :: Lens' ProjectsSubscriptionsAcknowledge' (Maybe Text)
psaUploadType
  = lens _psaUploadType
      (\ s a -> s{_psaUploadType = a})

-- | OAuth bearer token.
psaBearerToken :: Lens' ProjectsSubscriptionsAcknowledge' (Maybe Text)
psaBearerToken
  = lens _psaBearerToken
      (\ s a -> s{_psaBearerToken = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
psaKey :: Lens' ProjectsSubscriptionsAcknowledge' (Maybe Text)
psaKey = lens _psaKey (\ s a -> s{_psaKey = a})

-- | OAuth 2.0 token for the current user.
psaOauthToken :: Lens' ProjectsSubscriptionsAcknowledge' (Maybe Text)
psaOauthToken
  = lens _psaOauthToken
      (\ s a -> s{_psaOauthToken = a})

-- | The subscription whose message is being acknowledged.
psaSubscription :: Lens' ProjectsSubscriptionsAcknowledge' Text
psaSubscription
  = lens _psaSubscription
      (\ s a -> s{_psaSubscription = a})

-- | Selector specifying which fields to include in a partial response.
psaFields :: Lens' ProjectsSubscriptionsAcknowledge' (Maybe Text)
psaFields
  = lens _psaFields (\ s a -> s{_psaFields = a})

-- | JSONP
psaCallback :: Lens' ProjectsSubscriptionsAcknowledge' (Maybe Text)
psaCallback
  = lens _psaCallback (\ s a -> s{_psaCallback = a})

-- | Data format for response.
psaAlt :: Lens' ProjectsSubscriptionsAcknowledge' Text
psaAlt = lens _psaAlt (\ s a -> s{_psaAlt = a})

instance GoogleRequest
         ProjectsSubscriptionsAcknowledge' where
        type Rs ProjectsSubscriptionsAcknowledge' = Empty
        request = requestWithRoute defReq pubSubURL
        requestWithRoute r u
          ProjectsSubscriptionsAcknowledge'{..}
          = go _psaXgafv _psaQuotaUser (Just _psaPrettyPrint)
              _psaUploadProtocol
              (Just _psaPp)
              _psaAccessToken
              _psaUploadType
              _psaBearerToken
              _psaKey
              _psaOauthToken
              _psaSubscription
              _psaFields
              _psaCallback
              (Just _psaAlt)
          where go
                  = clientWithRoute
                      (Proxy :: Proxy ProjectsSubscriptionsAcknowledgeAPI)
                      r
                      u