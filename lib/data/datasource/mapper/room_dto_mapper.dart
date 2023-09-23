import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:pic_connect/data/datasource/dto/room_dto.dart';
import 'package:pic_connect/utils/mapper.dart';

class RoomDtoMapper extends Mapper<Room, RoomDTO> {
  @override
  RoomDTO call(Room object) {

    debugPrint("Room messages -> ${object.lastMessages?.length}");

    return RoomDTO(
        uid: object.id,
        name: object.metadata?["room_title"],
        type: object.type?.name ?? RoomType.direct.name,
        createAt: object.createdAt,
        updatedAt: object.updatedAt,
        imageUrl: object.metadata?["room_image_url"],
        subtitle: _generateSubtitle(_getLastMessage(object)));
  }

  Message? _getLastMessage(Room room) {
    if (room.lastMessages?.isNotEmpty == true) {
      return room.lastMessages?.last;
    }
    return null;
  }

  String _generateSubtitle(Message? lastMessage) {
    if (lastMessage == null) {
      return '';
    }
    if (lastMessage is TextMessage) {
      return lastMessage.text;
    }
    return 'New Message';
  }
}
