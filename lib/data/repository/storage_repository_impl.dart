import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/respository/storage_repository.dart';
import 'package:uuid/uuid.dart';

class StorageRepositoryImpl implements StorageRepository {
  final FirebaseAuth _auth;
  final FirebaseStorage _storage;

  StorageRepositoryImpl(this._auth, this._storage);

  @override
  Future<Either<Failure, String>> uploadImageToStorage(
      String childName,
      Uint8List file,
      bool isPost
      ) async {
    Either<Failure, String> result;
    try {
      Reference ref =
          _storage.ref().child(childName).child(_auth.currentUser!.uid);
      if (isPost) {
        String id = const Uuid().v1();
        ref = ref.child(id);
      }
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      result = Right(downloadUrl);
    } catch (err) {
      result = Left(Failure(message: err.toString()));
    }
    return result;
  }
}
