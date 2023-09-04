import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pic_connect/domain/models/post.dart';

part 'reels_event.dart';
part 'reels_state.dart';
part 'reels_bloc.freezed.dart';

class ReelsBloc extends Bloc<FavoritesEvent, ReelsState> {

  ReelsBloc(): super(const ReelsState());

}