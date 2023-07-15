
import 'package:pic_connect/data/datasource/dto/save_post_comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_dto.dart';

abstract class PostDatasource {

  Future<void> deletePost(String postId);

  Future<void> postComment(SavePostCommentDTO commentDTO);

  Future<void> likePost({
    required String postId,
    required String uid
  });

  Future<void> uploadPost(SavePostDTO post);

}