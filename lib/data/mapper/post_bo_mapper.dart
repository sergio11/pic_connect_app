import 'package:pic_connect/data/datasource/dto/post_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/utils/mapper.dart';

class PostBoMapper extends Mapper<PostBoMapperData, PostBO> {
  @override
  PostBO call(PostBoMapperData object) {
    return PostBO(
        description: object.postDTO.description,
        uid: object.userDTO.uid,
        username: object.userDTO.username,
        likes: object.postDTO.likes,
        postId: object.postDTO.postId,
        datePublished: object.postDTO.datePublished,
        postUrl: object.postDTO.postUrl,
        profImage: object.userDTO.photoUrl
    );
  }
}

class PostBoMapperData {
  final PostDTO postDTO;
  final UserDTO userDTO;

  PostBoMapperData({
    required this.postDTO,
    required this.userDTO
  });
}