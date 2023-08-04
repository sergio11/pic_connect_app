part of 'followers_bloc.dart';

@freezed
class FollowersEvent with _$FollowersEvent {
  const factory FollowersEvent.loadFollowers(String userUid, String authUserUid) = OnLoadFollowersEvent;
  const factory FollowersEvent.loadFollowing(String userUid, String authUserUid) = OnLoadFollowingEvent;
  const factory FollowersEvent.followUser(String userUid) = OnFollowUserEvent;
  const factory FollowersEvent.unFollowUser(String userUid) = OnUnFollowUserEvent;
  const factory FollowersEvent.refreshData() = OnRefreshDataEvent;
}