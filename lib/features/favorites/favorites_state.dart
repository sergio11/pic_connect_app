part of 'favorites_bloc.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _FavoritesState;
}