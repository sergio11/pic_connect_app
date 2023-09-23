import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:pic_connect/data/datasource/chat_datasource.dart';
import 'package:pic_connect/data/datasource/user_datasource.dart';
import 'package:pic_connect/data/mapper/room_bo_mapper.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/room.dart';
import 'package:pic_connect/domain/repository/chat_repository.dart';
import 'package:pic_connect/utils/mapper.dart';

class ChatRepositoryImpl extends ChatRepository {
  final UserDatasource userDatasource;
  final ChatDatasource chatDatasource;
  final Mapper<RoomBoMapperDataInput, RoomBO> roomBoMapper;

  ChatRepositoryImpl(
      {required this.userDatasource,
      required this.chatDatasource,
      required this.roomBoMapper});

  @override
  Future<Either<Failure, RoomBO>> createRoomWithUser(String userUuid) async {
    try {
      final userDTO = await userDatasource.findByUid(userUuid);
      final roomDTO = await chatDatasource.createRoom(userDTO);
      return Right(roomBoMapper(
          RoomBoMapperDataInput(roomDTO: roomDTO, userTargetDTO: userDTO)));
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoomBO>>> findRoomsByUser(String userUuid) async {
    try {
      final roomDtoList = await chatDatasource.findRooms();
      final rooms = await Future.wait(roomDtoList.map((room) async {
        final otherUserUuid = room.userIds.firstWhere((uid) => uid != userUuid);
        final otherUserDto = await userDatasource.findByUid(otherUserUuid);
        final roomBo = roomBoMapper(
          RoomBoMapperDataInput(
            roomDTO: room,
            userTargetDTO: otherUserDto,
          ),
        );
        return roomBo;
      }));
      return Right(rooms);
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
