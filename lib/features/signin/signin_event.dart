import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnDoSignInEvent extends SignInEvent {

  final String email;
  final String password;

  OnDoSignInEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];

}