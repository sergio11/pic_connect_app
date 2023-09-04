part of 'reels_bloc.dart';

@freezed
class ReelsState with _$ReelsState {
  const factory ReelsState({
    @Default(false) final bool isLoading,
    @Default([]) final List<PostBO> topReels,
    final String? errorMessage
  }) = _ReelsState;
}