part of 'add_post_bloc.dart';

@freezed
class AddPostState with _$AddPostState {
  const factory AddPostState({
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _AddPostState;
}