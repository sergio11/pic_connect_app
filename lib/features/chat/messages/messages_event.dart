part of 'messages_bloc.dart';

@freezed
class MessagesEvent with _$MessagesEvent {
  const factory MessagesEvent.onLoadMessagesOfRoom(String roomUuid) =
      OnLoadMessagesOfRoomEvent;
}
