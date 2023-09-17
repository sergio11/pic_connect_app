part of 'messages_bloc.dart';

@freezed
class MessagesState with _$MessagesState {
  const factory MessagesState({
    @Default(false) final bool isLoading,
    final String? errorMessage
  }) = _MessagesState;
}