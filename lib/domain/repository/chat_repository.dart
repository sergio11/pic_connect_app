import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/room.dart';

abstract class ChatRepository {
  Future<Either<Failure, RoomBO>> createRoomWithUser(String userUuid);

  Future<Either<Failure, List<RoomBO>>> findRooms();

  Future<Either<Failure, bool>> deleteRoom(String roomUuid);
}
