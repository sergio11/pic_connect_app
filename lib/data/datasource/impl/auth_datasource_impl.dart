import 'package:firebase_auth/firebase_auth.dart';
import 'package:pic_connect/data/datasource/auth_datasource.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final FirebaseAuth auth;

  AuthDatasourceImpl({required this.auth});

  @override
  Future<bool> isLoggedIn() async {
    return auth.currentUser != null;
  }

  @override
  Future<String> signInUser(
      {required String email, required String password}) async {
    final cred = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user!.uid;
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<String> signUpUser(
      {required String email, required String password}) async {
    final cred = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user!.uid;
  }

  @override
  Future<String> getCurrentAuthUserUid() async {
    return auth.currentUser!.uid;
  }
}
