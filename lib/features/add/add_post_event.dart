part of 'add_post_bloc.dart';

@freezed
class AddPostEvent with _$AddPostEvent {
  const factory AddPostEvent.addPost() = OnAddPostEvent;
}