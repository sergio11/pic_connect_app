import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:pic_connect/data/datasource/dto/comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/post_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/data/datasource/post_datasource.dart';
import 'package:pic_connect/data/datasource/storage_datasource.dart';
import 'package:pic_connect/data/datasource/user_datasource.dart';
import 'package:pic_connect/data/mapper/comment_bo_mapper.dart';
import 'package:pic_connect/data/mapper/post_bo_mapper.dart';
import 'package:pic_connect/domain/models/comment.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/utils/mapper.dart';
import 'package:uuid/uuid.dart';

class PostRepositoryImpl implements PostRepository {

  final PostDatasource postDatasource;
  final UserDatasource userDatasource;
  final StorageDatasource storageDatasource;
  final Mapper<UserDTO, UserBO> userBoMapper;
  final Mapper<PostBoMapperData, PostBO> postBoMapper;
  final Mapper<CommentBoMapperData, CommentBO> commentBoMapper;

  PostRepositoryImpl({
    required this.postDatasource,
    required this.userDatasource,
    required this.storageDatasource,
    required this.userBoMapper,
    required this.postBoMapper,
    required this.commentBoMapper
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
  Future<Either<Failure, List<PostBO>>> findAllByUserUid(String userUi) async {
    try {
      final postsByUser = await postDatasource.findAllByUserUid(userUi);
      final posts = await Future.wait(postsByUser.map((post) async => mapToPostBO(post)));
      return Right(posts);
    }  catch(ex) {
      debugPrint("findAllCommentsByPostId - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CommentBO>>> findAllCommentsByPostId(String postId) async {
    try {
      final commentsByPost = await postDatasource.findAllCommentsByPostId(postId);
      final comments = await Future.wait(commentsByPost.map((comment) async  => mapToCommentBO(comment)));
      return Right(comments);
    } catch(ex) {
      debugPrint("findAllCommentsByPostId - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostBO>>> findAllOrderByDatePublished() async {
    try {
        final postListDTO = await postDatasource.findAllOrderByDatePublished();
        final posts = await Future.wait(postListDTO.map((postDTO) async  => mapToPostBO(postDTO)));
        return Right(posts);
    }  catch(ex) {
      debugPrint("findAllOrderByDatePublished - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  Future<PostBO> mapToPostBO(PostDTO post) async {
    final author = await userDatasource.findByUid(post.authorUid);
    return postBoMapper(PostBoMapperData(
        postDTO: post,
        userDTO: author
    ));
  }

  Future<CommentBO> mapToCommentBO(CommentDTO comment) async {
    final author = await userDatasource.findByUid(comment.authorUid);
    return commentBoMapper(CommentBoMapperData(
        commentDTO: comment,
        userDTO: author
    ));
  }
}