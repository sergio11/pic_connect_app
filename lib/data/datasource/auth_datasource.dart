abstract class AuthDatasource {
  Future<bool> isLoggedIn();

  Future<String> getCurrentAuthUserUid();

  Future<String> signInUser({
    required String email,
    required String password,
  });

  Future<String> signUpUser({required String email, required String password});

  Future<void> signOut();
}
