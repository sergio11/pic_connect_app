part of 'reels_bloc.dart';

@freezed
class ReelsEvent with _$ReelsEvent {
  const factory ReelsEvent.load(String authUserUid) = OnLoadTopReelsEvent;
  const factory ReelsEvent.likePost(String postId) = OnLikePostEvent;
  const factory ReelsEvent.saveBookmark(String postId) = OnSaveBookmarkEvent;
}