part of 'add_post_bloc.dart';

@freezed
class AddPostEvent with _$AddPostEvent {
  const factory AddPostEvent.addNewPost(ImageSource imageSource, String userUid) = OnAddNewPostEvent;
  const factory AddPostEvent.selectFile(String filePath) = OnFileSelectedEvent;
  const factory AddPostEvent.uploadPost(String description) = OnUploadPostEvent;
  const factory AddPostEvent.editedImage(Uint8List imageData) = OnEditedImageEvent;
}