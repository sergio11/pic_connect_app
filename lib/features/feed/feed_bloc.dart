import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';
import 'package:pic_connect/domain/usecase/fetch_moments_from_followed_users_last_24_hours_use_case.dart';
import 'package:pic_connect/domain/usecase/fetch_user_home_feed_use_case.dart';

part 'feed_event.dart';
part 'feed_state.dart';
part 'feed_bloc.freezed.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {

  final FetchUserHomeFeedUseCase fetchUserHomeFeedUseCase;
  final FetchMomentsFromFollowedUsersLast24HoursUseCase fetchMomentsFromFollowedUsersTodayUseCase;

  FeedBloc({
    required this.fetchUserHomeFeedUseCase,
    required this.fetchMomentsFromFollowedUsersTodayUseCase
  }): super(const FeedState()) {
    on<OnLoadHomePostsEvent>(onLoadHomePostsEventHandler);
  }

  FutureOr<void> onLoadHomePostsEventHandler(OnLoadHomePostsEvent event, Emitter<FeedState> emit) async {
    emit(state.copyWith(isLoading: true, authUserUid: event.userUid));
    final postsResponse = await fetchUserHomeFeedUseCase(const DefaultParams());
    postsResponse.fold(
            (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
            (posts) => emit(state.copyWith(isLoading: false, posts: posts))
    );
    final momentsResponse = await fetchMomentsFromFollowedUsersTodayUseCase(const DefaultParams());
    momentsResponse.fold(
            (failure) => emit(state.copyWith(errorMessage: failure.message)),
            (moments) => emit(state.copyWith(isLoading: false, momentsByFollowedUsers: moments))
    );
  }

}