part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _SearchState;
}