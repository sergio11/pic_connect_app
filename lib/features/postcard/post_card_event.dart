part of 'post_card_bloc.dart';

@freezed
class PostCardEvent with _$PostCardEvent {
  const factory PostCardEvent.showPost(PostBO post, String authUserUid) = OnShowPostEvent;
}