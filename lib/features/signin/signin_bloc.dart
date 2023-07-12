import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pic_connect/domain/usecase/is_logged_in_use_case.dart';
import 'package:pic_connect/domain/usecase/sign_in_user_use_case.dart';
import 'package:pic_connect/features/signin/signin_event.dart';
import 'package:pic_connect/features/signin/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  final IsLoggedInUseCase isLoggedInUseCase;
  final SignInUserUseCase signInUserUseCase;

  SignInBloc({
    required this.signInUserUseCase,
    required this.isLoggedInUseCase
  }) : super(const SignInState()) {
    on<OnDoSignInEvent>(onSignInEventHandler);
  }

  FutureOr<void> onSignInEventHandler(OnDoSignInEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await signInUserUseCase(SignInParams(event.email, event.password));
    response.fold(
            (fail) => emit(state.copyWith(
                isLoading: false,
                errorMessage: fail.message
            )),
            (success) => emit(state.copyWith(
                isLoading: false,
                isLoggedIn: true,
            ))
        );
  }

}