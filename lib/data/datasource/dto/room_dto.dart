import 'package:pic_connect/data/datasource/dto/user_dto.dart';

class RoomDTO {
  final String uid;
  final String type;
  final String subtitle;
  final int? updatedAt;
  final int? createAt;
  final List<String> userIds;

  RoomDTO(
      {required this.uid,
      required this.subtitle,
      required this.type,
      required this.createAt,
      required this.updatedAt,
      required this.userIds});
}
