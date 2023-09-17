import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/domain/usecase/find_post_by_id_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_post_event.dart';
part 'edit_post_state.dart';
part 'edit_post_bloc.freezed.dart';

class EditPostBloc extends Bloc<EditPostEvent, EditPostState> {
  final FindPostByIdUseCase findPostByIdUseCase;

  EditPostBloc({required this.findPostByIdUseCase})
      : super(const EditPostState()) {
    on<OnEditPostEvent>(onEditPostEventHandler);
  }

  FutureOr<void> onEditPostEventHandler(
      OnEditPostEvent event, Emitter<EditPostState> emit) async {

  }
}
