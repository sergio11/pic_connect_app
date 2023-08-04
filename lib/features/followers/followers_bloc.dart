import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/usecase/find_all_that_user_is_following_by_use_case.dart';
import 'package:pic_connect/domain/usecase/find_followers_by_user_use_case.dart';
import 'package:pic_connect/domain/usecase/follow_user_use_case.dart';

part 'followers_event.dart';

part 'followers_state.dart';

part 'followers_bloc.freezed.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  final FindFollowersByUserUseCase findFollowersByUserUseCase;
  final FindAllThatUserIsFollowingByUseCase findAllThatUserIsFollowingByUseCase;
  final FollowUserUseCase followUserUseCase;

  FollowersBloc(
      {required this.findFollowersByUserUseCase,
      required this.findAllThatUserIsFollowingByUseCase,
      required this.followUserUseCase})
      : super(const FollowersState()) {
    on<OnLoadFollowingEvent>(onLoadFollowingEventHandler);
    on<OnLoadFollowersEvent>(onLoadFollowersEventHandler);
    on<OnFollowUserEvent>(onFollowUserEventHandler);
    on<OnUnFollowUserEvent>(onUnFollowUserEventHandler);
    on<OnRefreshDataEvent>(onRefreshDataEventHandler);
  }

  FutureOr<void> onLoadFollowingEventHandler(
      OnLoadFollowingEvent event, Emitter<FollowersState> emit) async {
    await _fetchFollowing(event.userUid, event.authUserUid, emit);
  }

  FutureOr<void> onLoadFollowersEventHandler(
      OnLoadFollowersEvent event, Emitter<FollowersState> emit) async {
    await _fetchFollowers(event.userUid, event.authUserUid, emit);
  }

  FutureOr<void> onRefreshDataEventHandler(
      OnRefreshDataEvent event, Emitter<FollowersState> emit) async {
    if (state.contentType == ContentTypeEnum.followers) {
      await _fetchFollowers(state.userUid, state.authUserUid, emit);
    } else {
      await _fetchFollowing(state.userUid, state.authUserUid, emit);
    }
  }

  FutureOr<void> onFollowUserEventHandler(
      OnFollowUserEvent event, Emitter<FollowersState> emit) async {
    emit(state.copyWith(allowUserInput: false));
    final response = await followUserUseCase(FollowUserParams(event.userUid));
    response.fold(
        (failure) => emit(state.copyWith(
            errorMessage: failure.message, allowUserInput: true)),
        (isFollowed) => emit(state.copyWith(
            errorMessage: null,
            allowUserInput: true,
            users: !isFollowed
                ? state.users
                : _updateUserFollowers(
                    event.userUid, state.authUserUid, true))));
  }

  FutureOr<void> onUnFollowUserEventHandler(
      OnUnFollowUserEvent event, Emitter<FollowersState> emit) async {
    emit(state.copyWith(allowUserInput: false));
    final response = await followUserUseCase(FollowUserParams(event.userUid));
    response.fold(
        (failure) => emit(state.copyWith(errorMessage: failure.message, allowUserInput: true)),
        (isUnFollowed) => emit(state.copyWith(
            errorMessage: null,
            allowUserInput: true,
            users: !isUnFollowed
                ? state.users
                : _updateUserFollowers(
                    event.userUid, state.authUserUid, false))));
  }

  FutureOr<void> _fetchFollowers(
      String userUid, String authUserUid, Emitter<FollowersState> emit) async {
    emit(state.copyWith(
        isLoading: true, userUid: userUid, authUserUid: authUserUid));
    final response = await findAllThatUserIsFollowingByUseCase(
        FindAllThatUserIsFollowingByParams(userUid));
    response.fold(
        (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message)),
        (users) => emit(state.copyWith(
            isLoading: false, errorMessage: null, users: users)));
  }

  FutureOr<void> _fetchFollowing(
      String userUid, String authUserUid, Emitter<FollowersState> emit) async {
    emit(state.copyWith(
        isLoading: true, userUid: userUid, authUserUid: authUserUid));
    final response = await findAllThatUserIsFollowingByUseCase(
        FindAllThatUserIsFollowingByParams(userUid));
    response.fold(
        (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message)),
        (users) => emit(state.copyWith(
            isLoading: false, errorMessage: null, users: users)));
  }

  List<UserBO> _updateUserFollowers(
      String userUid, String authUserUid, bool follow) {
    final index = state.users.indexWhere((element) => element.uid == userUid);
    final List<UserBO> users = List.from(state.users);
    final user = users.removeAt(index);
    final List<String> followers;
    if (follow) {
      followers = List.from(user.followers)..add(authUserUid);
    } else {
      followers = List.from(user.followers)..remove(authUserUid);
    }
    return users..insert(index, user.copyWith(followers: followers));
  }
}
