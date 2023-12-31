import 'package:pic_connect/data/datasource/dto/save_post_dto.dart';
import 'package:pic_connect/utils/mapper.dart';
import 'package:uuid/uuid.dart';

class SavePostDtoMapper extends Mapper<CreatePostDTO, Map<String, dynamic>> {
  @override
  Map<String, dynamic> call(CreatePostDTO object) {
    return {
      "description": object.description,
      "postId": const Uuid().v1(),
      "likes": [],
      "bookmarks": [],
      "commentsCount": 0,
      "likesCount": 0,
      "isStoryMoment": object.isStoryMoment,
      "type": object.type,
      "authorUid": object.authorUid,
      "datePublished": DateTime.now(),
      'postUrl': object.postUrl,
      "tags": object.tags,
      "placeInfo": object.placeInfo
    };
  }
}
