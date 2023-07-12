import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/respository/auth_repository.dart';
import 'package:pic_connect/domain/respository/storage_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final StorageRepository _storageRepository;

  AuthRepositoryImpl(this._firestore, this._auth, this._storageRepository);

  @override
  Future<Either<Failure, UserBO>> getUserDetails() async {
    Either<Failure, UserBO> result;
    try {
      User currentUser = _auth.currentUser!;
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(currentUser.uid).get();
      result = Right(UserBO.fromSnap(documentSnapshot));
    } catch (err) {
      result = Left(Failure(message: err.toString()));
    }
    return result;
  }

  @override
  Future<Either<Failure, bool>> signInUser({
    required String email,
    required String password
  }) async {
    Either<Failure, bool> result;
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        result = const Right(true);
      } else {
        result = const Left(Failure(message: "Please enter all the fields"));
      }
    } catch (err) {
      result = Left(Failure(message: err.toString()));
    }
    return result;
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    Either<Failure, bool> result;
    try {
      await _auth.signOut();
      result = const Right(true);
    } catch(err) {
      result = Left(Failure(message: err.toString()));
    }
    return result;
  }

  @override
  Future<Either<Failure, bool>> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file}) async {
    Either<Failure, bool> result;
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        Either<Failure, String> uploadImageResult = await _storageRepository
            .uploadImageToStorage('profilePics', file, false);

        UserBO user = UserBO(
          username: username,
          uid: cred.user!.uid,
          photoUrl: uploadImageResult.fold((err) => "", (url) => url),
          email: email,
          bio: bio,
          followers: [],
          following: [],
        );

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());

        result = const Right(true);
      } else {
        result = const Left(Failure(message: "Please enter all the fields"));
      }
    } catch (err) {
      result = Left(Failure(message: err.toString()));
    }
    return result;
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }
}
