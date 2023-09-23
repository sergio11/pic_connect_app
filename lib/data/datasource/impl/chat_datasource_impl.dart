import 'dart:async';

import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:pic_connect/data/datasource/chat_datasource.dart';
import 'package:pic_connect/data/datasource/dto/room_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/utils/full_mapper.dart';
import 'package:pic_connect/utils/mapper.dart';

class ChatDatasourceImpl extends ChatDatasource {
  final FirebaseChatCore firebaseChatCore;
  final FullMapper<User, UserDTO> userMapper;
  final Mapper<Room, RoomDTO> roomMapper;

  ChatDatasourceImpl(
      {required this.firebaseChatCore,
      required this.userMapper,
      required this.roomMapper});

  @override
  Future<RoomDTO> createRoom(UserDTO otherUser) async {
    final roomCreated = await firebaseChatCore.createRoom(userMapper.mapToFrom(otherUser), metadata: {
      "room_title": otherUser.username,
      "room_image_url": otherUser.photoUrl
    });
    return roomMapper(roomCreated);
  }

  @override
  Future<List<RoomDTO>> findRooms() async {
    final roomList = await firebaseChatCore.rooms(orderByUpdatedAt: true).first;
    return roomList.map((room) => roomMapper(room)).toList();
  }

  @override
  Future<void> deleteRoom(String roomUuid) async {
    await firebaseChatCore.deleteRoom(roomUuid);
  }
}
