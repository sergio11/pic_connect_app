part of 'comments_bloc.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState({
    @Default([]) final List<CommentBO> commentsByPost,
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _CommentsState;
}