class UserBO {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String? bio;
  final String? country;
  final String? birthDate;
  final List followers;
  final List following;

  const UserBO(
      {required this.username,
      required this.uid,
      required this.photoUrl,
      required this.email,
      required this.bio,
      required this.country,
      required this.birthDate,
      required this.followers,
      required this.following});

  UserBO copyWith(
      {String? email,
      String? uid,
      String? photoUrl,
      String? username,
      String? bio,
      String? country,
      String? birthDate,
      List? followers,
      List? following}) {
    return UserBO(
      email: email ?? this.email,
      uid: uid ?? this.uid,
      photoUrl: photoUrl ?? this.photoUrl,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      country: country ?? this.country,
      birthDate: birthDate ?? this.birthDate,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }
}
