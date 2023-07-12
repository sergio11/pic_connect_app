enum PagesEnum {
  login,
  signup,
  home,
  error,
}

extension AppPageExtension on PagesEnum {

  String get screenPath {
    switch (this) {
      case PagesEnum.home:
        return "/";
      case PagesEnum.login:
        return "/";
      case PagesEnum.signup:
        return "/signup";
      case PagesEnum.error:
        return "/error";
      default:
        return "/";
    }
  }

  String get screenName {
    switch (this) {
      case PagesEnum.home:
        return "HOME";
      case PagesEnum.login:
        return "LOGIN";
      case PagesEnum.signup:
        return "SIGNUP";
      case PagesEnum.error:
        return "ERROR";
      default:
        return "HOME";
    }
  }

  String get screenTitle {
    switch (this) {
      case PagesEnum.home:
        return "Home";
      case PagesEnum.login:
        return "Login";
      case PagesEnum.error:
        return "Error";
      case PagesEnum.signup:
        return "Signup";
      default:
        return "Home";
    }
  }

}