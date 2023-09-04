
import 'package:pic_connect/data/datasource/dto/comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/post_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_dto.dart';

abstract class PostDatasource {

  Future<PostDTO> findById(String id);

  Future<void> deletePost(String postId);

  Future<CommentDTO> postComment(SavePostCommentDTO commentDTO);

  Future<bool> likePost({
    required String postId,
    required String uid
  });

  Future<bool> saveBookmark({
    required String postId,
    required String uid
  });

  Future<void> uploadPost(SavePostDTO post);

  Future<List<CommentDTO>> findAllCommentsByPostId(String postId);

  Future<List<PostDTO>> findAllByUserUidOrderByDatePublished(String userUi);

  Future<List<PostDTO>> findReelsByUserUidOrderByDatePublished(String userUi);

  Future<List<PostDTO>> findPicturesByUserUidOrderByDatePublished(String userUi);

  Future<List<PostDTO>> findAllOrderByDatePublished();

  Future<List<PostDTO>> findAllFavoritesByUserUidOrderByDatePublished(String userUi);

  Future<List<PostDTO>> findAllBookmarkByUserUidOrderByDatePublished(String userUi);

  Future<List<PostDTO>> findAllByUserUidListOrderByDatePublished(List<String> userUidList);

  Future<List<PostDTO>> getReelsWithMostLikes(int limit);

}