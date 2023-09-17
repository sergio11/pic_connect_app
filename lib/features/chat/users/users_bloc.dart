import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/usecase/create_new_roow_use_case.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.freezed.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final CreateNewRoomUseCase createNewRoomUseCase;

  UsersBloc({required this.createNewRoomUseCase}) : super(const UsersState()) {
    on<OnLoadUsersFollowedEvent>(onLoadUsersFollowedEventHandler);
  }

  FutureOr<void> onLoadUsersFollowedEventHandler(
      OnLoadUsersFollowedEvent event, Emitter<UsersState> emit) async {}
}
