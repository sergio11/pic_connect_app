import 'package:pic_connect/data/datasource/dto/save_post_dto.dart';
import 'package:pic_connect/utils/mapper.dart';
import 'package:uuid/uuid.dart';

class SavePostDtoMapper extends Mapper<SavePostDTO, Map<String, dynamic>> {
  @override
  Map<String, dynamic> call(SavePostDTO object) {
    return {
      "description": object.description,
      "postId": const Uuid().v1(),
      "likes": [],
      "commentsCount": 0,
      "authorUid": object.authorUid,
      "datePublished": DateTime.now(),
      'postUrl': object.postUrl,
      "tags": object.tags
    };
  }
}