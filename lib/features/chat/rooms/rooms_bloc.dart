import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/room.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';
import 'package:pic_connect/domain/usecase/find_user_auth_rooms_use_case.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';
part 'rooms_bloc.freezed.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final FindUserAuthRoomsUseCase findUserAuthRoomsUseCase;

  RoomsBloc({required this.findUserAuthRoomsUseCase})
      : super(const RoomsState()) {
    on<OnLoadUserRoomsEvent>(onLoadUserRoomsEventHandler);
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
}
