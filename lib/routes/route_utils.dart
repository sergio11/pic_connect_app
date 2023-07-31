enum AppRoutesEnum { onBoarding, login, signup, home, error, profile, search, add, favorites, comments, publications }

const List<AppRoutesEnum> unProtectedPaths = [AppRoutesEnum.onBoarding, AppRoutesEnum.login, AppRoutesEnum.signup];

extension AppRouteExtension on AppRoutesEnum {

  bool get requireImmersiveMode {
    return [AppRoutesEnum.onBoarding, AppRoutesEnum.login, AppRoutesEnum.signup].contains(this);
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
      case AppRoutesEnum.favorites:
        return "/favorites";
      case AppRoutesEnum.comments:
        return "/comments";
      case AppRoutesEnum.publications:
        return "/publications";
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
      case AppRoutesEnum.favorites:
        return "FAVORITES";
      case AppRoutesEnum.comments:
        return "COMMENTS";
      case AppRoutesEnum.publications:
        return "PUBLICATIONS";
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
      case AppRoutesEnum.favorites:
        return "Favorites";
      case AppRoutesEnum.comments:
        return "Comments";
      case AppRoutesEnum.publications:
        return "Publications";
      default:
        return "Home";
    }
  }
}
