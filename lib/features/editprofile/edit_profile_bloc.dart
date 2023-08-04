import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/usecase/get_user_details_use_case.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

part 'edit_profile_bloc.freezed.dart';

class EditProfileBloc extends Bloc<EditProfilesEvent, EditProfileState> {
  final GetUserDetailsUseCase getUserDetailsUseCase;

  EditProfileBloc({required this.getUserDetailsUseCase})
      : super(const EditProfileState()) {
    on<OnEditProfileEvent>(onEditProfileEventHandler);
  }

  FutureOr<void> onEditProfileEventHandler(
      OnEditProfileEvent event, Emitter<EditProfileState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final response = await getUserDetailsUseCase(GetUserDetailsParams(event.uid));
    response.fold(
            (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
            (userDetail) => emit(state.copyWith(
                isLoading: false,
                errorMessage: null
            ))
    );

  }
}
