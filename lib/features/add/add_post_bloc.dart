import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/domain/usecase/get_user_details_use_case.dart';
import 'package:pic_connect/domain/usecase/publish_post_use_case.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';
part 'add_post_bloc.freezed.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {

  final GetUserDetailsUseCase getUserDetailsUseCase;
  final PublishPostUseCase publishPostUseCase;

  AddPostBloc({
    required this.getUserDetailsUseCase,
    required this.publishPostUseCase
  }): super(const AddPostState()) {
    on<OnAddNewPostEvent>(onAddNewPostFromEventHandler);
    on<OnFileSelectedEvent>(onOnFileSelectedEventHandler);
    on<OnUploadPostEvent>(onUploadPostEventHandler);
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

  FutureOr<void> onUploadPostEventHandler(OnUploadPostEvent event, Emitter<AddPostState> emit) async {
    if(state.postFilePath != null) {
      emit(state.copyWith(isPostUploading: true));
      final fileData = await File(state.postFilePath!).readAsBytes();
      final response = await publishPostUseCase(PublishPostUseParams(event.description, fileData));
      response.fold(
              (failure) => emit(state.copyWith(isPostUploading: false)),
              (userDetail) => emit(state.copyWith(
                  isPostUploading: false,
                  isPostUploadedSuccessfully: true))
      );
    }
  }

}