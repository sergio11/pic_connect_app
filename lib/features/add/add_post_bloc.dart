import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';
part 'add_post_bloc.freezed.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {

  AddPostBloc(): super(const AddPostState()) {
    on<OnAddNewPostFromEvent>(onAddNewPostFromEventHandler);
    on<OnFileSelectedEvent>(onOnFileSelectedEventHandler);
  }

  FutureOr<void> onAddNewPostFromEventHandler(OnAddNewPostFromEvent event, Emitter<AddPostState> emit) async {
      emit(state.copyWith(imageSource: event.imageSource));
  }

  FutureOr<void> onOnFileSelectedEventHandler(OnFileSelectedEvent event, Emitter<AddPostState> emit) async {
    emit(state.copyWith(postFilePath: event.filePath));
  }

}