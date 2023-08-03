part of 'followers_bloc.dart';

@freezed
class FollowersEvent with _$FollowersEvent {
  const factory FollowersEvent.loadFollowers(String userUid, String authUserUid) = OnLoadFollowersEvent;
  const factory FollowersEvent.loadFollowing(String userUid, String authUserUid) = OnLoadFollowingEvent;
}