part of 'edit_profile_bloc.dart';

@freezed
class EditProfilesEvent with _$EditProfilesEvent {
  const factory EditProfilesEvent.editProfile(String uid) = OnEditProfileEvent;
}