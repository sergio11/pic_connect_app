import 'dart:async';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/domain/usecase/sign_up_user_use_case.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_event.dart';
part 'signup_state.dart';
part 'signup_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUserUseCase signUpUserUseCase;

  SignUpBloc({required this.signUpUserUseCase}) : super(const SignUpState()) {
    on<OnDoSignUpEvent>(onSignUpCalled);
    on<OnPickUpImageEvent>(onPickUpImageCalled);
  }

  FutureOr<void> onPickUpImageCalled(
      OnPickUpImageEvent event, Emitter<SignUpState> emit) async {
    try {
      Uint8List im = await pickImageAsBytes(event.imageSource);
      emit(state.copyWith(image: im));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: "An error occurred when trying to pick up image"));
    }
  }

  FutureOr<void> onSignUpCalled(
      OnDoSignUpEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    if (state.image != null) {
      final response = await signUpUserUseCase(SignUpParams(event.email,
          event.password, event.username, event.bio, state.image!));
      response.fold(
          (fail) => emit(
              state.copyWith(isLoading: false, errorMessage: fail.message)),
          (success) => emit(state.copyWith(
                isLoading: false,
                isSignUpSuccess: true,
              )));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: "You must select a profile picture!"));
    }
  }
}
