part of 'rooms_bloc.dart';

@freezed
class RoomsEvent with _$RoomsEvent {
  const factory RoomsEvent.onLoadUserRooms(
      String authUserUuid) = OnLoadUserRoomsEvent;
  const factory RoomsEvent.onDeleteRoom(
      String roomUuid) = OnDeleteRoomEvent;
}