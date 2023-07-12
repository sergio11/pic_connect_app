import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'signin_state.freezed.dart';

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