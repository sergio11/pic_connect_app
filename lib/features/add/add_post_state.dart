part of 'add_post_bloc.dart';

@freezed
class AddPostState with _$AddPostState {
  const AddPostState._();
  const factory AddPostState({
    @Default(null) final ImageSource? imageSource,
    final String? authorPhotoUrl,
    final Uint8List? imageData,
    final String? videoFilePath,
    final String? placeInfo,
    @Default(false) final bool imageEditingRequired,
    @Default(false) final bool isPostUploading,
    @Default(false) final bool isLoading,
    @Default(false) final bool isPostUploadedSuccessfully,
    final String? errorMessage,
  }) = _AddPostState;

  bool shouldTakeContentFromCamera() {
    return imageData == null && videoFilePath == null && imageSource == ImageSource.camera;
  }

  bool shouldPickContentFromGallery() {
    return imageData == null && videoFilePath == null && imageSource == ImageSource.gallery;
  }

  bool isImageEditingRequired() {
    return imageData != null && imageEditingRequired;
  }

  bool shouldFillPostData() {
    return imageData != null && !imageEditingRequired || videoFilePath != null;
  }
}