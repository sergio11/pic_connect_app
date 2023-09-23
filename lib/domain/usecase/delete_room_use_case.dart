import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/repository/chat_repository.dart';
import 'base_use_case.dart';

class DeleteRoomUseCase extends BaseUseCase<bool, DeleteRoomParams> {

  final ChatRepository chatRepository;

  DeleteRoomUseCase({
    required this.chatRepository
  });

  @override
  Future<Either<Failure, bool>> call(DeleteRoomParams param) async {
    return await chatRepository.deleteRoom(param.roomUuid);
  }
}

class DeleteRoomParams extends Equatable {

  final String roomUuid;

  const DeleteRoomParams(this.roomUuid);

  @override
  List<Object> get props => [roomUuid];
}