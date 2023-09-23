import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/room.dart';
import 'package:pic_connect/domain/repository/chat_repository.dart';

import 'base_use_case.dart';

class FindUserAuthRoomsUseCase
    extends BaseUseCase<List<RoomBO>, FindUserAuthRoomsUseCaseParams> {
  final ChatRepository chatRepository;

  FindUserAuthRoomsUseCase({required this.chatRepository});

  @override
  Future<Either<Failure, List<RoomBO>>> call(FindUserAuthRoomsUseCaseParams param) async {
    return await chatRepository.findRoomsByUser(param.uid);
  }
}

class FindUserAuthRoomsUseCaseParams extends Equatable {

  final String uid;

  const FindUserAuthRoomsUseCaseParams(this.uid);

  @override
  List<Object> get props => [uid];
}
