import 'package:pic_connect/data/datasource/dto/message_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';

class RoomDTO {
  final String uid;
  final String? name;
  final String type;
  final String? imageUrl;
  final List<UserDTO> users;
  final List<MessageDTO> lastMessages;
  final int? updatedAt;
  final int? createAt;

  RoomDTO(
      {required this.uid,
      required this.name,
      required this.type,
      required this.imageUrl,
      required this.users,
      required this.lastMessages,
      required this.createAt,
      required this.updatedAt});
}
