part of 'create_room_bloc.dart';

@freezed
class CreateRoomState with _$CreateRoomState {
  const factory CreateRoomState({
    @Default(false) final bool isLoading,
    @Default("") final String authUserUuid,
    @Default(null) final RoomBO? roomCreated,
    @Default([]) final List<UserBO> users,
    final String? errorMessage
  }) = _CreateRoomState;
}