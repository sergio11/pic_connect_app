part of 'signin_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.onDoSignIn(String email, String password) = OnDoSignInEvent;
}