import 'package:pic_connect/data/datasource/dto/save_post_comment_dto.dart';
import 'package:pic_connect/utils/mapper.dart';
import 'package:uuid/uuid.dart';

class SavePostCommentDTOMapper
    extends Mapper<SavePostCommentDTO, Map<String, dynamic>> {
  @override
  Map<String, dynamic> call(SavePostCommentDTO object) {
    return {
      'postId': object.postId,
      'authorUid': object.authorUid,
      'text': object.text,
      'commentId': const Uuid().v1(),
      'datePublished': DateTime.now()
    };
  }
}
