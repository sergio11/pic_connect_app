part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(true) final bool isLoading,
    @Default(0) final int postLen,
    @Default(0) final int followers,
    @Default(0) final int following,
    final String? userUid,
    final String? authUserUid,
    final String? photoUrl,
    final String? bio,
    final String? username,
    @Default(false) final bool isLogout,
    @Default(false) final bool isFollowing,
    @Default(false) final bool isAuthUser,
    @Default([]) final List<PostBO> postList,
    final String? errorMessage
  }) = _ProfileState;
}