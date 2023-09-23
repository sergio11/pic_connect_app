import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:pic_connect/data/datasource/dto/room_dto.dart';
import 'package:pic_connect/utils/mapper.dart';

class RoomDtoMapper extends Mapper<Room, RoomDTO> {

  @override
  RoomDTO call(Room object) {
    return RoomDTO(
        uid: object.id,
        name: object.metadata?["room_title"],
        type: object.type?.name ?? RoomType.direct.name,
        createAt: object.createdAt,
        updatedAt: object.updatedAt,
        imageUrl: object.metadata?["room_image_url"], subtitle: '');
  }
}
