import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/usecase/find_post_by_id_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/usecase/update_post_use_case.dart';
part 'edit_post_event.dart';
part 'edit_post_state.dart';
part 'edit_post_bloc.freezed.dart';

class EditPostBloc extends Bloc<EditPostEvent, EditPostState> {
  final FindPostByIdUseCase findPostByIdUseCase;
  final UpdatePostUseCase updatePostUseCase;

  EditPostBloc(
      {required this.findPostByIdUseCase, required this.updatePostUseCase})
      : super(const EditPostState()) {
    on<OnEditPostEvent>(onEditPostEventHandler);
    on<OnUpdatePostEvent>(onUpdatePostEventHandler);
  }

  FutureOr<void> onUpdatePostEventHandler(
      OnUpdatePostEvent event, Emitter<EditPostState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final response = await updatePostUseCase(UpdatePostUseParams(
        postUuid: state.postUuid,
        description: event.description,
        tags: event.tags,
        placeInfo: event.placeInfo));
    response.fold(
        (error) =>
            emit(state.copyWith(isLoading: false, errorMessage: error.message)),
        (post) => emit(state.copyWith(
            isLoading: false,
            errorMessage: null,
            description: event.description,
            tags: event.tags,
            placeInfo: event.placeInfo)));
  }

  FutureOr<void> onEditPostEventHandler(
      OnEditPostEvent event, Emitter<EditPostState> emit) async {
    emit(state.copyWith(
        isLoading: true, errorMessage: null, postUuid: event.postUuid));
    final response =
        await findPostByIdUseCase(FindPostByIdParams(event.postUuid));
    response.fold(
        (error) =>
            emit(state.copyWith(isLoading: false, errorMessage: error.message)),
        (post) => emit(state.copyWith(
            isLoading: false,
            errorMessage: null,
            postUrl: post.postUrl,
            description: post.description,
            tags: post.tags,
            placeInfo: post.placeInfo ?? '',
            isReel: post.postType == PostTypeEnum.reel)));
  }
}
