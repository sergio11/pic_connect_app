import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/usecase/delete_post_use_case.dart';
import 'package:pic_connect/domain/usecase/like_post_use_case.dart';
part 'post_card_event.dart';
part 'post_card_state.dart';
part 'post_card_bloc.freezed.dart';

class PostCardBloc extends Bloc<PostCardEvent, PostCardState> {

  final DeletePostUseCase deletePostUseCase;
  final LikePostUseCase likePostUseCase;

  PostCardBloc({
    required this.deletePostUseCase,
    required this.likePostUseCase
  }): super(const PostCardState()) {
    on<OnShowPostEvent>(onShowPostEventHandler);
    on<OnDeletePostEvent>(onDeletePostEventHandler);
    on<OnLikePostEvent>(onLikePostEventHandler);
  }

  FutureOr<void> onShowPostEventHandler(OnShowPostEvent event, Emitter<PostCardState> emit) async {
    emit(state.copyWith(
        isLikedByAuthUser: event.post.likes.contains(event.authUserUid),
        isPostOwner : event.post.postAuthorUid == event.authUserUid,
        likes: event.post.likes.length,
        commentCount: event.post.commentCount,
        postId: event.post.postId,
        username: event.post.username,
        description: event.post.description,
        datePublished: DateFormat.yMMMd().format(event.post.datePublished),
        postImageUrl: event.post.postUrl,
        authorImageUrl: event.post.profImage
    ));
  }

  FutureOr<void> onDeletePostEventHandler(OnDeletePostEvent event, Emitter<PostCardState> emit) async {
    final response = await deletePostUseCase(DeletePostParams(event.postId));
    response.fold(
            (l) => emit(state.copyWith()),
            (isSuccess) => emit(state.copyWith(isPostDeleted: true))
    );
  }

  FutureOr<void> onLikePostEventHandler(OnLikePostEvent event, Emitter<PostCardState> emit) async {
    final response = await likePostUseCase(LikePostParams(event.postId));
    response.fold(
            (failure) => emit(state.copyWith()),
            (isSuccess) => emit(state.copyWith(
                isLikedByAuthUser: isSuccess,
                likes: isSuccess ? state.likes + 1 : state.likes - 1
            ))
    );
  }
}