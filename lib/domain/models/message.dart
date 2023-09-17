import 'package:pic_connect/domain/models/user.dart';

class MessageBO {
  final String id;
  final UserBO author;
  final int? createdAt;
  final Map<String, dynamic>? metadata;
  final MessageBO? repliedMessage;
  final String? roomId;
  final bool? showStatus;
  final String? status;
  final String type;
  final int? updatedAt;

  MessageBO(
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
