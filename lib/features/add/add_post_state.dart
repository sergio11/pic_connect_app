part of 'add_post_bloc.dart';

@freezed
class AddPostState with _$AddPostState {
  const factory AddPostState({
    @Default(null) final ImageSource? imageSource,
    final String? authorPhotoUrl,
    final Uint8List? postFileData,
    @Default(false) final bool imageEditingRequired,
    @Default(false) final bool isPostUploading,
    @Default(false) final bool isLoading,
    @Default(false) final bool isPostUploadedSuccessfully,
    final String? errorMessage
  }) = _AddPostState;
}