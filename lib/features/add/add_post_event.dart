part of 'add_post_bloc.dart';

@freezed
class AddPostEvent with _$AddPostEvent {
  const factory AddPostEvent.addNewPostFrom(ImageSource imageSource) = OnAddNewPostFromEvent;
  const factory AddPostEvent.takePhoto(String filePath) = OnTakePhotoEvent;
}