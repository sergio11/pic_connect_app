// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEvent {
  String get uid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) loadProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? loadProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? loadProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadProfileEvent value) loadProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadProfileEvent value)? loadProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadProfileEvent value)? loadProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEventCopyWith<ProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnLoadProfileEventCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory _$$OnLoadProfileEventCopyWith(_$OnLoadProfileEvent value,
          $Res Function(_$OnLoadProfileEvent) then) =
      __$$OnLoadProfileEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$OnLoadProfileEventCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$OnLoadProfileEvent>
    implements _$$OnLoadProfileEventCopyWith<$Res> {
  __$$OnLoadProfileEventCopyWithImpl(
      _$OnLoadProfileEvent _value, $Res Function(_$OnLoadProfileEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$OnLoadProfileEvent(
      null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnLoadProfileEvent implements OnLoadProfileEvent {
  const _$OnLoadProfileEvent(this.uid);

  @override
  final String uid;

  @override
  String toString() {
    return 'ProfileEvent.loadProfile(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadProfileEvent &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadProfileEventCopyWith<_$OnLoadProfileEvent> get copyWith =>
      __$$OnLoadProfileEventCopyWithImpl<_$OnLoadProfileEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) loadProfile,
  }) {
    return loadProfile(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? loadProfile,
  }) {
    return loadProfile?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? loadProfile,
    required TResult orElse(),
  }) {
    if (loadProfile != null) {
      return loadProfile(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadProfileEvent value) loadProfile,
  }) {
    return loadProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadProfileEvent value)? loadProfile,
  }) {
    return loadProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadProfileEvent value)? loadProfile,
    required TResult orElse(),
  }) {
    if (loadProfile != null) {
      return loadProfile(this);
    }
    return orElse();
  }
}

abstract class OnLoadProfileEvent implements ProfileEvent {
  const factory OnLoadProfileEvent(final String uid) = _$OnLoadProfileEvent;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$OnLoadProfileEventCopyWith<_$OnLoadProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get postLen => throw _privateConstructorUsedError;
  int get followers => throw _privateConstructorUsedError;
  int get following => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  bool get isAuthUser => throw _privateConstructorUsedError;
  List<PostBO> get postList => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {bool isLoading,
      int postLen,
      int followers,
      int following,
      String? photoUrl,
      String? bio,
      String? username,
      bool isFollowing,
      bool isAuthUser,
      List<PostBO> postList,
      String? errorMessage});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? postLen = null,
    Object? followers = null,
    Object? following = null,
    Object? photoUrl = freezed,
    Object? bio = freezed,
    Object? username = freezed,
    Object? isFollowing = null,
    Object? isAuthUser = null,
    Object? postList = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      postLen: null == postLen
          ? _value.postLen
          : postLen // ignore: cast_nullable_to_non_nullable
              as int,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as int,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthUser: null == isAuthUser
          ? _value.isAuthUser
          : isAuthUser // ignore: cast_nullable_to_non_nullable
              as bool,
      postList: null == postList
          ? _value.postList
          : postList // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileStateCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$_ProfileStateCopyWith(
          _$_ProfileState value, $Res Function(_$_ProfileState) then) =
      __$$_ProfileStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int postLen,
      int followers,
      int following,
      String? photoUrl,
      String? bio,
      String? username,
      bool isFollowing,
      bool isAuthUser,
      List<PostBO> postList,
      String? errorMessage});
}

/// @nodoc
class __$$_ProfileStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$_ProfileState>
    implements _$$_ProfileStateCopyWith<$Res> {
  __$$_ProfileStateCopyWithImpl(
      _$_ProfileState _value, $Res Function(_$_ProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? postLen = null,
    Object? followers = null,
    Object? following = null,
    Object? photoUrl = freezed,
    Object? bio = freezed,
    Object? username = freezed,
    Object? isFollowing = null,
    Object? isAuthUser = null,
    Object? postList = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ProfileState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      postLen: null == postLen
          ? _value.postLen
          : postLen // ignore: cast_nullable_to_non_nullable
              as int,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as int,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthUser: null == isAuthUser
          ? _value.isAuthUser
          : isAuthUser // ignore: cast_nullable_to_non_nullable
              as bool,
      postList: null == postList
          ? _value._postList
          : postList // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ProfileState implements _ProfileState {
  const _$_ProfileState(
      {this.isLoading = true,
      this.postLen = 0,
      this.followers = 0,
      this.following = 0,
      this.photoUrl,
      this.bio,
      this.username,
      this.isFollowing = false,
      this.isAuthUser = false,
      final List<PostBO> postList = const [],
      this.errorMessage})
      : _postList = postList;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int postLen;
  @override
  @JsonKey()
  final int followers;
  @override
  @JsonKey()
  final int following;
  @override
  final String? photoUrl;
  @override
  final String? bio;
  @override
  final String? username;
  @override
  @JsonKey()
  final bool isFollowing;
  @override
  @JsonKey()
  final bool isAuthUser;
  final List<PostBO> _postList;
  @override
  @JsonKey()
  List<PostBO> get postList {
    if (_postList is EqualUnmodifiableListView) return _postList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postList);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, postLen: $postLen, followers: $followers, following: $following, photoUrl: $photoUrl, bio: $bio, username: $username, isFollowing: $isFollowing, isAuthUser: $isAuthUser, postList: $postList, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.postLen, postLen) || other.postLen == postLen) &&
            (identical(other.followers, followers) ||
                other.followers == followers) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.isAuthUser, isAuthUser) ||
                other.isAuthUser == isAuthUser) &&
            const DeepCollectionEquality().equals(other._postList, _postList) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      postLen,
      followers,
      following,
      photoUrl,
      bio,
      username,
      isFollowing,
      isAuthUser,
      const DeepCollectionEquality().hash(_postList),
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      __$$_ProfileStateCopyWithImpl<_$_ProfileState>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {final bool isLoading,
      final int postLen,
      final int followers,
      final int following,
      final String? photoUrl,
      final String? bio,
      final String? username,
      final bool isFollowing,
      final bool isAuthUser,
      final List<PostBO> postList,
      final String? errorMessage}) = _$_ProfileState;

  @override
  bool get isLoading;
  @override
  int get postLen;
  @override
  int get followers;
  @override
  int get following;
  @override
  String? get photoUrl;
  @override
  String? get bio;
  @override
  String? get username;
  @override
  bool get isFollowing;
  @override
  bool get isAuthUser;
  @override
  List<PostBO> get postList;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
