import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    final String? email,
    final String? password,
    final String? username,
    final String? bio,
    final Uint8List? image,
    @Default(false) final bool isSignUpSuccess,
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _SignUpState;
}
