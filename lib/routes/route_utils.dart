enum AppRoutesEnum { login, signup, home, error, profile }

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
      default:
        return "Home";
    }
  }
}
