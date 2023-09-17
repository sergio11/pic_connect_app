
import 'package:pic_connect/data/datasource/dto/room_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';

abstract class ChatDatasource {

  Future<RoomDTO> createRoom(UserDTO otherUser);

  Future<List<RoomDTO>> findRooms();

}
