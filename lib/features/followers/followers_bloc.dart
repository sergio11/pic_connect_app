import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/usecase/find_all_that_user_is_following_by_use_case.dart';
import 'package:pic_connect/domain/usecase/find_followers_by_user_use_case.dart';

part 'followers_event.dart';

part 'followers_state.dart';

part 'followers_bloc.freezed.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {

  final FindFollowersByUserUseCase findFollowersByUserUseCase;
  final FindAllThatUserIsFollowingByUseCase findAllThatUserIsFollowingByUseCase;

  FollowersBloc({
    required this.findFollowersByUserUseCase,
    required this.findAllThatUserIsFollowingByUseCase
  }) : super(const FollowersState()) {
    on<OnLoadFollowingEvent>(onLoadFollowingEventHandler);
    on<OnLoadFollowersEvent>(onLoadFollowersEventHandler);
  }

  FutureOr<void> onLoadFollowingEventHandler(OnLoadFollowingEvent event,
      Emitter<FollowersState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await findAllThatUserIsFollowingByUseCase(
        FindAllThatUserIsFollowingByParams(event.userUid));
    response.fold((failure) =>
        emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
            (users) =>
                emit(state.copyWith(isLoading: false, errorMessage: null, users: users))
    );
  }

  FutureOr<void> onLoadFollowersEventHandler(OnLoadFollowersEvent event,
      Emitter<FollowersState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await findFollowersByUserUseCase(
        FindFollowersByUserParams(event.userUid));
    response.fold((failure) =>
        emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
            (users) =>
                emit(state.copyWith(isLoading: false, errorMessage: null, users: users))
    );
  }
}
