import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/usecase/get_top_reels_with_most_likes_use_case.dart';

part 'reels_event.dart';
part 'reels_state.dart';
part 'reels_bloc.freezed.dart';

class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  static const int TOP_REELS_LIMIT = 10;
  final GetTopReelsWithMostLikesUseCase getTopReelsWithMostLikesUseCase;

  ReelsBloc({required this.getTopReelsWithMostLikesUseCase})
      : super(const ReelsState()) {
    on<OnLoadTopReels>(onLoadTopReelsCalled);
  }

  FutureOr<void> onLoadTopReelsCalled(
      OnLoadTopReels event, Emitter<ReelsState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await getTopReelsWithMostLikesUseCase(
        const GetTopReelsWithMostLikesParams(TOP_REELS_LIMIT));
    response.fold(
        (error) =>
            emit(state.copyWith(isLoading: false, errorMessage: error.message)),
        (topReels) => emit(state.copyWith(
            isLoading: false, topReels: topReels, errorMessage: null)));
  }
}
