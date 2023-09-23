import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:intl/intl.dart';
import 'package:pic_connect/data/datasource/dto/room_dto.dart';
import 'package:pic_connect/utils/mapper.dart';

class RoomDtoMapper extends Mapper<Room, RoomDTO> {
  @override
  RoomDTO call(Room object) {
    final lastUpdateMillis = object.updatedAt ?? object.createdAt;
    final subtitle = lastUpdateMillis != null
        ? 'Last updated: ${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.fromMillisecondsSinceEpoch(lastUpdateMillis))}'
        : '';
    return RoomDTO(
        uid: object.id,
        type: object.type?.name ?? RoomType.direct.name,
        createAt: object.createdAt,
        updatedAt: object.updatedAt,
        subtitle: subtitle,
        userIds: object.users.map((e) => e.id).toList());
  }
}
