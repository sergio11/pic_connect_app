import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:pic_connect/data/datasource/dto/comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/post_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_dto.dart';
import 'package:pic_connect/data/datasource/dto/update_post_dto.dart';
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

  PostRepositoryImpl(
      {required this.postDatasource,
      required this.userDatasource,
      required this.storageDatasource,
      required this.userBoMapper,
      required this.postBoMapper,
      required this.commentBoMapper});

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
  Future<Either<Failure, bool>> likePost(
      {required String postId, required String userUid}) async {
    try {
      final isLikedByUser =
          await postDatasource.likePost(postId: postId, userUuid: userUid);
      return Right(isLikedByUser);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveBookmark(
      {required String postId, required String userUid}) async {
    try {
      final isBookmarkedByUser =
          await postDatasource.saveBookmark(postId: postId, userUuid: userUid);
      return Right(isBookmarkedByUser);
    } catch (err) {
      debugPrint("saveBookmark - ex -> ${err.toString()}");
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, CommentBO>> postComment(
      {required String postId,
      required String text,
      required String authorUid}) async {
    try {
      final comment = await postDatasource.postComment(
          SavePostCommentDTO(postId: postId, text: text, authorUid: authorUid));
      return Right(await _mapToCommentBO(comment));
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> uploadPost(
      {required String authorUid,
      required String description,
      required List<String> tags,
      required Uint8List file,
      required bool isStoryMoment,
      required PostTypeEnum type,
      String? placeInfo}) async {
    try {
      final postUrl = await storageDatasource.uploadFileToStorage(
          folderName: 'posts', id: const Uuid().v1(), file: file);
      postDatasource.uploadPost(CreatePostDTO(
          authorUid: authorUid,
          description: description,
          tags: tags,
          postUrl: postUrl,
          type: type.name,
          isStoryMoment: isStoryMoment,
          placeInfo: placeInfo));
      return const Right(true);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostBO>>> findAllByUserUidOrderByDatePublished(
      String userUi) async {
    try {
      final postsByUser =
          await postDatasource.findAllByUserUidOrderByDatePublished(userUi);
      final posts = await Future.wait(
          postsByUser.map((post) async => _mapToPostBO(post)));
      return Right(posts);
    } catch (ex) {
      debugPrint(
          "findAllByUserUidOrderByDatePublished - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostBO>>>
      findPicturesByUserUidOrderByDatePublished(String userUi) async {
    try {
      final postsByUser = await postDatasource
          .findPicturesByUserUidOrderByDatePublished(userUi);
      final posts = await Future.wait(
          postsByUser.map((post) async => _mapToPostBO(post)));
      return Right(posts);
    } catch (ex) {
      debugPrint(
          "findPicturesByUserUidOrderByDatePublished - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostBO>>> findReelsByUserUidOrderByDatePublished(
      String userUi) async {
    try {
      final postsByUser =
          await postDatasource.findReelsByUserUidOrderByDatePublished(userUi);
      final posts = await Future.wait(
          postsByUser.map((post) async => _mapToPostBO(post)));
      return Right(posts);
    } catch (ex) {
      debugPrint(
          "findReelsByUserUidOrderByDatePublished - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CommentBO>>> findAllCommentsByPostId(
      String postId) async {
    try {
      final commentsByPost =
          await postDatasource.findAllCommentsByPostId(postId);
      final comments = await Future.wait(
          commentsByPost.map((comment) async => _mapToCommentBO(comment)));
      return Right(comments);
    } catch (ex) {
      debugPrint("findAllCommentsByPostId - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostBO>>> findAllOrderByDatePublished() async {
    try {
      final postListDTO = await postDatasource.findAllOrderByDatePublished();
      final posts = await Future.wait(
          postListDTO.map((postDTO) async => _mapToPostBO(postDTO)));
      return Right(posts);
    } catch (ex) {
      debugPrint("findAllOrderByDatePublished - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostBO>>>
      findAllByUserUidListOrderByDatePublished(List<String> userUidList) async {
    try {
      final postListDTO = await postDatasource
          .findAllByUserUidListOrderByDatePublished(userUidList);
      final posts = await Future.wait(
          postListDTO.map((postDTO) async => _mapToPostBO(postDTO)));
      return Right(posts);
    } catch (ex) {
      debugPrint(
          "findAllByUserUidListOrderByDatePublished - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostBO>>>
      findAllFavoritesByUserUidOrderByDatePublished(String userUi) async {
    try {
      final postListDTO = await postDatasource
          .findAllFavoritesByUserUidOrderByDatePublished(userUi);
      final posts = await Future.wait(
          postListDTO.map((postDTO) async => _mapToPostBO(postDTO)));
      return Right(posts);
    } catch (ex) {
      debugPrint(
          "findAllFavoritesByUserUidOrderByDatePublished - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostBO>>>
      findAllBookmarkByUserUidOrderByDatePublished(String userUi) async {
    try {
      final postListDTO = await postDatasource
          .findAllBookmarkByUserUidOrderByDatePublished(userUi);
      final posts = await Future.wait(
          postListDTO.map((postDTO) async => _mapToPostBO(postDTO)));
      return Right(posts);
    } catch (ex) {
      debugPrint(
          "findAllBookmarkByUserUidOrderByDatePublished - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostBO>>> getReelsWithMostLikes(int limit) async {
    try {
      final postListDTO = await postDatasource.getReelsWithMostLikes(limit);
      final posts = await Future.wait(
          postListDTO.map((postDTO) async => _mapToPostBO(postDTO)));
      return Right(posts);
    } catch (ex) {
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostBO>>>
      findMomentsPublishedLast24HoursByUserUuids(
    List<String> userUuids,
  ) async {
    try {
      final List<PostDTO> momentsListDTO = await postDatasource
          .findMomentsPublishedLast24HoursByUserUuids(userUuids);
      final momentsListBO = await Future.wait(
          momentsListDTO.map((postDTO) async => _mapToPostBO(postDTO)));
      return Right(momentsListBO);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostBO>>> findMomentsByUser(
      String userUid, int maxDays) async {
    try {
      final List<PostDTO> momentsListDTO =
          await postDatasource.findMomentsByUser(userUid, maxDays);
      final momentsListBO = await Future.wait(
          momentsListDTO.map((postDTO) async => _mapToPostBO(postDTO)));
      return Right(momentsListBO);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, PostBO>> findPostById(String uuid) async {
    try {
      final postDTO = await postDatasource.findById(uuid);
      return Right(await _mapToPostBO(postDTO));
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updatePost(
      {required String postUuid,
      required String description,
      required List<String> tags,
      required String? placeInfo}) async {
    try {
      await postDatasource.updatePost(UpdatePostDTO(
          postUuid: postUuid,
          description: description,
          tags: tags,
          placeInfo: placeInfo));
      return const Right(true);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  Future<PostBO> _mapToPostBO(PostDTO post) async {
    final author = await userDatasource.findByUid(post.authorUid);
    return postBoMapper(PostBoMapperData(postDTO: post, userDTO: author));
  }

  Future<CommentBO> _mapToCommentBO(CommentDTO comment) async {
    final author = await userDatasource.findByUid(comment.authorUid);
    return commentBoMapper(
        CommentBoMapperData(commentDTO: comment, userDTO: author));
  }
}
