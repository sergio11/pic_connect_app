import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';
import 'package:pic_connect/domain/usecase/find_posts_order_by_date_published_use_case.dart';
import 'package:pic_connect/domain/usecase/find_users_by_name_use_case.dart';

part 'search_event.dart';

part 'search_state.dart';

part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final FindUsersByNameUseCase findUsersByNameUseCase;
  final FindPostsOrderByDatePublishedUseCase
      findPostsOrderByDatePublishedUseCase;

  SearchBloc({
    required this.findUsersByNameUseCase,
    required this.findPostsOrderByDatePublishedUseCase
  }) : super(const SearchState()) {
    on<OnLoadLastPostsPublishedEvent>(onLoadLastPostsPublishedEventHandler);
    on<OnSearchUsersEvent>(onSearchUsersEventHandler);
  }

  FutureOr<void> onLoadLastPostsPublishedEventHandler(OnLoadLastPostsPublishedEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await findPostsOrderByDatePublishedUseCase(const DefaultParams());
    response.fold(
            (fail) => emit(state.copyWith(isLoading: false)),
            (posts) => emit(state.copyWith(isLoading: false, posts: posts, isShowUsers: false))
    );
  }

  FutureOr<void> onSearchUsersEventHandler(OnSearchUsersEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await findUsersByNameUseCase(FindUsersByNameParams(event.term));
    response.fold(
            (fail) => emit(state.copyWith(isLoading: false, isShowUsers: false)),
            (users) => emit(state.copyWith(isLoading: false, users: users, isShowUsers: true))
    );
  }
}
