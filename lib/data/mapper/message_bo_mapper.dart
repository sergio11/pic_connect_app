import 'package:pic_connect/data/datasource/dto/message_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/domain/models/message.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/utils/mapper.dart';

class MessageBoMapper extends Mapper<MessageDTO, MessageBO> {
  final Mapper<UserDTO, UserBO> userMapper;

  MessageBoMapper({required this.userMapper});

  @override
  MessageBO call(MessageDTO object) {
    return MessageBO(
        id: object.id,
        author: userMapper(object.author),
        createdAt: object.createdAt,
        metadata: object.metadata,
        repliedMessage:
            object.repliedMessage != null ? call(object.repliedMessage!) : null,
        roomId: object.roomId,
        showStatus: object.showStatus,
        status: object.status,
        type: object.type,
        updatedAt: object.updatedAt);
  }
}
