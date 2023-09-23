import 'package:pic_connect/data/datasource/dto/room_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/domain/models/room.dart';
import 'package:pic_connect/utils/mapper.dart';

class RoomBoMapper extends Mapper<RoomBoMapperDataInput, RoomBO> {
  @override
  RoomBO call(RoomBoMapperDataInput object) {
    return RoomBO(
        uid: object.roomDTO.uid,
        type: object.roomDTO.type,
        updatedAt: object.roomDTO.updatedAt,
        createAt: object.roomDTO.createAt,
        subtitle: object.roomDTO.subtitle,
        name: object.userTargetDTO.username,
        imageUrl: object.userTargetDTO.photoUrl);
  }
}

class RoomBoMapperDataInput {
  final RoomDTO roomDTO;
  final UserDTO userTargetDTO;

  RoomBoMapperDataInput({required this.roomDTO, required this.userTargetDTO});
}
