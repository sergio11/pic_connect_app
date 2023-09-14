part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) final bool isLoading,
    @Default(false) final bool isShowUsers,
    @Default(true) final bool allowUserInput,
    @Default("") final String authUserUuid,
    @Default([]) final List<UserBO> users,
    @Default([]) final List<PostBO> posts,
    final String? errorMessage
  }) = _SearchState;
}