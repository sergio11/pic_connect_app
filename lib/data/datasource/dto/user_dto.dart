

class UserDTO {

  final String uid;
  final String username;
  final String email;
  final String photoUrl;
  final String? bio;
  final String? country;
  final String? birthDate;
  final int? lastSeen;
  final List followers;
  final List following;

  UserDTO({
    required this.uid,
    required this.email,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.country,
    required this.birthDate,
    required this.lastSeen,
    required this.followers,
    required this.following
  });

  UserDTO copyWith({
    String? uid,
    String? username,
    String? email,
    String? photoUrl,
    String? bio,
    String? country,
    String? birthDate,
    int? lastSeen,
    List? followers,
    List? following,
  }) {
    return UserDTO(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
      country: country ?? this.country,
      birthDate: birthDate ?? this.birthDate,
      lastSeen: lastSeen ?? this.lastSeen,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }
}