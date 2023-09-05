
import 'package:pic_connect/data/datasource/dto/save_user_dto.dart';
import 'package:pic_connect/utils/mapper.dart';

class SaveUserDtoMapper extends Mapper<SaveUserDTO, Map<String, dynamic>> {
  @override
  Map<String, dynamic> call(SaveUserDTO object) {
    return {
      "username": object.username,
      "uid": object.uid,
      "email": object.email,
      "photoUrl": object.photoUrl,
      "bio": object.bio,
      "country": object.country,
      "birthDate": object.birthDate,
      "followers": [],
      "following": [],
    };
  }
}