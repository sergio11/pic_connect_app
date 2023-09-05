part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    @Default(false) final bool isLoading,
    final Uint8List? image,
    @Default(true) final bool allowUserInput,
    @Default("") final String userUid,
    @Default("") final String username,
    @Default("") final String email,
    @Default("") final String bio,
    @Default("") final String photoUrl,
    @Default("") final String country,
    @Default("") final String birthDate,
    final String? errorMessage
  }) = _EditProfileState;
}