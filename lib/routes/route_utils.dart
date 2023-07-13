enum AppRoutesEnum { login, signup, home, error, profile, search, add, favorites }

extension AppRouteExtension on AppRoutesEnum {
  String get screenPath {
    switch (this) {
      case AppRoutesEnum.home:
        return "/home";
      case AppRoutesEnum.login:
        return "/";
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
      default:
        return "/";
    }
  }

  String get screenName {
    switch (this) {
      case AppRoutesEnum.home:
        return "HOME";
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
      default:
        return "HOME";
    }
  }

  String get screenTitle {
    switch (this) {
      case AppRoutesEnum.home:
        return "Home";
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
      default:
        return "Home";
    }
  }
}
