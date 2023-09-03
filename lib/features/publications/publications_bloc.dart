import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/usecase/find_bookmark_posts_by_user_use_case.dart';
import 'package:pic_connect/domain/usecase/find_posts_by_user_use_case.dart';
import 'package:pic_connect/domain/usecase/find_favorites_posts_by_user_use_case.dart';

part 'publications_event.dart';

part 'publications_state.dart';

part 'publications_bloc.freezed.dart';

class PublicationsBloc extends Bloc<PublicationsEvent, PublicationsState> {
  final FindPostsByUserUseCase findPostsByUserUseCase;
  final FindFavoritesPostsByUserUseCase findFavoritesPostsByUserUseCase;
  final FindBookmarkPostsByUserUseCase findBookmarkPostsByUserUseCase;

  PublicationsBloc(
      {required this.findPostsByUserUseCase,
      required this.findFavoritesPostsByUserUseCase,
      required this.findBookmarkPostsByUserUseCase})
      : super(const PublicationsState()) {
    on<OnLoadPublicationsEvent>(onLoadPublicationsEventHandler);
  }

  FutureOr<void> onLoadPublicationsEventHandler(
      OnLoadPublicationsEvent event, Emitter<PublicationsState> emit) async {
    emit(state.copyWith(isLoading: true));

    final Either<Failure, List<PostBO>> response;
    switch (event.type) {
      case PostTypeEnum.pictures:
        response = await findPostsByUserUseCase(
            FindPostsByUserParams(event.userUid, FindPostTypeEnum.pictures));
      case PostTypeEnum.reels:
        response = await findPostsByUserUseCase(
            FindPostsByUserParams(event.userUid, FindPostTypeEnum.reels));
      case PostTypeEnum.all:
        response = await findPostsByUserUseCase(
            FindPostsByUserParams(event.userUid, FindPostTypeEnum.all));
      case PostTypeEnum.favorites:
        response = await findFavoritesPostsByUserUseCase(
            FindFavoritesPostsByUserParams(event.userUid));
      case PostTypeEnum.bookmarks:
        response = await findBookmarkPostsByUserUseCase(FindBookmarkPostsByUserParams(event.userUid));
    }

    response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (postsByUser) => emit(state.copyWith(
            isLoading: false,
            authorUserUid: event.userUid,
            postList: postsByUser,
            postLen: postsByUser.length)));
  }
}
