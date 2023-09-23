
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:pic_connect/data/datasource/dto/room_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';

abstract class ChatDatasource {

  Future<RoomDTO> createRoom(UserDTO otherUser);

  Future<List<RoomDTO>> findRooms();

  Future<void> deleteRoom(String roomUuid);
}
