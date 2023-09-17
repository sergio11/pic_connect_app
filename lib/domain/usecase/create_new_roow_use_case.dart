import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/room.dart';
import 'package:pic_connect/domain/repository/chat_repository.dart';

import 'base_use_case.dart';

class CreateNewRoomUseCase extends BaseUseCase<RoomBO, CreateNewRoomParams> {
  final ChatRepository chatRepository;

  CreateNewRoomUseCase({required this.chatRepository});

  @override
  Future<Either<Failure, RoomBO>> call(CreateNewRoomParams param) async {
    return await chatRepository.createRoomWithUser(param.userUuid);
  }
}

class CreateNewRoomParams extends Equatable {
  final String userUuid;

  const CreateNewRoomParams(this.userUuid);

  @override
  List<Object> get props => [userUuid];
}
