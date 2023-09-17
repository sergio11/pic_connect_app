import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/features/publications/publications_bloc.dart';

enum AppRoutesEnum {
  onBoarding,
  login,
  signup,
  home,
  error,
  profile,
  search,
  add,
  reels,
  comments,
  publications,
  imageEditor,
  following,
  followers,
  editProfile,
  messages,
  editPost
}

const List<AppRoutesEnum> unProtectedPaths = [
  AppRoutesEnum.onBoarding,
  AppRoutesEnum.login,
  AppRoutesEnum.signup
];

extension AppRouteExtension on AppRoutesEnum {
  bool get requireImmersiveMode {
    return [AppRoutesEnum.onBoarding, AppRoutesEnum.login, AppRoutesEnum.signup]
        .contains(this);
  }

  String get screenPath {
    switch (this) {
      case AppRoutesEnum.home:
        return "/";
      case AppRoutesEnum.onBoarding:
        return "/onBoarding";
      case AppRoutesEnum.login:
        return "/login";
      case AppRoutesEnum.signup:
        return "/signup";
      case AppRoutesEnum.error:
        return "/error";
      case AppRoutesEnum.profile:
        return "/profile";
      case AppRoutesEnum.search:
        return "/search";
      case AppRoutesEnum.add:
        return "/add";
      case AppRoutesEnum.reels:
        return "/reels";
      case AppRoutesEnum.comments:
        return "/comments";
      case AppRoutesEnum.publications:
        return "/publications";
      case AppRoutesEnum.imageEditor:
        return "/imageEditor";
      case AppRoutesEnum.followers:
        return "/followers";
      case AppRoutesEnum.following:
        return "/following";
      case AppRoutesEnum.editProfile:
        return "/editProfile";
      case AppRoutesEnum.messages:
        return "/messages";
      case AppRoutesEnum.editPost:
        return "/editPost";
      default:
        return "/";
    }
  }

  String get screenName {
    switch (this) {
      case AppRoutesEnum.home:
        return "HOME";
      case AppRoutesEnum.onBoarding:
        return "ONBOARDING";
      case AppRoutesEnum.login:
        return "LOGIN";
      case AppRoutesEnum.signup:
        return "SIGNUP";
      case AppRoutesEnum.error:
        return "ERROR";
      case AppRoutesEnum.profile:
        return "PROFILE";
      case AppRoutesEnum.search:
        return "SEARCH";
      case AppRoutesEnum.add:
        return "ADD";
      case AppRoutesEnum.reels:
        return "REELS";
      case AppRoutesEnum.comments:
        return "COMMENTS";
      case AppRoutesEnum.publications:
        return "PUBLICATIONS";
      case AppRoutesEnum.imageEditor:
        return "IMAGE_EDITOR";
      case AppRoutesEnum.followers:
        return "FOLLOWERS";
      case AppRoutesEnum.following:
        return "FOLLOWING";
      case AppRoutesEnum.editProfile:
        return "EDIT_PROFILE";
      case AppRoutesEnum.messages:
        return "MESSAGES";
      case AppRoutesEnum.editPost:
        return "EDIT_POST";
      default:
        return "HOME";
    }
  }

  String get screenTitle {
    switch (this) {
      case AppRoutesEnum.home:
        return "Home";
      case AppRoutesEnum.onBoarding:
        return "OnBoarding";
      case AppRoutesEnum.login:
        return "Login";
      case AppRoutesEnum.error:
        return "Error";
      case AppRoutesEnum.signup:
        return "Signup";
      case AppRoutesEnum.profile:
        return "Profile";
      case AppRoutesEnum.search:
        return "Search";
      case AppRoutesEnum.add:
        return "Add";
      case AppRoutesEnum.reels:
        return "Reels";
      case AppRoutesEnum.comments:
        return "Comments";
      case AppRoutesEnum.publications:
        return "Publications";
      case AppRoutesEnum.imageEditor:
        return "ImageEditor";
      case AppRoutesEnum.followers:
        return "Followers";
      case AppRoutesEnum.following:
        return "Following";
      case AppRoutesEnum.editProfile:
        return "EditProfile";
      case AppRoutesEnum.messages:
        return "Message";
      case AppRoutesEnum.editPost:
        return "EditPost";
      default:
        return "Home";
    }
  }
}

class PublicationsScreenArgs {
  final String userUid;
  final PublicationsContentTypeEnum type;

  PublicationsScreenArgs({required this.userUid, required this.type});
}

class AddPostScreenArgs {
  final ImageSource imageSource;
  final PostTypeEnum type;

  AddPostScreenArgs({required this.imageSource, required this.type});
}
