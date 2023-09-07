import 'package:pic_connect/data/datasource/dto/post_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/utils/mapper.dart';

class PostBoMapper extends Mapper<PostBoMapperData, PostBO> {
  @override
  PostBO call(PostBoMapperData object) {
    final postDTO = object.postDTO;
    final userDTO = object.userDTO;
    PostTypeEnum postType;
    switch (postDTO.type) {
      case "reel":
        postType = PostTypeEnum.reel;
        break;
      case "moment":
        postType = PostTypeEnum.moment;
        break;
      default:
        postType = PostTypeEnum.picture;
        break;
    }
    return PostBO(
      description: postDTO.description,
      username: userDTO.username,
      likes: postDTO.likes,
      bookmarks: postDTO.bookmarks,
      postId: postDTO.postId,
      datePublished: postDTO.datePublished,
      postUrl: postDTO.postUrl,
      postAuthorUid: userDTO.uid,
      profImage: userDTO.photoUrl,
      commentCount: postDTO.commentCount,
      tags: postDTO.tags,
      postType: postType,
      placeInfo: postDTO.placeInfo,
    );
  }
}

class PostBoMapperData {
  final PostDTO postDTO;
  final UserDTO userDTO;

  PostBoMapperData({required this.postDTO, required this.userDTO});
}
