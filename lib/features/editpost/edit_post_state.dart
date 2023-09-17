part of 'edit_post_bloc.dart';

@freezed
class EditPostState with _$EditPostState {
  const factory EditPostState({
    @Default(false) final bool isLoading,
    @Default("") final String placeInfo,
    @Default(false) final bool isStoryMoment,
    final String? errorMessage
  }) = _EditPostState;
}