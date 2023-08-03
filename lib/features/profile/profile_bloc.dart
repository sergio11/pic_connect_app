import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';
import 'package:pic_connect/domain/usecase/find_favorites_posts_by_user_use_case.dart';
import 'package:pic_connect/domain/usecase/find_posts_by_user_use_case.dart';
import 'package:pic_connect/domain/usecase/follow_user_use_case.dart';
import 'package:pic_connect/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:pic_connect/domain/usecase/get_user_details_use_case.dart';
import 'package:pic_connect/domain/usecase/sign_out_use_case.dart';
import 'package:pic_connect/domain/usecase/unfollow_user_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserDetailsUseCase getUserDetailsUseCase;
  final GetAuthUserUidUseCase getAuthUserUidUseCase;
  final SignOutUseCase signOutUseCase;
  final FindPostsByUserUseCase findPostsByUserUseCase;
  final FollowUserUseCase followUserUseCase;
  final UnFollowUserUseCase unFollowUserUseCase;
  final FindFavoritesPostsByUserUseCase findFavoritesPostsByUserUseCase;

  ProfileBloc(
      {required this.getUserDetailsUseCase,
      required this.getAuthUserUidUseCase,
      required this.signOutUseCase,
      required this.findPostsByUserUseCase,
      required this.followUserUseCase,
      required this.unFollowUserUseCase,
      required this.findFavoritesPostsByUserUseCase})
      : super(const ProfileState()) {
    on<OnLoadProfileEvent>(onLoadProfileEventHandler);
    on<OnSignOutEvent>(onSignOutEventHandler);
    on<OnFollowUserEvent>(onFollowUserEvent);
    on<OnUnFollowUserEvent>(onUnFollowUserEvent);
  }

  FutureOr<void> onSignOutEventHandler(
      OnSignOutEvent event, Emitter<ProfileState> emit) async {
    final response = await signOutUseCase(const DefaultParams());
    response.forEach((r) => emit(state.copyWith(isLogout: true)));
  }

  FutureOr<void> onFollowUserEvent(
      OnFollowUserEvent event, Emitter<ProfileState> emit) async {
    final response = await followUserUseCase(FollowUserParams(event.uid));
    response.fold(
        (l) => emit(state.copyWith(
              isFollowing: false,
            )),
        (r) => emit(state.copyWith(
              followers: state.followers + 1,
              isFollowing: true,
            )));
  }

  FutureOr<void> onUnFollowUserEvent(
      OnUnFollowUserEvent event, Emitter<ProfileState> emit) async {
    final response = await followUserUseCase(FollowUserParams(event.uid));
    response.fold(
        (l) => emit(state.copyWith(
              isFollowing: true,
            )),
        (r) => emit(state.copyWith(
              followers: state.followers - 1,
              isFollowing: false,
            )));
  }

  FutureOr<void> onLoadProfileEventHandler(
      OnLoadProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        isPostGridLoading: true,
        isFavoritePostGridLoading: true));
    final getUserDetailResponse =
        await getUserDetailsUseCase(GetUserDetailsParams(event.uid));
    final getAuthUserUidResponse =
        await getAuthUserUidUseCase(const DefaultParams());
    getUserDetailResponse
        .flatMap((r) => getAuthUserUidResponse.map((l) => tuple2(r, l)))
        .fold(
            (fail) => emit(state.copyWith(isLoading: false)),
            (data) => emit(state.copyWith(
                isLoading: false,
                userUid: data.init.uid,
                authUserUid: data.last,
                photoUrl: data.init.photoUrl,
                bio: data.init.bio,
                username: data.init.username,
                followers: data.init.followers.length,
                following: data.init.following.length,
                isFollowing: data.init.followers.contains(data.last),
                isAuthUser: data.init.uid == data.last)));

    final findPostsByUserResponse =
        await findPostsByUserUseCase(FindPostsByUserParams(event.uid));
    findPostsByUserResponse.fold(
        (l) => emit(state.copyWith(isPostGridLoading: false)),
        (postsByUser) => emit(state.copyWith(
            isPostGridLoading: false,
            postList: postsByUser,
            postLen: postsByUser.length)));

    final findFavoritesPostsByUserResponse =
        await findFavoritesPostsByUserUseCase(
            FindFavoritesPostsByUserParams(event.uid));
    findFavoritesPostsByUserResponse.fold(
        (l) => emit(state.copyWith(isFavoritePostGridLoading: false)),
        (favoritePostsByUser) => emit(state.copyWith(
            isFavoritePostGridLoading: false,
            favoritePostList: favoritePostsByUser)));
  }
}
