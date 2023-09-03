

class UserDTO {

  final String uid;
  final String username;
  final String email;
  final String photoUrl;
  final String? bio;
  final List followers;
  final List following;

  UserDTO({
    required this.uid,
    required this.email,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following
  });
}