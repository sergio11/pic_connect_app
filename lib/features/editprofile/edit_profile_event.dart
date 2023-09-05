part of 'edit_profile_bloc.dart';

@freezed
class EditProfilesEvent with _$EditProfilesEvent {
  const factory EditProfilesEvent.onEditProfile(String uid) =
      OnEditProfileEvent;
  const factory EditProfilesEvent.onUpdateProfile(
      {required String email,
      required String username,
      required String bio,
      required String birthDate,
      required String country}) = OnUpdateProfileEvent;
  const factory EditProfilesEvent.onUpdateProfileImageEvent(ImageSource imageSource) = OnUpdateProfileImageEvent;
}
