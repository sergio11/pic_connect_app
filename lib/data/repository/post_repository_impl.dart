import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:pic_connect/data/datasource/dto/save_post_comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_dto.dart';
import 'package:pic_connect/data/datasource/post_datasource.dart';
import 'package:pic_connect/data/datasource/storage_datasource.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/respository/post_repository.dart';
import 'package:pic_connect/domain/respository/storage_repository.dart';
import 'package:uuid/uuid.dart';

class PostRepositoryImpl implements PostRepository {

  final PostDatasource postDatasource;
  final StorageDatasource storageDatasource;

  PostRepositoryImpl({
    required this.postDatasource,
    required this.storageDatasource
  });

  @override
  Future<Either<Failure, bool>> deletePost(String postId) async {
    try {
      await postDatasource.deletePost(postId);
      return const Right(true);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> likePost({
    required String postId,
    required String userUid
  }) async {
    try {
      await postDatasource.likePost(postId: postId, uid: userUid);
      return const Right(true);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> postComment({
    required String postId,
    required String text,
    required String authorUid
  }) async {
    try {
      await postDatasource.postComment(SavePostCommentDTO(
          postId: postId,
          text: text,
          authorUid: authorUid
      ));
      return const Right(true);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> uploadPost({
    required String authorUid,
    required String description,
    required Uint8List file
  }) async {
    try {
      final postUrl = await storageDatasource.uploadFileToStorage(folderName: 'posts', id: const Uuid().v1(), file: file);
      postDatasource.uploadPost(SavePostDTO(
          authorUid: authorUid,
          description: description,
          postUrl: postUrl
      ));
      return const Right(true);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostBO>>> findAllByUserUid(String userUi) {
    // TODO: implement findAllByUserUid
    throw UnimplementedError();
  }
}
