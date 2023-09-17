import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/room.dart';
import 'package:pic_connect/domain/repository/chat_repository.dart';

import 'base_use_case.dart';

class FindUserAuthRoomsUseCase
    extends BaseUseCase<List<RoomBO>, DefaultParams> {
  final ChatRepository chatRepository;

  FindUserAuthRoomsUseCase({required this.chatRepository});

  @override
  Future<Either<Failure, List<RoomBO>>> call(DefaultParams param) async {
    return await chatRepository.findRooms();
  }
}
