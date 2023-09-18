part of 'edit_post_bloc.dart';

@freezed
class EditPostState with _$EditPostState {
  const factory EditPostState({
    @Default(false) final bool isLoading,
    @Default("") final String placeInfo,
    @Default("") final String postUrl,
    @Default(false) final bool isReel,
    @Default(false) final bool isStoryMoment,
    @Default(false) final bool isPostUploading,
    final String? errorMessage
  }) = _EditPostState;
}