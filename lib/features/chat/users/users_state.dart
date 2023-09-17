part of 'users_bloc.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState({
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _UsersState;
}