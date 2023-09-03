import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/usecase/delete_post_use_case.dart';
import 'package:pic_connect/domain/usecase/like_post_use_case.dart';
import 'package:pic_connect/domain/usecase/save_bookmark_use_case.dart';
import 'package:pic_connect/utils/date_formatter.dart';

part 'post_card_event.dart';

part 'post_card_state.dart';

part 'post_card_bloc.freezed.dart';

class PostCardBloc extends Bloc<PostCardEvent, PostCardState> {
  final DeletePostUseCase deletePostUseCase;
  final LikePostUseCase likePostUseCase;
  final SaveBookmarkUseCase saveBookmarkUseCase;

  PostCardBloc(
      {required this.deletePostUseCase,
      required this.likePostUseCase,
      required this.saveBookmarkUseCase})
      : super(const PostCardState()) {
    on<OnShowPostEvent>(onShowPostEventHandler);
    on<OnDeletePostEvent>(onDeletePostEventHandler);
    on<OnLikePostEvent>(onLikePostEventHandler);
    on<OnSaveBookmarkEvent>(onSaveBookmarkEventHandler);
  }

  FutureOr<void> onShowPostEventHandler(
      OnShowPostEvent event, Emitter<PostCardState> emit) async {
    emit(state.copyWith(
        isLikedByAuthUser: event.post.likes.contains(event.authUserUid),
        isBookmarkedByAuthUser:
            event.post.bookmarks.contains(event.authUserUid),
        isPostOwner: event.post.postAuthorUid == event.authUserUid,
        likes: event.post.likes.length,
        commentCount: event.post.commentCount,
        postId: event.post.postId,
        username: event.post.username,
        tags: event.post.tags,
        isReel: event.post.isReel,
        description: event.post.description,
        placeInfo: event.post.placeInfo ?? "",
        datePublished: DateFormatter.getTimeAgo(event.post.datePublished),
        postImageUrl: event.post.postUrl,
        authorImageUrl: event.post.profImage));
  }

  FutureOr<void> onDeletePostEventHandler(
      OnDeletePostEvent event, Emitter<PostCardState> emit) async {
    final response = await deletePostUseCase(DeletePostParams(event.postId));
    response.fold(
        (l) => null, (isSuccess) => emit(state.copyWith(isPostDeleted: true)));
  }

  FutureOr<void> onLikePostEventHandler(
      OnLikePostEvent event, Emitter<PostCardState> emit) async {
    final response = await likePostUseCase(LikePostParams(event.postId));
    response.fold(
        (failure) => null,
        (isSuccess) => emit(state.copyWith(
            isLikedByAuthUser: isSuccess,
            likes: isSuccess ? state.likes + 1 : state.likes - 1)));
  }

  FutureOr<void> onSaveBookmarkEventHandler(
      OnSaveBookmarkEvent event, Emitter<PostCardState> emit) async {
    final response =
        await saveBookmarkUseCase(SaveBookmarkParams(event.postId));
    response.fold((failure) => null,
        (isSuccess) => emit(state.copyWith(isBookmarkedByAuthUser: isSuccess)));
  }
}
