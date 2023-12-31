import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pic_connect/domain/usecase/sign_in_user_use_case.dart';

part 'signin_event.dart';
part 'signin_state.dart';
part 'signin_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  final SignInUserUseCase signInUserUseCase;

  SignInBloc({
    required this.signInUserUseCase,
  }) : super(const SignInState()) {
    on<OnDoSignInEvent>(onSignInEventHandler);
  }

  FutureOr<void> onSignInEventHandler(OnDoSignInEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        errorMessage: null
    ));
    final response = await signInUserUseCase(SignInParams(event.email, event.password));
    response.fold(
            (fail) => emit(state.copyWith(
                isLoading: false,
                isLoginSuccess: false,
                errorMessage: fail.message
            )),
            (success) => emit(state.copyWith(
                isLoading: false,
                isLoginSuccess: true,
                errorMessage: null
            ))
        );
  }

}