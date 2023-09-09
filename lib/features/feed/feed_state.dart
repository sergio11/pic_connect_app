part of 'feed_bloc.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState({
    @Default("") final String authUserUid,
    @Default([]) final List<PostBO> posts,
    @Default({}) final Map<UserBO, List<PostBO>> momentsByFollowedUsers,
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _FeedState;
}