import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/room.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';
import 'package:pic_connect/domain/usecase/delete_room_use_case.dart';
import 'package:pic_connect/domain/usecase/find_user_auth_rooms_use_case.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';
part 'rooms_bloc.freezed.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final FindUserAuthRoomsUseCase findUserAuthRoomsUseCase;
  final DeleteRoomUseCase deleteRoomUseCase;

  RoomsBloc(
      {required this.findUserAuthRoomsUseCase, required this.deleteRoomUseCase})
      : super(const RoomsState()) {
    on<OnLoadUserRoomsEvent>(onLoadUserRoomsEventHandler);
    on<OnDeleteRoomEvent>(onDeleteRoomEventHandler);
  }

  FutureOr<void> onLoadUserRoomsEventHandler(
      OnLoadUserRoomsEvent event, Emitter<RoomsState> emit) async {
    emit(state.copyWith(isLoading: true, authUserUuid: event.authUserUuid));
    final response = await findUserAuthRoomsUseCase(const DefaultParams());
    response.fold(
        (error) => emit(state.copyWith(
            isLoading: false, rooms: [], errorMessage: error.message)),
        (rooms) => emit(state.copyWith(
            isLoading: false, rooms: rooms, errorMessage: null)));
  }

  FutureOr<void> onDeleteRoomEventHandler(
      OnDeleteRoomEvent event, Emitter<RoomsState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await deleteRoomUseCase(DeleteRoomParams(event.roomUuid));
    response.fold(
        (error) =>
            emit(state.copyWith(isLoading: false, errorMessage: error.message)),
        (success) => emit(state.copyWith(
            isLoading: false,
            rooms: List.from(state.rooms)
              ..removeWhere((element) => element.uid == event.roomUuid),
            errorMessage: null)));
  }
}
