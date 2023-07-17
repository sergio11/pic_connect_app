import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/post.dart';

part 'post_card_event.dart';
part 'post_card_state.dart';
part 'post_card_bloc.freezed.dart';

class PostCardBloc extends Bloc<PostCardEvent, PostCardState> {

  PostCardBloc(): super(const PostCardState()) {
    on<OnShowPostEvent>(onShowPostEventHandler);
  }

  FutureOr<void> onShowPostEventHandler(OnShowPostEvent event, Emitter<PostCardState> emit) async {
    emit(state.copyWith(postBO: event.post));
  }

}