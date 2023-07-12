import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnDoSignUpEvent extends SignUpEvent {

  final String email;
  final String password;
  final String username;
  final String bio;

  OnDoSignUpEvent(this.email, this.password, this.username, this.bio);

  @override
  List<Object> get props => [email, password, username, bio];

}

class OnPickUpImageEvent extends SignUpEvent {

  final ImageSource imageSource;

  OnPickUpImageEvent(this.imageSource);

  @override
  List<Object> get props => [imageSource];

}