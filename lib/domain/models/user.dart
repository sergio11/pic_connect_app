import 'package:flutter/foundation.dart';

class UserBO {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String? bio;
  final String? country;
  final String? birthDate;
  final int? lastSeen;
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
      required this.following,
      required this.lastSeen});

  static const UserBO unknownUser = UserBO(
    email: '',
    uid: 'unknown',
    photoUrl: '',
    username: 'Unknown',
    bio: '',
    country: '',
    birthDate: '',
    followers: [],
    following: [],
    lastSeen: null,
  );

  UserBO copyWith(
      {String? email,
      String? uid,
      String? photoUrl,
      String? username,
      String? bio,
      String? country,
      String? birthDate,
      int? lastSeen,
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
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    final UserBO otherUser = other as UserBO;

    return email == otherUser.email &&
        uid == otherUser.uid &&
        photoUrl == otherUser.photoUrl &&
        username == otherUser.username &&
        bio == otherUser.bio &&
        country == otherUser.country &&
        birthDate == otherUser.birthDate &&
        listEquals(followers, otherUser.followers) &&
        listEquals(following, otherUser.following);
  }

  @override
  int get hashCode {
    return email.hashCode ^
        uid.hashCode ^
        photoUrl.hashCode ^
        username.hashCode ^
        bio.hashCode ^
        country.hashCode ^
        birthDate.hashCode;
  }
}
