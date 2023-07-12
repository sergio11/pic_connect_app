import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/respository/post_repository.dart';
import 'package:pic_connect/domain/respository/storage_repository.dart';
import 'package:uuid/uuid.dart';

class PostRepositoryImpl implements PostRepository {
  final FirebaseFirestore _firestore;
  final StorageRepository _storageRepository;

  PostRepositoryImpl(this._firestore, this._storageRepository);

  @override
  Future<Either<Failure, bool>> deletePost(String postId) async {
    Either<Failure, bool> result;
    try {
      await _firestore.collection('posts').doc(postId).delete();
      result = const Right(true);
    } catch (err) {
      result = Left(Failure(message: err.toString()));
    }
    return result;
  }

  @override
  Future<Either<Failure, bool>> likePost(String postId, String uid, List likes) async {
    Either<Failure, bool> result;
    try {
      if (likes.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
      result = const Right(true);
    } catch (err) {
      result = Left(Failure(message: err.toString()));
    }
    return result;
  }

  @override
  Future<Either<Failure, bool>> postComment(String postId, String text, String uid,
      String name, String profilePic) async {
    Either<Failure, bool> result;
    try {
      if (text.isNotEmpty) {
        // if the likes list contains the user uid, we need to remove it
        String commentId = const Uuid().v1();
        _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        result = const Right(true);
      } else {
        result = const Left(Failure(message: "Please enter text"));
      }
    } catch (err) {
      result = Left(Failure(message: err.toString()));
    }
    return result;
  }

  @override
  Future<Either<Failure, bool>> uploadPost(String description, Uint8List file,
      String uid, String username, String profImage) async {
    try {
      Either<Failure, String> result =
          await _storageRepository.uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1(); // creates unique id based on time
      PostBO post = PostBO(
        description: description,
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: result.fold((err) => "", (url) => url),
        profImage: profImage,
      );
      _firestore.collection('posts').doc(postId).set(post.toJson());
      return const Right(true);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }
}
