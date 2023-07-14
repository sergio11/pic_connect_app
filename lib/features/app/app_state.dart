part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(false) final bool isLoggedIn
  }) = _AppState;
}