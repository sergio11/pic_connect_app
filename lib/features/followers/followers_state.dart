part of 'followers_bloc.dart';

@freezed
class FollowersState with _$FollowersState {
  const factory FollowersState({
    @Default(false) final bool isLoading,
    @Default([]) final List<UserBO> users,
    @Default("") final String authUserUid,
    @Default("") final String toolbarTitle,
    final String? errorMessage
  }) = _FollowersState;
}