part of 'add_post_bloc.dart';

@freezed
class AddPostState with _$AddPostState {
  const factory AddPostState({
    @Default(ImageSource.gallery) final ImageSource imageSource,
    final String? authorPhotoUrl,
    final String? postFilePath,
    @Default(false) final bool isPostUploading,
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _AddPostState;
}