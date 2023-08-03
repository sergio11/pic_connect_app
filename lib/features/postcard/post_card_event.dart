part of 'post_card_bloc.dart';

@freezed
class PostCardEvent with _$PostCardEvent {
  const factory PostCardEvent.showPost(PostBO post, String authUserUid) = OnShowPostEvent;
  const factory PostCardEvent.deletePost(String postId) = OnDeletePostEvent;
  const factory PostCardEvent.likePost(String postId) = OnLikePostEvent;
  const factory PostCardEvent.saveBookmark(String postId) = OnSaveBookmarkEvent;
}