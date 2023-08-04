part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadProfile(String uid) = OnLoadProfileEvent;
  const factory ProfileEvent.signOut() = OnSignOutEvent;
  const factory ProfileEvent.followUser(String uid) = OnFollowUserEvent;
  const factory ProfileEvent.unFollowUser(String uid) = OnUnFollowUserEvent;
  const factory ProfileEvent.refreshData() = OnRefreshEvent;
}