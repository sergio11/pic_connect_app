import 'package:pic_connect/data/datasource/dto/post_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/utils/mapper.dart';

class PostBoMapper extends Mapper<PostBoMapperData, PostBO> {
  @override
  PostBO call(PostBoMapperData object) {
    return PostBO(
        description: object.postDTO.description,
        username: object.userDTO.username,
        likes: object.postDTO.likes,
        bookmarks: object.postDTO.bookmarks,
        postId: object.postDTO.postId,
        datePublished: object.postDTO.datePublished,
        postUrl: object.postDTO.postUrl,
        postAuthorUid: object.userDTO.uid,
        profImage: object.userDTO.photoUrl,
        commentCount: object.postDTO.commentCount,
        tags: object.postDTO.tags,
        isReel: object.postDTO.isReel
    );
  }
}

class PostBoMapperData {
  final PostDTO postDTO;
  final UserDTO userDTO;

  PostBoMapperData({required this.postDTO, required this.userDTO});
}
