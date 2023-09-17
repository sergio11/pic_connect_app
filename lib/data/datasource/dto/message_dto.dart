import 'package:pic_connect/data/datasource/dto/user_dto.dart';

class MessageDTO {
  final String id;
  final UserDTO author;
  final int? createdAt;
  final Map<String, dynamic>? metadata;
  final MessageDTO? repliedMessage;
  final String? roomId;
  final bool? showStatus;
  final String? status;
  final String type;
  final int? updatedAt;

  MessageDTO(
      {required this.id,
      required this.author,
      required this.createdAt,
      required this.metadata,
      required this.repliedMessage,
      required this.roomId,
      required this.showStatus,
      required this.status,
      required this.type,
      required this.updatedAt});
}
