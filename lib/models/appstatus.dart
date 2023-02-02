abstract class AppStatust{}

class AppInitalState extends AppStatust{}

class AppsucessRegisterstate extends AppStatust{}

class ApperrorRegisterstate extends AppStatust{}

class AppLoadingRegisterstate extends AppStatust{}

class AppsucessLoginstate extends AppStatust{
  String uid;

  AppsucessLoginstate(this.uid);
}

class ApperrorLoginstate extends AppStatust{}

class AppLoadingLoginstate extends AppStatust{}

class AppObsecurestate extends AppStatust{}

class Appsucesscreateuserstate extends AppStatust{}

class Apperrorcreateuserstate extends AppStatust{}

class Apperrorgetuserstate extends AppStatust{}

class Appsucessgetuserstate extends AppStatust{}

class AppLoadinggetuserstate extends AppStatust{}

class AppBottemNavBarState extends AppStatust {}

class AppGoToAddPostScreenState extends AppStatust {}

class AppProfileImagePickerfoundState extends AppStatust{}

class AppProfileImagePickerNotfoundState extends AppStatust{}

class AppCoverImagePickerfoundState extends AppStatust{}

class AppCoverImagePickerNotfoundState extends AppStatust{}

class loadtheeditprofilescreen extends AppStatust{}

class uploadProfileImagesucessState extends AppStatust{}

class uploadProfileImageerrorState extends AppStatust{}

class uploadcoverImagesucessState extends AppStatust{}

class uploadcoverImageerrorState extends AppStatust{}

class AppGetImagePickerSuccessfullyState extends AppStatust{}

class AppGetImagePickererrorState extends AppStatust{}

class AppclosetheimageofpostyState extends AppStatust{}

class AppAddPostSuccessfullyState extends AppStatust{}

class AppAddPosterrorfullyState extends AppStatust{}

class AppCreatePostwithImageSuccessfullyState extends AppStatust{}

class AppCreatePostwithImagePosterrorfullyState extends AppStatust{}

class AppCreatePostSuccessfullyState extends AppStatust{}

class AppCreatePosterrorfullyState extends AppStatust{}

class AppGetPostssucessState extends AppStatust{}

class AppLikePostSucessState extends AppStatust{}

class AppLikePosterrorState extends AppStatust{}

class AppGetUsersSucessState extends AppStatust{}

class AppGetUserserrorState extends AppStatust{}

class AppsucessSendMessage extends AppStatust{}

class ApperrorSendMessage extends AppStatust{}

class AppsucessgetMessage extends AppStatust{}

class ApperrorgetMessage extends AppStatust{}

