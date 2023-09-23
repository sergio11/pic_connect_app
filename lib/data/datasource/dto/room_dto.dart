import 'package:pic_connect/data/datasource/dto/user_dto.dart';

class RoomDTO {
  final String uid;
  final String? name;
  final String type;
  final String? imageUrl;
  final String subtitle;
  final int? updatedAt;
  final int? createAt;

  RoomDTO(
      {required this.uid,
      required this.name,
      required this.subtitle,
      required this.type,
      required this.imageUrl,
      required this.createAt,
      required this.updatedAt});
}
