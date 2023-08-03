part of 'followers_bloc.dart';

@freezed
class FollowersState with _$FollowersState {
  const factory FollowersState({
    @Default(false) final bool isLoading,
    @Default([]) final List<UserBO> users,
    @Default(DisplayContentTypeEnum.followers) final DisplayContentTypeEnum contentTypeEnum,
    final String? errorMessage
  }) = _FollowersState;
}

enum DisplayContentTypeEnum {
  followers, following
}