import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:pic_connect/data/datasource/dto/message_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/utils/full_mapper.dart';
import 'package:pic_connect/utils/mapper.dart';

class MessageDtoMapper extends Mapper<Message, MessageDTO> {
  final FullMapper<User, UserDTO> userChatMapper;

  MessageDtoMapper({required this.userChatMapper});

  @override
  MessageDTO call(Message object) {
    return MessageDTO(
        id: object.id,
        author: userChatMapper.mapFromTo(object.author),
        createdAt: object.createdAt,
        metadata: object.metadata,
        repliedMessage:
            object.repliedMessage != null ? call(object.repliedMessage!) : null,
        roomId: object.roomId,
        showStatus: object.showStatus,
        status: object.status?.name,
        type: object.type.name,
        updatedAt: object.updatedAt);
  }
}
