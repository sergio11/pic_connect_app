part of 'signin_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    final String? email,
    final String? password,
    @Default(false) final bool isLoggedIn,
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _SignUpState;
}