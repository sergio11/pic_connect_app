part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(true) final bool isLoading,
    @Default(0) final int postLen,
    @Default(0) final int followers,
    @Default(0) final int following,
    @Default("") final String userUid,
    @Default("") final String authUserUid,
    @Default("") final String photoUrl,
    @Default("") final String bio,
    @Default("") final String username,
    @Default(false) final bool isLogout,
    @Default(false) final bool isFollowing,
    @Default(false) final bool isAuthUser,
    @Default(false) final bool isPostGridLoading,
    @Default(false) final bool isFavoritePostGridLoading,
    @Default([]) final List<PostBO> postList,
    @Default([]) final List<PostBO> favoritePostList,
    final String? errorMessage
  }) = _ProfileState;
}