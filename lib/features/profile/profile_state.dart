part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) final bool isLoading,
    @Default(0) final int postLen,
    @Default(0) final int followers,
    @Default(0) final int following,
    @Default(false) final bool isFollowing,
    final UserBO? userBO,
    @Default([]) final List<PostBO> postList,
    final String? errorMessage
  }) = _ProfileState;
}