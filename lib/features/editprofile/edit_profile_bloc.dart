import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/domain/usecase/get_user_details_use_case.dart';
import 'package:pic_connect/domain/usecase/update_user_use_case.dart';
import 'package:pic_connect/utils/utils.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

part 'edit_profile_bloc.freezed.dart';

class EditProfileBloc extends Bloc<EditProfilesEvent, EditProfileState> {
  final GetUserDetailsUseCase getUserDetailsUseCase;
  final UpdateUserUseCase updateUserUseCase;

  EditProfileBloc(
      {required this.getUserDetailsUseCase, required this.updateUserUseCase})
      : super(const EditProfileState()) {
    on<OnEditProfileEvent>(onEditProfileEventHandler);
    on<OnUpdateProfileEvent>(onUpdateProfileEventHandler);
  }

  FutureOr<void> onEditProfileEventHandler(
      OnEditProfileEvent event, Emitter<EditProfileState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final response =
        await getUserDetailsUseCase(GetUserDetailsParams(event.uid));
    response.fold(
        (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message)),
        (userDetail) => emit(state.copyWith(
            isLoading: false,
            userUid: userDetail.uid,
            username: userDetail.username,
            email: userDetail.email,
            photoUrl: userDetail.photoUrl,
            bio: userDetail.bio ?? "",
            country: userDetail.country ?? "",
            birthDate: userDetail.birthDate ?? "",
            errorMessage: null)));
  }

  FutureOr<void> onPickUpImageCalled(
      OnUpdateProfileImageEvent event, Emitter<EditProfileState> emit) async {
    try {
      Uint8List im = await pickImageAsBytes(event.imageSource);
      emit(state.copyWith(image: im));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: "An error occurred when trying to pick up image"));
    }
  }

  FutureOr<void> onUpdateProfileEventHandler(
      OnUpdateProfileEvent event, Emitter<EditProfileState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final response = await updateUserUseCase(UpdateUserParams(
        uid: state.userUid,
        username: event.username,
        email: event.email,
        file: state.image,
        bio: event.bio,
        country: event.country,
        birthDate: event.birthDate));
    response.fold(
        (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message)),
        (userDetail) => emit(state.copyWith(
            isLoading: false,
            username: userDetail.username,
            email: userDetail.email,
            photoUrl: userDetail.photoUrl,
            bio: userDetail.bio ?? "",
            country: userDetail.country ?? "",
            birthDate: userDetail.birthDate ?? "",
            errorMessage: null)));
  }
}
