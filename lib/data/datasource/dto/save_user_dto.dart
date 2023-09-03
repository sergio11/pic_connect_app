
class SaveUserDTO {

  final String uid;
  final String username;
  final String email;
  final String photoUrl;
  final String? bio;

  SaveUserDTO({
    required this.uid,
    required this.username,
    required this.email,
    required this.photoUrl,
    this.bio
  });

}