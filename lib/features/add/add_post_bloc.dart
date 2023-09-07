import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/usecase/get_user_details_use_case.dart';
import 'package:pic_connect/domain/usecase/publish_post_use_case.dart';
import 'package:pic_connect/utils/geolocator.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';
part 'add_post_bloc.freezed.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  final GetUserDetailsUseCase getUserDetailsUseCase;
  final PublishPostUseCase publishPostUseCase;

  AddPostBloc(
      {required this.getUserDetailsUseCase, required this.publishPostUseCase})
      : super(const AddPostState()) {
    on<OnAddNewPostEvent>(onAddNewPostFromEventHandler);
    on<OnPhotoSelectedEvent>(onPhotoSelectedEventHandler);
    on<OnVideoSelectedEvent>(onVideoSelectedEventHandler);
    on<OnUploadPostEvent>(onUploadPostEventHandler);
    on<OnEditedImageEvent>(onEditedImageEventHandler);
  }

  FutureOr<void> onAddNewPostFromEventHandler(
      OnAddNewPostEvent event, Emitter<AddPostState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response =
        await getUserDetailsUseCase(GetUserDetailsParams(event.userUid));
    response.fold(
        (failure) => emit(state.copyWith(isLoading: false)),
        (userDetail) => emit(state.copyWith(
            isLoading: false,
            authorPhotoUrl: userDetail.photoUrl,
            imageSource: event.imageSource)));
  }

  FutureOr<void> onPhotoSelectedEventHandler(
      OnPhotoSelectedEvent event, Emitter<AddPostState> emit) async {
    final imageData = await File(event.imageFilePath).readAsBytes();
    final placeInfo = await _fetchPlaceInfo();
    emit(state.copyWith(
        imageData: imageData,
        imageEditingRequired: true,
        videoFilePath: null,
        placeInfo: placeInfo));
  }

  FutureOr<void> onVideoSelectedEventHandler(
      OnVideoSelectedEvent event, Emitter<AddPostState> emit) async {
    final placeInfo = await _fetchPlaceInfo();
    emit(state.copyWith(
        videoFilePath: event.videoFilePath,
        imageEditingRequired: false,
        imageData: null,
        placeInfo: placeInfo));
  }

  FutureOr<void> onUploadPostEventHandler(
      OnUploadPostEvent event, Emitter<AddPostState> emit) async {
    if (state.imageData != null || state.videoFilePath != null) {
      if (event.description.isNotEmpty) {
        emit(state.copyWith(isPostUploading: true));
        final fileData =
            state.imageData ?? await File(state.videoFilePath!).readAsBytes();
        final postType = state.videoFilePath != null ? PostType.reel : PostType.picture;
        final response = await publishPostUseCase(PublishPostUseParams(
            event.description, fileData, postType, event.tags, event.placeInfo));
        response.fold(
            (failure) => emit(state.copyWith(isPostUploading: false)),
            (userDetail) => emit(state.copyWith(
                isPostUploading: false, isPostUploadedSuccessfully: true)));
      } else {
        emit(state.copyWith(
            errorMessage: "You must provide a description about your post!"));
      }
    } else {
      emit(state.copyWith(
          errorMessage:
              "An error occurred when trying to upload post, please try again!"));
    }
  }

  FutureOr<void> onEditedImageEventHandler(
      OnEditedImageEvent event, Emitter<AddPostState> emit) async {
    emit(state.copyWith(
        imageData: event.imageData, imageEditingRequired: false));
  }

  Future<String?> _fetchPlaceInfo() async {
    final result = await GeoLocatorFacade.determinePlaceMark();
    return result != null
        ? "${result.locality}, ${result.administrativeArea}, ${result.country}"
        : null;
  }
}
