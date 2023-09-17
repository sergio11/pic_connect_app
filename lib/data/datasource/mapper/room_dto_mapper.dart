import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:pic_connect/data/datasource/dto/message_dto.dart';
import 'package:pic_connect/data/datasource/dto/room_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/utils/full_mapper.dart';
import 'package:pic_connect/utils/mapper.dart';

class RoomDtoMapper extends Mapper<Room, RoomDTO> {
  final Mapper<Message, MessageDTO> messageMapper;
  final FullMapper<User, UserDTO> userChatMapper;

  RoomDtoMapper({required this.messageMapper, required this.userChatMapper});

  @override
  RoomDTO call(Room object) {
    return RoomDTO(
        uid: object.id,
        name: object.name,
        type: object.type?.name ?? RoomType.direct.name,
        createAt: object.createdAt,
        updatedAt: object.updatedAt,
        imageUrl: object.imageUrl,
        users: object.users.map((e) => userChatMapper.mapFromTo(e)).toList(),
        lastMessages:
            object.lastMessages?.map((e) => messageMapper(e)).toList() ?? []);
  }
}
