import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/domain/usecase/get_user_details_use_case.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';
part 'add_post_bloc.freezed.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {

  final GetUserDetailsUseCase getUserDetailsUseCase;

  AddPostBloc({
    required this.getUserDetailsUseCase
  }): super(const AddPostState()) {
    on<OnAddNewPostEvent>(onAddNewPostFromEventHandler);
    on<OnFileSelectedEvent>(onOnFileSelectedEventHandler);
  }

  FutureOr<void> onAddNewPostFromEventHandler(OnAddNewPostEvent event, Emitter<AddPostState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await getUserDetailsUseCase(GetUserDetailsParams(event.userUid));
    response.fold(
            (failure) => emit(state.copyWith(isLoading: false)),
            (userDetail) => emit(state.copyWith(
                isLoading: false,
                authorPhotoUrl: userDetail.photoUrl,
                imageSource: event.imageSource
            ))
    );
  }

  FutureOr<void> onOnFileSelectedEventHandler(OnFileSelectedEvent event, Emitter<AddPostState> emit) async {
    emit(state.copyWith(postFilePath: event.filePath));
  }

}