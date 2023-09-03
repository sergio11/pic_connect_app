part of 'signup_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.onDoSignUp(
      String email,
      String password,
      String username,
      String repeatPassword
      ) = OnDoSignUpEvent;
  const factory SignUpEvent.pickUpImage(ImageSource imageSource) = OnPickUpImageEvent;
}