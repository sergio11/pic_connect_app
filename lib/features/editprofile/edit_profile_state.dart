part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    @Default(false) final bool isLoading,
    final Uint8List? image,
    @Default(true) final bool allowUserInput,
    final String? errorMessage
  }) = _EditProfileState;
}