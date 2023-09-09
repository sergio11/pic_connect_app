part of 'add_post_bloc.dart';

@freezed
class AddPostEvent with _$AddPostEvent {
  const factory AddPostEvent.addNewPost(PostTypeEnum postType, ImageSource imageSource, String userUid) = OnAddNewPostEvent;
  const factory AddPostEvent.onPhotoSelected(String imageFilePath) = OnPhotoSelectedEvent;
  const factory AddPostEvent.onVideoSelected(String videoFilePath) = OnVideoSelectedEvent;
  const factory AddPostEvent.uploadPost(String placeInfo, String description, List<String> tags) = OnUploadPostEvent;
  const factory AddPostEvent.editedImage(Uint8List imageData) = OnEditedImageEvent;
  const factory AddPostEvent.onPublishAsStoryMoment(bool isStoryMoment) = OnPublishAsStoryMomentEvent;
}

