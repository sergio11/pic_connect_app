part of 'rooms_bloc.dart';

@freezed
class RoomsState with _$RoomsState {
  const factory RoomsState({
    @Default(false) final bool isLoading,
    @Default("") final String authUserUuid,
    @Default([]) final List<RoomBO> rooms,
    final String? errorMessage
  }) = _RoomsState;
}