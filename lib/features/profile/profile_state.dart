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
    @Default(false) final bool isPictureGridLoading,
    @Default(false) final bool isReelsGridLoading,
    @Default(false) final bool isBookmarkPostGridLoading,
    @Default([]) final List<PostBO> picturesList,
    @Default([]) final List<PostBO> reelsList,
    @Default([]) final List<PostBO> bookmarkPostList,
    @Default(ProfileTab.values) final List<ProfileTab> profileTabs,
    final String? errorMessage
  }) = _ProfileState;
}

enum ProfileTab {
  pictures, reels, bookmark
}