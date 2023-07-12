import 'dart:async';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:pic_connect/domain/usecase/sign_up_user_use_case.dart';
import 'package:pic_connect/features/signup/signup_event.dart';
import 'package:pic_connect/features/signup/signup_state.dart';
import 'package:pic_connect/utils/utils.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUserUseCase signUpUserUseCase;

  SignUpBloc({required this.signUpUserUseCase}) : super(const SignUpState()) {
    on<OnDoSignUpEvent>(onSignUpCalled);
    on<OnPickUpImageEvent>(onPickUpImageCalled);
  }

  FutureOr<void> onPickUpImageCalled(
      OnPickUpImageEvent event, Emitter<SignUpState> emit) async {
    try {
      Uint8List im = await pickImage(event.imageSource);
      emit(state.copyWith(image: im));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: "An error occurred when trying to pick up image"));
    }
  }

  FutureOr<void> onSignUpCalled(
      OnDoSignUpEvent event, Emitter<SignUpState> emit) async {
    try {
      //emit(SignUpLoadingState());
    } catch (e) {
      //emit(SignUpErrorState("Something Went Wrong"));
    }
  }
}
