import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';
import 'package:pic_connect/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:pic_connect/domain/usecase/get_user_details_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserDetailsUseCase getUserDetailsUseCase;
  final GetAuthUserUidUseCase getAuthUserUidUseCase;

  ProfileBloc(
      {required this.getUserDetailsUseCase,
      required this.getAuthUserUidUseCase})
      : super(const ProfileState()) {
    on<OnLoadProfileEvent>(onLoadProfileEventHandler);
  }

  FutureOr<void> onLoadProfileEventHandler(
      OnLoadProfileEvent event, Emitter<ProfileState> emit) async {
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
                photoUrl: data.init.photoUrl,
                bio: data.init.bio,
                username: data.init.username,
                followers: data.init.followers.length,
                following: data.init.following.length,
                isAuthUser: data.init.uid == data.last
            ))
    );
  }
}
