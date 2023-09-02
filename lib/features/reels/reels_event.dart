part of 'reels_bloc.dart';

@freezed
class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.load() = OnLoadFavorites;
}