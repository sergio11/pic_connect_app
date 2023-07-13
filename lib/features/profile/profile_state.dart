part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _ProfileState;
}