import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:pic_connect/data/datasource/chat_datasource.dart';
import 'package:pic_connect/data/datasource/dto/room_dto.dart';
import 'package:pic_connect/data/datasource/user_datasource.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/room.dart';
import 'package:pic_connect/domain/repository/chat_repository.dart';
import 'package:pic_connect/utils/mapper.dart';

class ChatRepositoryImpl extends ChatRepository {
  final UserDatasource userDatasource;
  final ChatDatasource chatDatasource;
  final Mapper<RoomDTO, RoomBO> roomBoMapper;

  ChatRepositoryImpl(
      {required this.userDatasource,
      required this.chatDatasource,
      required this.roomBoMapper});

  @override
  Future<Either<Failure, RoomBO>> createRoomWithUser(String userUuid) async {
    try {
      final userDTO = await userDatasource.findByUid(userUuid);
      final roomDTO = await chatDatasource.createRoom(userDTO);
      return Right(roomBoMapper(roomDTO));
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoomBO>>> findRooms() async {
    try {
      final roomDtoList = await chatDatasource.findRooms();
      return Right(roomDtoList.map((e) => roomBoMapper(e)).toList());
    } catch (err) {
      debugPrint("findRooms error -> ${err.toString()}");
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteRoom(String roomUuid) async {
    try {
      await chatDatasource.deleteRoom(roomUuid);
      return const Right(true);
    } catch (err) {
      debugPrint("deleteRoom error -> ${err.toString()}");
      return Left(Failure(message: err.toString()));
    }
  }
}
