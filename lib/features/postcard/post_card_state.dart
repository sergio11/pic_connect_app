part of 'post_card_bloc.dart';

@freezed
class PostCardState with _$PostCardState {
  const factory PostCardState({
    final String? authUserUid,
    final PostBO? postBO
  }) = _PostCardState;
}