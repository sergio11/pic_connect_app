part of 'create_room_bloc.dart';

@freezed
class CreateRoomState with _$CreateRoomState {
  const factory CreateRoomState({
    @Default(false) final bool isLoading,
    @Default("") final String authUserUuid,
    @Default("") final String roomCreatedId,
    @Default([]) final List<UserBO> users,
    final String? errorMessage
  }) = _CreateRoomState;
}