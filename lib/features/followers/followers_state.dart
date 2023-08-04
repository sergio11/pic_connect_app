part of 'followers_bloc.dart';

@freezed
class FollowersState with _$FollowersState {
  const factory FollowersState({
    @Default(false) final bool isLoading,
    @Default(true) final bool allowUserInput,
    @Default([]) final List<UserBO> users,
    @Default("") final String authUserUid,
    @Default("") final String userUid,
    @Default(ContentTypeEnum.followers) ContentTypeEnum contentType,
    final String? errorMessage
  }) = _FollowersState;
}

enum ContentTypeEnum {
  followers, following
}