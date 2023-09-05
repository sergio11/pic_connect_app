
class SaveUserDTO {

  final String uid;
  final String username;
  final String email;
  final String? photoUrl;
  final String? bio;
  final String? country;
  final String? birthDate;

  SaveUserDTO({
    required this.uid,
    required this.username,
    required this.email,
    this.photoUrl,
    this.bio,
    this.country,
    this.birthDate
  });

}