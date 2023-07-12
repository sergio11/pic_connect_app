import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/failure.dart';

abstract class PostRepository {
  Future<Either<Failure, bool>> uploadPost(String description, Uint8List file, String uid,
      String username, String profImage);

  Future<Either<Failure, bool>> likePost(String postId, String uid, List likes);

  Future<Either<Failure, bool>> postComment(
      String postId, String text, String uid, String name, String profilePic);

  Future<Either<Failure, bool>> deletePost(String postId);
}
