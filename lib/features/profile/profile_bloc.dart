import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';
import 'package:pic_connect/domain/usecase/fetch_moments_by_user_use_case.dart';
import 'package:pic_connect/domain/usecase/find_bookmark_posts_by_user_use_case.dart';
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
  final FindBookmarkPostsByUserUseCase findBookmarkPostsByUserUseCase;
  final FetchMomentsByUserUseCase fetchMomentsByUserUseCase;

  ProfileBloc(
      {required this.getUserDetailsUseCase,
      required this.getAuthUserUidUseCase,
      required this.signOutUseCase,
      required this.findPostsByUserUseCase,
      required this.followUserUseCase,
      required this.unFollowUserUseCase,
      required this.findFavoritesPostsByUserUseCase,
      required this.findBookmarkPostsByUserUseCase,
      required this.fetchMomentsByUserUseCase})
      : super(const ProfileState()) {
    on<OnLoadProfileEvent>(onLoadProfileEventHandler);
    on<OnSignOutEvent>(onSignOutEventHandler);
    on<OnFollowUserEvent>(onFollowUserEventHandler);
    on<OnUnFollowUserEvent>(onUnFollowUserEventHandler);
    on<OnRefreshEvent>(onRefreshDataEventHandler);
  }

  FutureOr<void> onSignOutEventHandler(
      OnSignOutEvent event, Emitter<ProfileState> emit) async {
    final response = await signOutUseCase(const DefaultParams());
    response.forEach((r) => emit(state.copyWith(isLogout: true)));
  }

  FutureOr<void> onFollowUserEventHandler(
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

  FutureOr<void> onUnFollowUserEventHandler(
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

  FutureOr<void> onRefreshDataEventHandler(
      OnRefreshEvent event, Emitter<ProfileState> emit) async {
    await _loadUserProfile(state.userUid, emit);
  }

  FutureOr<void> onLoadProfileEventHandler(
      OnLoadProfileEvent event, Emitter<ProfileState> emit) async {
    await _loadUserProfile(event.uid, emit);
  }

  FutureOr<void> _loadUserProfile(
      String userUid, Emitter<ProfileState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        isPictureGridLoading: true,
        isReelsGridLoading: true,
        isBookmarkPostGridLoading: true,
        postLen: 0));
    final getUserDetailResponse =
        await getUserDetailsUseCase(GetUserDetailsParams(userUid));
    final getAuthUserUidResponse =
        await getAuthUserUidUseCase(const DefaultParams());
    getUserDetailResponse
        .flatMap((r) => getAuthUserUidResponse.map((l) => tuple2(r, l)))
        .fold(
            (fail) => emit(state.copyWith(isLoading: false)),
            (data) => emit(state.copyWith(
                isLoading: false,
                userUid: userUid,
                authUserUid: data.last,
                photoUrl: data.init.photoUrl,
                bio: data.init.bio ?? "",
                birthDate: data.init.birthDate ?? "",
                country: data.init.country ?? "",
                username: data.init.username,
                followers: data.init.followers.length,
                following: data.init.following.length,
                isFollowing: data.init.followers.contains(data.last),
                isAuthUser: userUid == data.last)));

    final findPicturesByUserResponse = await findPostsByUserUseCase(
        FindPostsByUserParams(userUid, FindPostTypeEnum.pictures));
    findPicturesByUserResponse.fold(
        (l) => emit(state.copyWith(isPictureGridLoading: false)),
        (picturesByUser) => emit(state.copyWith(
            isPictureGridLoading: false,
            picturesList: picturesByUser,
            postLen: state.postLen + picturesByUser.length)));

    final findReelsByUserResponse = await findPostsByUserUseCase(
        FindPostsByUserParams(userUid, FindPostTypeEnum.reels));
    findReelsByUserResponse.fold(
        (l) => emit(state.copyWith(isReelsGridLoading: false)),
        (reelsByUser) => emit(state.copyWith(
            isReelsGridLoading: false,
            reelsList: reelsByUser,
            postLen: state.postLen + reelsByUser.length)));

    final findBookmarkPostsByUserResponse =
        await findBookmarkPostsByUserUseCase(
            FindBookmarkPostsByUserParams(userUid));
    findBookmarkPostsByUserResponse.fold(
        (l) => emit(state.copyWith(isBookmarkPostGridLoading: false)),
        (bookmarkPostsByUser) => emit(state.copyWith(
            isBookmarkPostGridLoading: false,
            bookmarkPostList: bookmarkPostsByUser)));
  }
}
