import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/utils/mapper.dart';

class UserBoMapper extends Mapper<UserDTO, UserBO> {
  @override
  UserBO call(UserDTO object) {
    return UserBO(
      username: object.username,
      uid: object.uid,
      photoUrl: object.photoUrl,
      email: object.email,
      bio: object.bio,
      country: object.country,
      birthDate: object.birthDate,
      followers: object.followers,
      following: object.following,
    );
  }
}
