import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';
import 'package:pic_connect/domain/usecase/is_logged_in_use_case.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final IsLoggedInUseCase isLoggedInUseCase;

  AppBloc({required this.isLoggedInUseCase}) : super(const AppState()) {
    on<OnVerifySession>(onVerifySessionHandler);
  }

  FutureOr<void> onVerifySessionHandler(
      OnVerifySession event, Emitter<AppState> emit) async {
    final response = await isLoggedInUseCase(const DefaultParams());
    response.fold(
            (fail) => emit(state.copyWith(isLoggedIn: false)),
            (success) => emit(state.copyWith(isLoggedIn: true))
    );
  }
}
