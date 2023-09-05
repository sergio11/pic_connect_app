import 'package:pic_connect/data/datasource/dto/comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/domain/models/comment.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/utils/mapper.dart';

class CommentBoMapper extends Mapper<CommentBoMapperData, CommentBO> {
  final Mapper<UserDTO, UserBO> userMapper;

  CommentBoMapper({required this.userMapper});

  @override
  CommentBO call(CommentBoMapperData object) {
    return CommentBO(
        commentId: object.commentDTO.commentId,
        postId: object.commentDTO.postId,
        datePublished: object.commentDTO.datePublished,
        text: object.commentDTO.text,
        author: userMapper(object.userDTO));
  }
}

class CommentBoMapperData {
  final CommentDTO commentDTO;
  final UserDTO userDTO;

  CommentBoMapperData({required this.commentDTO, required this.userDTO});
}
