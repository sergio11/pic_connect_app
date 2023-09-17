import 'package:pic_connect/domain/models/message.dart';
import 'package:pic_connect/domain/models/user.dart';

class RoomBO {
  final String uid;
  final String? name;
  final String type;
  final String? imageUrl;
  final List<UserBO> users;
  final List<MessageBO> lastMessages;
  final int? updatedAt;
  final int? createAt;

  RoomBO(
      {required this.uid,
      required this.name,
      required this.type,
      required this.imageUrl,
      required this.users,
      required this.lastMessages,
      required this.updatedAt,
      required this.createAt});
}
