{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Network.Google.Classroom.Types.Product
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Network.Google.Classroom.Types.Product where

import           Network.Google.Classroom.Types.Sum
import           Network.Google.Prelude

-- | A Course in Classroom.
--
-- /See:/ 'course' smart constructor.
data Course = Course
    { _cCreationTime       :: !(Maybe Text)
    , _cRoom               :: !(Maybe Text)
    , _cCourseState        :: !(Maybe Text)
    , _cEnrollmentCode     :: !(Maybe Text)
    , _cUpdateTime         :: !(Maybe Text)
    , _cOwnerId            :: !(Maybe Text)
    , _cName               :: !(Maybe Text)
    , _cId                 :: !(Maybe Text)
    , _cAlternateLink      :: !(Maybe Text)
    , _cDescription        :: !(Maybe Text)
    , _cDescriptionHeading :: !(Maybe Text)
    , _cSection            :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Course' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cCreationTime'
--
-- * 'cRoom'
--
-- * 'cCourseState'
--
-- * 'cEnrollmentCode'
--
-- * 'cUpdateTime'
--
-- * 'cOwnerId'
--
-- * 'cName'
--
-- * 'cId'
--
-- * 'cAlternateLink'
--
-- * 'cDescription'
--
-- * 'cDescriptionHeading'
--
-- * 'cSection'
course
    :: Course
course =
    Course
    { _cCreationTime = Nothing
    , _cRoom = Nothing
    , _cCourseState = Nothing
    , _cEnrollmentCode = Nothing
    , _cUpdateTime = Nothing
    , _cOwnerId = Nothing
    , _cName = Nothing
    , _cId = Nothing
    , _cAlternateLink = Nothing
    , _cDescription = Nothing
    , _cDescriptionHeading = Nothing
    , _cSection = Nothing
    }

-- | Creation time of the course. Specifying this field in a course update
-- mask will result in an error. Read-only.
cCreationTime :: Lens' Course (Maybe Text)
cCreationTime
  = lens _cCreationTime
      (\ s a -> s{_cCreationTime = a})

-- | Optional room location. For example, \"301\". If set, this field must be
-- a valid UTF-8 string and no longer than 650 characters.
cRoom :: Lens' Course (Maybe Text)
cRoom = lens _cRoom (\ s a -> s{_cRoom = a})

-- | State of the course. If unspecified, the default state is
-- \`PROVISIONED\`.
cCourseState :: Lens' Course (Maybe Text)
cCourseState
  = lens _cCourseState (\ s a -> s{_cCourseState = a})

-- | Enrollment code to use when joining this course. Specifying this field
-- in a course update mask will result in an error. Read-only.
cEnrollmentCode :: Lens' Course (Maybe Text)
cEnrollmentCode
  = lens _cEnrollmentCode
      (\ s a -> s{_cEnrollmentCode = a})

-- | Time of the most recent update to this course. Specifying this field in
-- a course update mask will result in an error. Read-only.
cUpdateTime :: Lens' Course (Maybe Text)
cUpdateTime
  = lens _cUpdateTime (\ s a -> s{_cUpdateTime = a})

-- | The identifier of the owner of a course. When specified as a parameter
-- of a [create course request][google.classroom.v1.Courses.CreateCourse],
-- this field is required. The identifier can be one of the following: *
-- the numeric identifier for the user * the email address of the user *
-- the string literal \`\"me\"\`, indicating the requesting user This must
-- be set in a create request. Specifying this field in a course update
-- mask will result in an \`INVALID_ARGUMENT\` error.
cOwnerId :: Lens' Course (Maybe Text)
cOwnerId = lens _cOwnerId (\ s a -> s{_cOwnerId = a})

-- | Name of the course. For example, \"10th Grade Biology\". The name is
-- required. It must be between 1 and 750 characters and a valid UTF-8
-- string.
cName :: Lens' Course (Maybe Text)
cName = lens _cName (\ s a -> s{_cName = a})

-- | Identifier for this course assigned by Classroom. When [creating a
-- course][google.classroom.v1.Courses.CreateCourse], you may optionally
-- set this identifier to an [alias
-- string][google.classroom.v1.CourseAlias] in the request to create a
-- corresponding alias. The \`id\` is still assigned by Classroom and
-- cannot be updated after the course is created. Specifying this field in
-- a course update mask will result in an error.
cId :: Lens' Course (Maybe Text)
cId = lens _cId (\ s a -> s{_cId = a})

-- | Absolute link to this course in the Classroom web UI. Read-only.
cAlternateLink :: Lens' Course (Maybe Text)
cAlternateLink
  = lens _cAlternateLink
      (\ s a -> s{_cAlternateLink = a})

-- | Optional description. For example, \"We\'ll be learning about the
-- structure of living creatures from a combination of textbooks, guest
-- lectures, and lab work. Expect to be excited!\" If set, this field must
-- be a valid UTF-8 string and no longer than 30,000 characters.
cDescription :: Lens' Course (Maybe Text)
cDescription
  = lens _cDescription (\ s a -> s{_cDescription = a})

-- | Optional heading for the description. For example, \"Welcome to 10th
-- Grade Biology.\" If set, this field must be a valid UTF-8 string and no
-- longer than 3600 characters.
cDescriptionHeading :: Lens' Course (Maybe Text)
cDescriptionHeading
  = lens _cDescriptionHeading
      (\ s a -> s{_cDescriptionHeading = a})

-- | Section of the course. For example, \"Period 2\". If set, this field
-- must be a valid UTF-8 string and no longer than 2800 characters.
cSection :: Lens' Course (Maybe Text)
cSection = lens _cSection (\ s a -> s{_cSection = a})

-- | Alternative identifier for a course. An alias uniquely identifies a
-- course. It must be unique within one of the following scopes: * domain:
-- A domain-scoped alias is visible to all users within the alias
-- creator\'s domain and can be created only by a domain admin. A
-- domain-scoped alias is often used when a course has an identifier
-- external to Classroom. * project: A project-scoped alias is visible to
-- any request from an application using the Developer Console project ID
-- that created the alias and can be created by any project. A
-- project-scoped alias is often used when an application has alternative
-- identifiers. A random value can also be used to avoid duplicate courses
-- in the event of transmission failures, as retrying a request will return
-- \`ALREADY_EXISTS\` if a previous one has succeeded.
--
-- /See:/ 'courseAlias' smart constructor.
newtype CourseAlias = CourseAlias
    { _caAlias :: Maybe Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CourseAlias' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'caAlias'
courseAlias
    :: CourseAlias
courseAlias =
    CourseAlias
    { _caAlias = Nothing
    }

-- | Alias string. The format of the string indicates the desired alias
-- scoping. * \`d:\` indicates a domain-scoped alias. Example:
-- \`d:math_101\` * \`p:\` indicates a project-scoped alias. Example:
-- \`p:abc123\` This field has a maximum length of 256 characters.
caAlias :: Lens' CourseAlias (Maybe Text)
caAlias = lens _caAlias (\ s a -> s{_caAlias = a})

-- | A generic empty message that you can re-use to avoid defining duplicated
-- empty messages in your APIs. A typical example is to use it as the
-- request or the response type of an API method. For instance: service Foo
-- { rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty); } The
-- JSON representation for \`Empty\` is empty JSON object \`{}\`.
--
-- /See:/ 'empty' smart constructor.
data Empty =
    Empty
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Empty' with the minimum fields required to make a request.
--
empty
    :: Empty
empty = Empty

-- | Global user permission description.
--
-- /See:/ 'globalPermission' smart constructor.
newtype GlobalPermission = GlobalPermission
    { _gpPermission :: Maybe Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GlobalPermission' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gpPermission'
globalPermission
    :: GlobalPermission
globalPermission =
    GlobalPermission
    { _gpPermission = Nothing
    }

-- | Permission value.
gpPermission :: Lens' GlobalPermission (Maybe Text)
gpPermission
  = lens _gpPermission (\ s a -> s{_gpPermission = a})

-- | An invitation to join a course.
--
-- /See:/ 'invitation' smart constructor.
data Invitation = Invitation
    { _iCourseId :: !(Maybe Text)
    , _iUserId   :: !(Maybe Text)
    , _iRole     :: !(Maybe Text)
    , _iId       :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Invitation' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'iCourseId'
--
-- * 'iUserId'
--
-- * 'iRole'
--
-- * 'iId'
invitation
    :: Invitation
invitation =
    Invitation
    { _iCourseId = Nothing
    , _iUserId = Nothing
    , _iRole = Nothing
    , _iId = Nothing
    }

-- | Identifier of the course to invite the user to.
iCourseId :: Lens' Invitation (Maybe Text)
iCourseId
  = lens _iCourseId (\ s a -> s{_iCourseId = a})

-- | Identifier of the invited user. When specified as a parameter of a
-- request, this identifier can be set to one of the following: * the
-- numeric identifier for the user * the email address of the user * the
-- string literal \`\"me\"\`, indicating the requesting user
iUserId :: Lens' Invitation (Maybe Text)
iUserId = lens _iUserId (\ s a -> s{_iUserId = a})

-- | Role to invite the user to have. Must not be
-- \`COURSE_ROLE_UNSPECIFIED\`.
iRole :: Lens' Invitation (Maybe Text)
iRole = lens _iRole (\ s a -> s{_iRole = a})

-- | Identifier assigned by Classroom. Read-only.
iId :: Lens' Invitation (Maybe Text)
iId = lens _iId (\ s a -> s{_iId = a})

-- | Response when listing course aliases.
--
-- /See:/ 'listCourseAliasesResponse' smart constructor.
data ListCourseAliasesResponse = ListCourseAliasesResponse
    { _lcarNextPageToken :: !(Maybe Text)
    , _lcarAliases       :: !(Maybe [Maybe CourseAlias])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ListCourseAliasesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lcarNextPageToken'
--
-- * 'lcarAliases'
listCourseAliasesResponse
    :: ListCourseAliasesResponse
listCourseAliasesResponse =
    ListCourseAliasesResponse
    { _lcarNextPageToken = Nothing
    , _lcarAliases = Nothing
    }

-- | Token identifying the next page of results to return. If empty, no
-- further results are available.
lcarNextPageToken :: Lens' ListCourseAliasesResponse (Maybe Text)
lcarNextPageToken
  = lens _lcarNextPageToken
      (\ s a -> s{_lcarNextPageToken = a})

-- | The course aliases.
lcarAliases :: Lens' ListCourseAliasesResponse [Maybe CourseAlias]
lcarAliases
  = lens _lcarAliases (\ s a -> s{_lcarAliases = a}) .
      _Default
      . _Coerce

-- | Response when listing courses.
--
-- /See:/ 'listCoursesResponse' smart constructor.
data ListCoursesResponse = ListCoursesResponse
    { _lcrNextPageToken :: !(Maybe Text)
    , _lcrCourses       :: !(Maybe [Maybe Course])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ListCoursesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lcrNextPageToken'
--
-- * 'lcrCourses'
listCoursesResponse
    :: ListCoursesResponse
listCoursesResponse =
    ListCoursesResponse
    { _lcrNextPageToken = Nothing
    , _lcrCourses = Nothing
    }

-- | Token identifying the next page of results to return. If empty, no
-- further results are available.
lcrNextPageToken :: Lens' ListCoursesResponse (Maybe Text)
lcrNextPageToken
  = lens _lcrNextPageToken
      (\ s a -> s{_lcrNextPageToken = a})

-- | Courses that match the list request.
lcrCourses :: Lens' ListCoursesResponse [Maybe Course]
lcrCourses
  = lens _lcrCourses (\ s a -> s{_lcrCourses = a}) .
      _Default
      . _Coerce

-- | Response when listing invitations.
--
-- /See:/ 'listInvitationsResponse' smart constructor.
data ListInvitationsResponse = ListInvitationsResponse
    { _lirNextPageToken :: !(Maybe Text)
    , _lirInvitations   :: !(Maybe [Maybe Invitation])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ListInvitationsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lirNextPageToken'
--
-- * 'lirInvitations'
listInvitationsResponse
    :: ListInvitationsResponse
listInvitationsResponse =
    ListInvitationsResponse
    { _lirNextPageToken = Nothing
    , _lirInvitations = Nothing
    }

-- | Token identifying the next page of results to return. If empty, no
-- further results are available.
lirNextPageToken :: Lens' ListInvitationsResponse (Maybe Text)
lirNextPageToken
  = lens _lirNextPageToken
      (\ s a -> s{_lirNextPageToken = a})

-- | Invitations that match the list request.
lirInvitations :: Lens' ListInvitationsResponse [Maybe Invitation]
lirInvitations
  = lens _lirInvitations
      (\ s a -> s{_lirInvitations = a})
      . _Default
      . _Coerce

-- | Response when listing students.
--
-- /See:/ 'listStudentsResponse' smart constructor.
data ListStudentsResponse = ListStudentsResponse
    { _lsrNextPageToken :: !(Maybe Text)
    , _lsrStudents      :: !(Maybe [Maybe Student])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ListStudentsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lsrNextPageToken'
--
-- * 'lsrStudents'
listStudentsResponse
    :: ListStudentsResponse
listStudentsResponse =
    ListStudentsResponse
    { _lsrNextPageToken = Nothing
    , _lsrStudents = Nothing
    }

-- | Token identifying the next page of results to return. If empty, no
-- further results are available.
lsrNextPageToken :: Lens' ListStudentsResponse (Maybe Text)
lsrNextPageToken
  = lens _lsrNextPageToken
      (\ s a -> s{_lsrNextPageToken = a})

-- | Students who match the list request.
lsrStudents :: Lens' ListStudentsResponse [Maybe Student]
lsrStudents
  = lens _lsrStudents (\ s a -> s{_lsrStudents = a}) .
      _Default
      . _Coerce

-- | Response when listing teachers.
--
-- /See:/ 'listTeachersResponse' smart constructor.
data ListTeachersResponse = ListTeachersResponse
    { _ltrNextPageToken :: !(Maybe Text)
    , _ltrTeachers      :: !(Maybe [Maybe Teacher])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ListTeachersResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ltrNextPageToken'
--
-- * 'ltrTeachers'
listTeachersResponse
    :: ListTeachersResponse
listTeachersResponse =
    ListTeachersResponse
    { _ltrNextPageToken = Nothing
    , _ltrTeachers = Nothing
    }

-- | Token identifying the next page of results to return. If empty, no
-- further results are available.
ltrNextPageToken :: Lens' ListTeachersResponse (Maybe Text)
ltrNextPageToken
  = lens _ltrNextPageToken
      (\ s a -> s{_ltrNextPageToken = a})

-- | Teachers who match the list request.
ltrTeachers :: Lens' ListTeachersResponse [Maybe Teacher]
ltrTeachers
  = lens _ltrTeachers (\ s a -> s{_ltrTeachers = a}) .
      _Default
      . _Coerce

-- | Details of the user\'s name.
--
-- /See:/ 'name' smart constructor.
data Name = Name
    { _nGivenName  :: !(Maybe Text)
    , _nFullName   :: !(Maybe Text)
    , _nFamilyName :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Name' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'nGivenName'
--
-- * 'nFullName'
--
-- * 'nFamilyName'
name
    :: Name
name =
    Name
    { _nGivenName = Nothing
    , _nFullName = Nothing
    , _nFamilyName = Nothing
    }

-- | The user\'s first name. Read-only.
nGivenName :: Lens' Name (Maybe Text)
nGivenName
  = lens _nGivenName (\ s a -> s{_nGivenName = a})

-- | The user\'s full name formed by concatenating the first and last name
-- values. Read-only.
nFullName :: Lens' Name (Maybe Text)
nFullName
  = lens _nFullName (\ s a -> s{_nFullName = a})

-- | The user\'s last name. Read-only.
nFamilyName :: Lens' Name (Maybe Text)
nFamilyName
  = lens _nFamilyName (\ s a -> s{_nFamilyName = a})

-- | Student in a course.
--
-- /See:/ 'student' smart constructor.
data Student = Student
    { _sCourseId :: !(Maybe Text)
    , _sProfile  :: !(Maybe (Maybe UserProfile))
    , _sUserId   :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Student' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sCourseId'
--
-- * 'sProfile'
--
-- * 'sUserId'
student
    :: Student
student =
    Student
    { _sCourseId = Nothing
    , _sProfile = Nothing
    , _sUserId = Nothing
    }

-- | Identifier of the course. Read-only.
sCourseId :: Lens' Student (Maybe Text)
sCourseId
  = lens _sCourseId (\ s a -> s{_sCourseId = a})

-- | Global user information for the student. Read-only.
sProfile :: Lens' Student (Maybe (Maybe UserProfile))
sProfile = lens _sProfile (\ s a -> s{_sProfile = a})

-- | Identifier of the user. When specified as a parameter of a request, this
-- identifier can be one of the following: * the numeric identifier for the
-- user * the email address of the user * the string literal \`\"me\"\`,
-- indicating the requesting user
sUserId :: Lens' Student (Maybe Text)
sUserId = lens _sUserId (\ s a -> s{_sUserId = a})

-- | Teacher of a course.
--
-- /See:/ 'teacher' smart constructor.
data Teacher = Teacher
    { _tCourseId :: !(Maybe Text)
    , _tProfile  :: !(Maybe (Maybe UserProfile))
    , _tUserId   :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Teacher' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'tCourseId'
--
-- * 'tProfile'
--
-- * 'tUserId'
teacher
    :: Teacher
teacher =
    Teacher
    { _tCourseId = Nothing
    , _tProfile = Nothing
    , _tUserId = Nothing
    }

-- | Identifier of the course. Read-only.
tCourseId :: Lens' Teacher (Maybe Text)
tCourseId
  = lens _tCourseId (\ s a -> s{_tCourseId = a})

-- | Global user information for the teacher. Read-only.
tProfile :: Lens' Teacher (Maybe (Maybe UserProfile))
tProfile = lens _tProfile (\ s a -> s{_tProfile = a})

-- | Identifier of the user. When specified as a parameter of a request, this
-- identifier can be one of the following: * the numeric identifier for the
-- user * the email address of the user * the string literal \`\"me\"\`,
-- indicating the requesting user
tUserId :: Lens' Teacher (Maybe Text)
tUserId = lens _tUserId (\ s a -> s{_tUserId = a})

-- | Global information for a user.
--
-- /See:/ 'userProfile' smart constructor.
data UserProfile = UserProfile
    { _upPhotoUrl     :: !(Maybe Text)
    , _upName         :: !(Maybe (Maybe Name))
    , _upEmailAddress :: !(Maybe Text)
    , _upId           :: !(Maybe Text)
    , _upPermissions  :: !(Maybe [Maybe GlobalPermission])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'UserProfile' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'upPhotoUrl'
--
-- * 'upName'
--
-- * 'upEmailAddress'
--
-- * 'upId'
--
-- * 'upPermissions'
userProfile
    :: UserProfile
userProfile =
    UserProfile
    { _upPhotoUrl = Nothing
    , _upName = Nothing
    , _upEmailAddress = Nothing
    , _upId = Nothing
    , _upPermissions = Nothing
    }

-- | URL of user\'s profile photo. Read-only.
upPhotoUrl :: Lens' UserProfile (Maybe Text)
upPhotoUrl
  = lens _upPhotoUrl (\ s a -> s{_upPhotoUrl = a})

-- | Name of the user. Read-only.
upName :: Lens' UserProfile (Maybe (Maybe Name))
upName = lens _upName (\ s a -> s{_upName = a})

-- | Email address of the user. Read-only.
upEmailAddress :: Lens' UserProfile (Maybe Text)
upEmailAddress
  = lens _upEmailAddress
      (\ s a -> s{_upEmailAddress = a})

-- | Identifier of the user. Read-only.
upId :: Lens' UserProfile (Maybe Text)
upId = lens _upId (\ s a -> s{_upId = a})

-- | Global permissions of the user. Read-only.
upPermissions :: Lens' UserProfile [Maybe GlobalPermission]
upPermissions
  = lens _upPermissions
      (\ s a -> s{_upPermissions = a})
      . _Default
      . _Coerce
