part of 'create_room_bloc.dart';

@freezed
class CreateRoomEvent with _$CreateRoomEvent {
  const factory CreateRoomEvent.onLoadUsers(
      String authUserUuid) = OnLoadUsersEvent;
  const factory CreateRoomEvent.onCreateRoom(
      String userUuid) = OnCreateRoomEvent;
}