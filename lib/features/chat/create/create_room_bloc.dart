import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/domain/models/room.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';
import 'package:pic_connect/domain/usecase/create_new_roow_use_case.dart';
import 'package:pic_connect/domain/usecase/find_all_users_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_room_event.dart';
part 'create_room_state.dart';
part 'create_room_bloc.freezed.dart';

class CreateRoomBloc extends Bloc<CreateRoomEvent, CreateRoomState> {
  final CreateNewRoomUseCase createNewRoomUseCase;
  final FindAllUsersUseCase findAllUsersUseCase;

  CreateRoomBloc(
      {required this.createNewRoomUseCase, required this.findAllUsersUseCase})
      : super(const CreateRoomState()) {
    on<OnLoadUsersEvent>(onLoadUsersFollowedEventHandler);
    on<OnCreateRoomEvent>(onCreateRoomEventHandler);
  }

  FutureOr<void> onLoadUsersFollowedEventHandler(
      OnLoadUsersEvent event, Emitter<CreateRoomState> emit) async {
    emit(state.copyWith(isLoading: true, authUserUuid: event.authUserUuid));
    final response = await findAllUsersUseCase(const DefaultParams());
    response.fold(
        (error) =>
            emit(state.copyWith(isLoading: false, errorMessage: error.message)),
        (users) => emit(state.copyWith(
            isLoading: false, errorMessage: null, users: users)));
  }

  FutureOr<void> onCreateRoomEventHandler(
      OnCreateRoomEvent event, Emitter<CreateRoomState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await createNewRoomUseCase(CreateNewRoomParams(event.userUuid));
    response.fold(
            (error) =>
            emit(state.copyWith(isLoading: false, errorMessage: error.message)),
            (room) => emit(state.copyWith(
            isLoading: false, errorMessage: null, roomCreated: room)));
  }
}
