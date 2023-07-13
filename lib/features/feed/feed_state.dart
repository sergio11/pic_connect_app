part of 'feed_bloc.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState({
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _FeedState;
}