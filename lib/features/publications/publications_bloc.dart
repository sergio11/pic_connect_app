import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/usecase/find_posts_by_user_use_case.dart';

part 'publications_event.dart';

part 'publications_state.dart';

part 'publications_bloc.freezed.dart';

class PublicationsBloc extends Bloc<PublicationsEvent, PublicationsState> {
  final FindPostsByUserUseCase findPostsByUserUseCase;

  PublicationsBloc({required this.findPostsByUserUseCase})
      : super(const PublicationsState()) {
    on<OnLoadPublicationsEvent>(onLoadPublicationsEventHandler);
  }

  FutureOr<void> onLoadPublicationsEventHandler(
      OnLoadPublicationsEvent event, Emitter<PublicationsState> emit) async {
    final response =
        await findPostsByUserUseCase(FindPostsByUserParams(event.userUid));
    response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (postsByUser) => emit(state.copyWith(
            isLoading: false,
            authorUserUid: event.userUid,
            postList: postsByUser,
            postLen: postsByUser.length)));
  }
}
