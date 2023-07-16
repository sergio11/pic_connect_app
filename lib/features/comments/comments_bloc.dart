import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/comment.dart';
import 'package:pic_connect/domain/usecase/find_all_comments_by_post_use_case.dart';

part 'comments_event.dart';
part 'comments_state.dart';
part 'comments_bloc.freezed.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {

  final FindAllCommentsByPostUseCase findAllCommentsByPostUseCase;

  CommentsBloc({
    required this.findAllCommentsByPostUseCase
  }): super(const CommentsState()) {
    on<OnLoadCommentsByPostEvent>(onLoadCommentsByPostEventHandler);
  }

  FutureOr<void> onLoadCommentsByPostEventHandler(OnLoadCommentsByPostEvent event, Emitter<CommentsState> emit) async {
      emit(state.copyWith(isLoading: true));
      final response = await findAllCommentsByPostUseCase(FindAllCommentsByPostParams(event.postId));
      response.fold(
              (failure) => emit(state.copyWith(isLoading: false)),
              (commentsByPost) => emit(state.copyWith(isLoading: false, commentsByPost: commentsByPost))
      );
  }

}