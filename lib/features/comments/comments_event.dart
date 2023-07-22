part of 'comments_bloc.dart';

@freezed
class CommentsEvent with _$CommentsEvent {
  const factory CommentsEvent.loadCommentsByPost(String postId, String authUserUid) = OnLoadCommentsByPostEvent;
  const factory CommentsEvent.publishComment(String postId, String text) = OnPublishCommentEvent;
  const factory CommentsEvent.refreshCommentsByPost(String postId) = OnRefreshCommentsEvent;
}