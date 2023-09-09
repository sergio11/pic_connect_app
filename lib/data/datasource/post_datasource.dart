import 'package:pic_connect/data/datasource/dto/comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/post_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_dto.dart';

abstract class PostDatasource {
  Future<PostDTO> findById(String id);

  Future<void> deletePost(String postId);

  Future<CommentDTO> postComment(SavePostCommentDTO commentDTO);

  Future<bool> likePost({required String postId, required String userUuid});

  Future<bool> saveBookmark({required String postId, required String userUuid});

  Future<void> uploadPost(SavePostDTO post);

  Future<List<CommentDTO>> findAllCommentsByPostId(String postId);

  Future<List<PostDTO>> findAllByUserUidOrderByDatePublished(String userUuid);

  Future<List<PostDTO>> findReelsByUserUidOrderByDatePublished(String userUuid);

  Future<List<PostDTO>> findPicturesByUserUidOrderByDatePublished(String userUuid);

  Future<List<PostDTO>> findAllOrderByDatePublished();

  Future<List<PostDTO>> findAllFavoritesByUserUidOrderByDatePublished(
      String userUuid);

  Future<List<PostDTO>> findAllBookmarkByUserUidOrderByDatePublished(
      String userUuid);

  Future<List<PostDTO>> findAllByUserUidListOrderByDatePublished(
      List<String> userUuidList);

  Future<List<PostDTO>> getReelsWithMostLikes(int limit);

  Future<List<PostDTO>> findMomentsPublishedTodayByUserUuids(List<String> userUuids);
}
