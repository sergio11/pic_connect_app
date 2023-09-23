import 'package:pic_connect/data/datasource/dto/room_dto.dart';
import 'package:pic_connect/domain/models/room.dart';
import 'package:pic_connect/utils/mapper.dart';

class RoomBoMapper extends Mapper<RoomDTO, RoomBO> {
  @override
  RoomBO call(RoomDTO object) {
    return RoomBO(
        uid: object.uid,
        name: object.name,
        type: object.type,
        imageUrl: object.imageUrl,
        updatedAt: object.updatedAt,
        createAt: object.createAt,
        subtitle: object.subtitle);
  }
}
