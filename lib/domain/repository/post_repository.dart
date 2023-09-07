import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/comment.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';

abstract class PostRepository {

  Future<Either<Failure, bool>> uploadPost({
    required String authorUid,
    required String description,
    required List<String> tags,
    required PostTypeEnum type,
    required Uint8List file,
    String? placeInfo
  });

  Future<Either<Failure, bool>> likePost({
    required String postId,
    required String userUid
  });

  Future<Either<Failure, bool>> saveBookmark({
    required String postId,
    required String userUid
  });

  Future<Either<Failure, CommentBO>> postComment({
    required String postId,
    required String text,
    required String authorUid
  });

  Future<Either<Failure, bool>> deletePost(String postId);

  Future<Either<Failure, List<PostBO>>> findAllByUserUidOrderByDatePublished(String userUi);

  Future<Either<Failure, List<PostBO>>> findReelsByUserUidOrderByDatePublished(String userUi);

  Future<Either<Failure, List<PostBO>>> findPicturesByUserUidOrderByDatePublished(String userUi);

  Future<Either<Failure, List<CommentBO>>> findAllCommentsByPostId(String postId);

  Future<Either<Failure, List<PostBO>>> findAllOrderByDatePublished();

  Future<Either<Failure, List<PostBO>>> findAllFavoritesByUserUidOrderByDatePublished(String userUi);

  Future<Either<Failure, List<PostBO>>> findAllBookmarkByUserUidOrderByDatePublished(String userUi);

  Future<Either<Failure, List<PostBO>>> findAllByUserUidListOrderByDatePublished(List<String> userUidList);

  Future<Either<Failure, List<PostBO>>> getReelsWithMostLikes(int limit);
}
