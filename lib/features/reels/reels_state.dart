part of 'reels_bloc.dart';

@freezed
class ReelsState with _$ReelsState {
  const factory ReelsState({
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _ReelsState;
}