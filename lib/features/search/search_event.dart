part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchUsers(String term) = OnSearchUsersEvent;
  const factory SearchEvent.loadPosts() = OnLoadLastPostsPublishedEvent;
}