part of 'edit_post_bloc.dart';

@freezed
class EditPostEvent with _$EditPostEvent {
  const factory EditPostEvent.onEditPost(String postUuid) = OnEditPostEvent;
  const factory EditPostEvent.onUpdatePost(String placeInfo, String description, List<String> tags) = OnUpdatePostEvent;
}