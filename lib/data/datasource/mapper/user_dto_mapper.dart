import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/utils/mapper.dart';

class UserDtoMapper extends Mapper<DocumentSnapshot, UserDTO> {
  @override
  UserDTO call(DocumentSnapshot<Object?> object) {
    var snapshot = object.data() as Map<String, dynamic>;
    return UserDTO(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      bio: snapshot["bio"],
      country: snapshot["country"],
      birthDate: snapshot["birthDate"],
      followers: snapshot['followers'] is List
          ? List<String>.from(snapshot['followers'] as List)
          : [],
      following: snapshot['following'] is List
          ? List<String>.from(snapshot['following'] as List)
          : [],
    );
  }
}
