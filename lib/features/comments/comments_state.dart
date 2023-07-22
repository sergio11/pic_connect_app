part of 'comments_bloc.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState({
    @Default("") final String postId,
    @Default("https://i.stack.imgur.com/l60Hf.png") final String authUserImageUrl,
    @Default([]) final List<CommentBO> commentsByPost,
    @Default(false) final bool isLoading,
    @Default(false) final bool isPublishingComment,
    final String? errorMessage
  }) = _CommentsState;
}