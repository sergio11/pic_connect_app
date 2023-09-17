import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/utils/full_mapper.dart';

class UserChatDtoMapper extends FullMapper<User, UserDTO> {
  @override
  UserDTO mapFromTo(User object) {
    return UserDTO(
        uid: object.id,
        email: '',
        photoUrl: object.imageUrl ?? '',
        username: "${object.firstName ?? ''} ${object.lastName ?? ''}",
        bio: null,
        country: null,
        birthDate: null,
        lastSeen: object.lastSeen,
        followers: [],
        following: []);
  }

  @override
  User mapToFrom(UserDTO object) {
    return User(id: '');
  }

}
