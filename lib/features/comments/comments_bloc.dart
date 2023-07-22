import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/comment.dart';
import 'package:pic_connect/domain/usecase/find_all_comments_by_post_use_case.dart';
import 'package:pic_connect/domain/usecase/get_user_details_use_case.dart';
import 'package:pic_connect/domain/usecase/publish_comment_use_case.dart';

part 'comments_event.dart';
part 'comments_state.dart';
part 'comments_bloc.freezed.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {

  final GetUserDetailsUseCase getUserDetailsUseCase;
  final FindAllCommentsByPostUseCase findAllCommentsByPostUseCase;
  final PublishCommentUseCase publishCommentUseCase;

  CommentsBloc({
    required this.findAllCommentsByPostUseCase,
    required this.publishCommentUseCase,
    required this.getUserDetailsUseCase
  }): super(const CommentsState()) {
    on<OnLoadCommentsByPostEvent>(onLoadCommentsByPostEventHandler);
    on<OnPublishCommentEvent>(onPublishCommentEventHandler);
  }

  FutureOr<void> onLoadCommentsByPostEventHandler(OnLoadCommentsByPostEvent event, Emitter<CommentsState> emit) async {
      emit(state.copyWith(isLoading: true, postId: event.postId));
      final getUserDetailsResponse = await getUserDetailsUseCase(GetUserDetailsParams(event.authUserUid));
      getUserDetailsResponse.fold(
              (failure) => {},
              (authUserDetail) => emit(state.copyWith(authUserImageUrl: authUserDetail.photoUrl))
      );
      final commentsResponse = await findAllCommentsByPostUseCase(FindAllCommentsByPostParams(event.postId));
      commentsResponse.fold(
              (failure) => emit(state.copyWith(isLoading: false)),
              (commentsByPost) => emit(state.copyWith(isLoading: false, commentsByPost: commentsByPost))
      );
  }

  FutureOr<void> onPublishCommentEventHandler(OnPublishCommentEvent event, Emitter<CommentsState> emit) async {
    emit(state.copyWith(isPublishingComment: true));
    final response = await publishCommentUseCase(PublishCommentParams(event.postId, event.text));
      response.fold(
              (failure) => emit(state.copyWith(isPublishingComment: false)),
              (commentSaved) => emit(state.copyWith(isPublishingComment: false, commentsByPost: state.commentsByPost.toList()..insert(0, commentSaved)))
      );
  }
}