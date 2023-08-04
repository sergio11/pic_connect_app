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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) loadProfile,
    required TResult Function() signOut,
    required TResult Function(String uid) followUser,
    required TResult Function(String uid) unFollowUser,
    required TResult Function() refreshData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? loadProfile,
    TResult? Function()? signOut,
    TResult? Function(String uid)? followUser,
    TResult? Function(String uid)? unFollowUser,
    TResult? Function()? refreshData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? loadProfile,
    TResult Function()? signOut,
    TResult Function(String uid)? followUser,
    TResult Function(String uid)? unFollowUser,
    TResult Function()? refreshData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadProfileEvent value) loadProfile,
    required TResult Function(OnSignOutEvent value) signOut,
    required TResult Function(OnFollowUserEvent value) followUser,
    required TResult Function(OnUnFollowUserEvent value) unFollowUser,
    required TResult Function(OnRefreshEvent value) refreshData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadProfileEvent value)? loadProfile,
    TResult? Function(OnSignOutEvent value)? signOut,
    TResult? Function(OnFollowUserEvent value)? followUser,
    TResult? Function(OnUnFollowUserEvent value)? unFollowUser,
    TResult? Function(OnRefreshEvent value)? refreshData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadProfileEvent value)? loadProfile,
    TResult Function(OnSignOutEvent value)? signOut,
    TResult Function(OnFollowUserEvent value)? followUser,
    TResult Function(OnUnFollowUserEvent value)? unFollowUser,
    TResult Function(OnRefreshEvent value)? refreshData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnLoadProfileEventCopyWith<$Res> {
  factory _$$OnLoadProfileEventCopyWith(_$OnLoadProfileEvent value,
          $Res Function(_$OnLoadProfileEvent) then) =
      __$$OnLoadProfileEventCopyWithImpl<$Res>;
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
    required TResult Function() signOut,
    required TResult Function(String uid) followUser,
    required TResult Function(String uid) unFollowUser,
    required TResult Function() refreshData,
  }) {
    return loadProfile(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? loadProfile,
    TResult? Function()? signOut,
    TResult? Function(String uid)? followUser,
    TResult? Function(String uid)? unFollowUser,
    TResult? Function()? refreshData,
  }) {
    return loadProfile?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? loadProfile,
    TResult Function()? signOut,
    TResult Function(String uid)? followUser,
    TResult Function(String uid)? unFollowUser,
    TResult Function()? refreshData,
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
    required TResult Function(OnSignOutEvent value) signOut,
    required TResult Function(OnFollowUserEvent value) followUser,
    required TResult Function(OnUnFollowUserEvent value) unFollowUser,
    required TResult Function(OnRefreshEvent value) refreshData,
  }) {
    return loadProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadProfileEvent value)? loadProfile,
    TResult? Function(OnSignOutEvent value)? signOut,
    TResult? Function(OnFollowUserEvent value)? followUser,
    TResult? Function(OnUnFollowUserEvent value)? unFollowUser,
    TResult? Function(OnRefreshEvent value)? refreshData,
  }) {
    return loadProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadProfileEvent value)? loadProfile,
    TResult Function(OnSignOutEvent value)? signOut,
    TResult Function(OnFollowUserEvent value)? followUser,
    TResult Function(OnUnFollowUserEvent value)? unFollowUser,
    TResult Function(OnRefreshEvent value)? refreshData,
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

  String get uid;
  @JsonKey(ignore: true)
  _$$OnLoadProfileEventCopyWith<_$OnLoadProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSignOutEventCopyWith<$Res> {
  factory _$$OnSignOutEventCopyWith(
          _$OnSignOutEvent value, $Res Function(_$OnSignOutEvent) then) =
      __$$OnSignOutEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnSignOutEventCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$OnSignOutEvent>
    implements _$$OnSignOutEventCopyWith<$Res> {
  __$$OnSignOutEventCopyWithImpl(
      _$OnSignOutEvent _value, $Res Function(_$OnSignOutEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnSignOutEvent implements OnSignOutEvent {
  const _$OnSignOutEvent();

  @override
  String toString() {
    return 'ProfileEvent.signOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnSignOutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) loadProfile,
    required TResult Function() signOut,
    required TResult Function(String uid) followUser,
    required TResult Function(String uid) unFollowUser,
    required TResult Function() refreshData,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? loadProfile,
    TResult? Function()? signOut,
    TResult? Function(String uid)? followUser,
    TResult? Function(String uid)? unFollowUser,
    TResult? Function()? refreshData,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? loadProfile,
    TResult Function()? signOut,
    TResult Function(String uid)? followUser,
    TResult Function(String uid)? unFollowUser,
    TResult Function()? refreshData,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadProfileEvent value) loadProfile,
    required TResult Function(OnSignOutEvent value) signOut,
    required TResult Function(OnFollowUserEvent value) followUser,
    required TResult Function(OnUnFollowUserEvent value) unFollowUser,
    required TResult Function(OnRefreshEvent value) refreshData,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadProfileEvent value)? loadProfile,
    TResult? Function(OnSignOutEvent value)? signOut,
    TResult? Function(OnFollowUserEvent value)? followUser,
    TResult? Function(OnUnFollowUserEvent value)? unFollowUser,
    TResult? Function(OnRefreshEvent value)? refreshData,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadProfileEvent value)? loadProfile,
    TResult Function(OnSignOutEvent value)? signOut,
    TResult Function(OnFollowUserEvent value)? followUser,
    TResult Function(OnUnFollowUserEvent value)? unFollowUser,
    TResult Function(OnRefreshEvent value)? refreshData,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class OnSignOutEvent implements ProfileEvent {
  const factory OnSignOutEvent() = _$OnSignOutEvent;
}

/// @nodoc
abstract class _$$OnFollowUserEventCopyWith<$Res> {
  factory _$$OnFollowUserEventCopyWith(
          _$OnFollowUserEvent value, $Res Function(_$OnFollowUserEvent) then) =
      __$$OnFollowUserEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$OnFollowUserEventCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$OnFollowUserEvent>
    implements _$$OnFollowUserEventCopyWith<$Res> {
  __$$OnFollowUserEventCopyWithImpl(
      _$OnFollowUserEvent _value, $Res Function(_$OnFollowUserEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$OnFollowUserEvent(
      null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnFollowUserEvent implements OnFollowUserEvent {
  const _$OnFollowUserEvent(this.uid);

  @override
  final String uid;

  @override
  String toString() {
    return 'ProfileEvent.followUser(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnFollowUserEvent &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnFollowUserEventCopyWith<_$OnFollowUserEvent> get copyWith =>
      __$$OnFollowUserEventCopyWithImpl<_$OnFollowUserEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) loadProfile,
    required TResult Function() signOut,
    required TResult Function(String uid) followUser,
    required TResult Function(String uid) unFollowUser,
    required TResult Function() refreshData,
  }) {
    return followUser(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? loadProfile,
    TResult? Function()? signOut,
    TResult? Function(String uid)? followUser,
    TResult? Function(String uid)? unFollowUser,
    TResult? Function()? refreshData,
  }) {
    return followUser?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? loadProfile,
    TResult Function()? signOut,
    TResult Function(String uid)? followUser,
    TResult Function(String uid)? unFollowUser,
    TResult Function()? refreshData,
    required TResult orElse(),
  }) {
    if (followUser != null) {
      return followUser(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadProfileEvent value) loadProfile,
    required TResult Function(OnSignOutEvent value) signOut,
    required TResult Function(OnFollowUserEvent value) followUser,
    required TResult Function(OnUnFollowUserEvent value) unFollowUser,
    required TResult Function(OnRefreshEvent value) refreshData,
  }) {
    return followUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadProfileEvent value)? loadProfile,
    TResult? Function(OnSignOutEvent value)? signOut,
    TResult? Function(OnFollowUserEvent value)? followUser,
    TResult? Function(OnUnFollowUserEvent value)? unFollowUser,
    TResult? Function(OnRefreshEvent value)? refreshData,
  }) {
    return followUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadProfileEvent value)? loadProfile,
    TResult Function(OnSignOutEvent value)? signOut,
    TResult Function(OnFollowUserEvent value)? followUser,
    TResult Function(OnUnFollowUserEvent value)? unFollowUser,
    TResult Function(OnRefreshEvent value)? refreshData,
    required TResult orElse(),
  }) {
    if (followUser != null) {
      return followUser(this);
    }
    return orElse();
  }
}

abstract class OnFollowUserEvent implements ProfileEvent {
  const factory OnFollowUserEvent(final String uid) = _$OnFollowUserEvent;

  String get uid;
  @JsonKey(ignore: true)
  _$$OnFollowUserEventCopyWith<_$OnFollowUserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnUnFollowUserEventCopyWith<$Res> {
  factory _$$OnUnFollowUserEventCopyWith(_$OnUnFollowUserEvent value,
          $Res Function(_$OnUnFollowUserEvent) then) =
      __$$OnUnFollowUserEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$OnUnFollowUserEventCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$OnUnFollowUserEvent>
    implements _$$OnUnFollowUserEventCopyWith<$Res> {
  __$$OnUnFollowUserEventCopyWithImpl(
      _$OnUnFollowUserEvent _value, $Res Function(_$OnUnFollowUserEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$OnUnFollowUserEvent(
      null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnUnFollowUserEvent implements OnUnFollowUserEvent {
  const _$OnUnFollowUserEvent(this.uid);

  @override
  final String uid;

  @override
  String toString() {
    return 'ProfileEvent.unFollowUser(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUnFollowUserEvent &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnUnFollowUserEventCopyWith<_$OnUnFollowUserEvent> get copyWith =>
      __$$OnUnFollowUserEventCopyWithImpl<_$OnUnFollowUserEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) loadProfile,
    required TResult Function() signOut,
    required TResult Function(String uid) followUser,
    required TResult Function(String uid) unFollowUser,
    required TResult Function() refreshData,
  }) {
    return unFollowUser(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? loadProfile,
    TResult? Function()? signOut,
    TResult? Function(String uid)? followUser,
    TResult? Function(String uid)? unFollowUser,
    TResult? Function()? refreshData,
  }) {
    return unFollowUser?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? loadProfile,
    TResult Function()? signOut,
    TResult Function(String uid)? followUser,
    TResult Function(String uid)? unFollowUser,
    TResult Function()? refreshData,
    required TResult orElse(),
  }) {
    if (unFollowUser != null) {
      return unFollowUser(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadProfileEvent value) loadProfile,
    required TResult Function(OnSignOutEvent value) signOut,
    required TResult Function(OnFollowUserEvent value) followUser,
    required TResult Function(OnUnFollowUserEvent value) unFollowUser,
    required TResult Function(OnRefreshEvent value) refreshData,
  }) {
    return unFollowUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadProfileEvent value)? loadProfile,
    TResult? Function(OnSignOutEvent value)? signOut,
    TResult? Function(OnFollowUserEvent value)? followUser,
    TResult? Function(OnUnFollowUserEvent value)? unFollowUser,
    TResult? Function(OnRefreshEvent value)? refreshData,
  }) {
    return unFollowUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadProfileEvent value)? loadProfile,
    TResult Function(OnSignOutEvent value)? signOut,
    TResult Function(OnFollowUserEvent value)? followUser,
    TResult Function(OnUnFollowUserEvent value)? unFollowUser,
    TResult Function(OnRefreshEvent value)? refreshData,
    required TResult orElse(),
  }) {
    if (unFollowUser != null) {
      return unFollowUser(this);
    }
    return orElse();
  }
}

abstract class OnUnFollowUserEvent implements ProfileEvent {
  const factory OnUnFollowUserEvent(final String uid) = _$OnUnFollowUserEvent;

  String get uid;
  @JsonKey(ignore: true)
  _$$OnUnFollowUserEventCopyWith<_$OnUnFollowUserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnRefreshEventCopyWith<$Res> {
  factory _$$OnRefreshEventCopyWith(
          _$OnRefreshEvent value, $Res Function(_$OnRefreshEvent) then) =
      __$$OnRefreshEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnRefreshEventCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$OnRefreshEvent>
    implements _$$OnRefreshEventCopyWith<$Res> {
  __$$OnRefreshEventCopyWithImpl(
      _$OnRefreshEvent _value, $Res Function(_$OnRefreshEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnRefreshEvent implements OnRefreshEvent {
  const _$OnRefreshEvent();

  @override
  String toString() {
    return 'ProfileEvent.refreshData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnRefreshEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) loadProfile,
    required TResult Function() signOut,
    required TResult Function(String uid) followUser,
    required TResult Function(String uid) unFollowUser,
    required TResult Function() refreshData,
  }) {
    return refreshData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? loadProfile,
    TResult? Function()? signOut,
    TResult? Function(String uid)? followUser,
    TResult? Function(String uid)? unFollowUser,
    TResult? Function()? refreshData,
  }) {
    return refreshData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? loadProfile,
    TResult Function()? signOut,
    TResult Function(String uid)? followUser,
    TResult Function(String uid)? unFollowUser,
    TResult Function()? refreshData,
    required TResult orElse(),
  }) {
    if (refreshData != null) {
      return refreshData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadProfileEvent value) loadProfile,
    required TResult Function(OnSignOutEvent value) signOut,
    required TResult Function(OnFollowUserEvent value) followUser,
    required TResult Function(OnUnFollowUserEvent value) unFollowUser,
    required TResult Function(OnRefreshEvent value) refreshData,
  }) {
    return refreshData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadProfileEvent value)? loadProfile,
    TResult? Function(OnSignOutEvent value)? signOut,
    TResult? Function(OnFollowUserEvent value)? followUser,
    TResult? Function(OnUnFollowUserEvent value)? unFollowUser,
    TResult? Function(OnRefreshEvent value)? refreshData,
  }) {
    return refreshData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadProfileEvent value)? loadProfile,
    TResult Function(OnSignOutEvent value)? signOut,
    TResult Function(OnFollowUserEvent value)? followUser,
    TResult Function(OnUnFollowUserEvent value)? unFollowUser,
    TResult Function(OnRefreshEvent value)? refreshData,
    required TResult orElse(),
  }) {
    if (refreshData != null) {
      return refreshData(this);
    }
    return orElse();
  }
}

abstract class OnRefreshEvent implements ProfileEvent {
  const factory OnRefreshEvent() = _$OnRefreshEvent;
}

/// @nodoc
mixin _$ProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get postLen => throw _privateConstructorUsedError;
  int get followers => throw _privateConstructorUsedError;
  int get following => throw _privateConstructorUsedError;
  String get userUid => throw _privateConstructorUsedError;
  String get authUserUid => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  bool get isLogout => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  bool get isAuthUser => throw _privateConstructorUsedError;
  bool get isPostGridLoading => throw _privateConstructorUsedError;
  bool get isFavoritePostGridLoading => throw _privateConstructorUsedError;
  bool get isBookmarkPostGridLoading => throw _privateConstructorUsedError;
  List<PostBO> get postList => throw _privateConstructorUsedError;
  List<PostBO> get favoritePostList => throw _privateConstructorUsedError;
  List<PostBO> get bookmarkPostList => throw _privateConstructorUsedError;
  List<ProfileTab> get profileTabs => throw _privateConstructorUsedError;
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
      String userUid,
      String authUserUid,
      String photoUrl,
      String bio,
      String username,
      bool isLogout,
      bool isFollowing,
      bool isAuthUser,
      bool isPostGridLoading,
      bool isFavoritePostGridLoading,
      bool isBookmarkPostGridLoading,
      List<PostBO> postList,
      List<PostBO> favoritePostList,
      List<PostBO> bookmarkPostList,
      List<ProfileTab> profileTabs,
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
    Object? userUid = null,
    Object? authUserUid = null,
    Object? photoUrl = null,
    Object? bio = null,
    Object? username = null,
    Object? isLogout = null,
    Object? isFollowing = null,
    Object? isAuthUser = null,
    Object? isPostGridLoading = null,
    Object? isFavoritePostGridLoading = null,
    Object? isBookmarkPostGridLoading = null,
    Object? postList = null,
    Object? favoritePostList = null,
    Object? bookmarkPostList = null,
    Object? profileTabs = null,
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
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      authUserUid: null == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      isLogout: null == isLogout
          ? _value.isLogout
          : isLogout // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthUser: null == isAuthUser
          ? _value.isAuthUser
          : isAuthUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isPostGridLoading: null == isPostGridLoading
          ? _value.isPostGridLoading
          : isPostGridLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavoritePostGridLoading: null == isFavoritePostGridLoading
          ? _value.isFavoritePostGridLoading
          : isFavoritePostGridLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookmarkPostGridLoading: null == isBookmarkPostGridLoading
          ? _value.isBookmarkPostGridLoading
          : isBookmarkPostGridLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      postList: null == postList
          ? _value.postList
          : postList // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      favoritePostList: null == favoritePostList
          ? _value.favoritePostList
          : favoritePostList // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      bookmarkPostList: null == bookmarkPostList
          ? _value.bookmarkPostList
          : bookmarkPostList // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      profileTabs: null == profileTabs
          ? _value.profileTabs
          : profileTabs // ignore: cast_nullable_to_non_nullable
              as List<ProfileTab>,
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
      String userUid,
      String authUserUid,
      String photoUrl,
      String bio,
      String username,
      bool isLogout,
      bool isFollowing,
      bool isAuthUser,
      bool isPostGridLoading,
      bool isFavoritePostGridLoading,
      bool isBookmarkPostGridLoading,
      List<PostBO> postList,
      List<PostBO> favoritePostList,
      List<PostBO> bookmarkPostList,
      List<ProfileTab> profileTabs,
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
    Object? userUid = null,
    Object? authUserUid = null,
    Object? photoUrl = null,
    Object? bio = null,
    Object? username = null,
    Object? isLogout = null,
    Object? isFollowing = null,
    Object? isAuthUser = null,
    Object? isPostGridLoading = null,
    Object? isFavoritePostGridLoading = null,
    Object? isBookmarkPostGridLoading = null,
    Object? postList = null,
    Object? favoritePostList = null,
    Object? bookmarkPostList = null,
    Object? profileTabs = null,
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
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      authUserUid: null == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      isLogout: null == isLogout
          ? _value.isLogout
          : isLogout // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthUser: null == isAuthUser
          ? _value.isAuthUser
          : isAuthUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isPostGridLoading: null == isPostGridLoading
          ? _value.isPostGridLoading
          : isPostGridLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavoritePostGridLoading: null == isFavoritePostGridLoading
          ? _value.isFavoritePostGridLoading
          : isFavoritePostGridLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookmarkPostGridLoading: null == isBookmarkPostGridLoading
          ? _value.isBookmarkPostGridLoading
          : isBookmarkPostGridLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      postList: null == postList
          ? _value._postList
          : postList // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      favoritePostList: null == favoritePostList
          ? _value._favoritePostList
          : favoritePostList // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      bookmarkPostList: null == bookmarkPostList
          ? _value._bookmarkPostList
          : bookmarkPostList // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      profileTabs: null == profileTabs
          ? _value._profileTabs
          : profileTabs // ignore: cast_nullable_to_non_nullable
              as List<ProfileTab>,
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
      this.userUid = "",
      this.authUserUid = "",
      this.photoUrl = "",
      this.bio = "",
      this.username = "",
      this.isLogout = false,
      this.isFollowing = false,
      this.isAuthUser = false,
      this.isPostGridLoading = false,
      this.isFavoritePostGridLoading = false,
      this.isBookmarkPostGridLoading = false,
      final List<PostBO> postList = const [],
      final List<PostBO> favoritePostList = const [],
      final List<PostBO> bookmarkPostList = const [],
      final List<ProfileTab> profileTabs = ProfileTab.values,
      this.errorMessage})
      : _postList = postList,
        _favoritePostList = favoritePostList,
        _bookmarkPostList = bookmarkPostList,
        _profileTabs = profileTabs;

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
  @JsonKey()
  final String userUid;
  @override
  @JsonKey()
  final String authUserUid;
  @override
  @JsonKey()
  final String photoUrl;
  @override
  @JsonKey()
  final String bio;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final bool isLogout;
  @override
  @JsonKey()
  final bool isFollowing;
  @override
  @JsonKey()
  final bool isAuthUser;
  @override
  @JsonKey()
  final bool isPostGridLoading;
  @override
  @JsonKey()
  final bool isFavoritePostGridLoading;
  @override
  @JsonKey()
  final bool isBookmarkPostGridLoading;
  final List<PostBO> _postList;
  @override
  @JsonKey()
  List<PostBO> get postList {
    if (_postList is EqualUnmodifiableListView) return _postList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postList);
  }

  final List<PostBO> _favoritePostList;
  @override
  @JsonKey()
  List<PostBO> get favoritePostList {
    if (_favoritePostList is EqualUnmodifiableListView)
      return _favoritePostList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritePostList);
  }

  final List<PostBO> _bookmarkPostList;
  @override
  @JsonKey()
  List<PostBO> get bookmarkPostList {
    if (_bookmarkPostList is EqualUnmodifiableListView)
      return _bookmarkPostList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarkPostList);
  }

  final List<ProfileTab> _profileTabs;
  @override
  @JsonKey()
  List<ProfileTab> get profileTabs {
    if (_profileTabs is EqualUnmodifiableListView) return _profileTabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profileTabs);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, postLen: $postLen, followers: $followers, following: $following, userUid: $userUid, authUserUid: $authUserUid, photoUrl: $photoUrl, bio: $bio, username: $username, isLogout: $isLogout, isFollowing: $isFollowing, isAuthUser: $isAuthUser, isPostGridLoading: $isPostGridLoading, isFavoritePostGridLoading: $isFavoritePostGridLoading, isBookmarkPostGridLoading: $isBookmarkPostGridLoading, postList: $postList, favoritePostList: $favoritePostList, bookmarkPostList: $bookmarkPostList, profileTabs: $profileTabs, errorMessage: $errorMessage)';
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
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.authUserUid, authUserUid) ||
                other.authUserUid == authUserUid) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isLogout, isLogout) ||
                other.isLogout == isLogout) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.isAuthUser, isAuthUser) ||
                other.isAuthUser == isAuthUser) &&
            (identical(other.isPostGridLoading, isPostGridLoading) ||
                other.isPostGridLoading == isPostGridLoading) &&
            (identical(other.isFavoritePostGridLoading,
                    isFavoritePostGridLoading) ||
                other.isFavoritePostGridLoading == isFavoritePostGridLoading) &&
            (identical(other.isBookmarkPostGridLoading,
                    isBookmarkPostGridLoading) ||
                other.isBookmarkPostGridLoading == isBookmarkPostGridLoading) &&
            const DeepCollectionEquality().equals(other._postList, _postList) &&
            const DeepCollectionEquality()
                .equals(other._favoritePostList, _favoritePostList) &&
            const DeepCollectionEquality()
                .equals(other._bookmarkPostList, _bookmarkPostList) &&
            const DeepCollectionEquality()
                .equals(other._profileTabs, _profileTabs) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        postLen,
        followers,
        following,
        userUid,
        authUserUid,
        photoUrl,
        bio,
        username,
        isLogout,
        isFollowing,
        isAuthUser,
        isPostGridLoading,
        isFavoritePostGridLoading,
        isBookmarkPostGridLoading,
        const DeepCollectionEquality().hash(_postList),
        const DeepCollectionEquality().hash(_favoritePostList),
        const DeepCollectionEquality().hash(_bookmarkPostList),
        const DeepCollectionEquality().hash(_profileTabs),
        errorMessage
      ]);

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
      final String userUid,
      final String authUserUid,
      final String photoUrl,
      final String bio,
      final String username,
      final bool isLogout,
      final bool isFollowing,
      final bool isAuthUser,
      final bool isPostGridLoading,
      final bool isFavoritePostGridLoading,
      final bool isBookmarkPostGridLoading,
      final List<PostBO> postList,
      final List<PostBO> favoritePostList,
      final List<PostBO> bookmarkPostList,
      final List<ProfileTab> profileTabs,
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
  String get userUid;
  @override
  String get authUserUid;
  @override
  String get photoUrl;
  @override
  String get bio;
  @override
  String get username;
  @override
  bool get isLogout;
  @override
  bool get isFollowing;
  @override
  bool get isAuthUser;
  @override
  bool get isPostGridLoading;
  @override
  bool get isFavoritePostGridLoading;
  @override
  bool get isBookmarkPostGridLoading;
  @override
  List<PostBO> get postList;
  @override
  List<PostBO> get favoritePostList;
  @override
  List<PostBO> get bookmarkPostList;
  @override
  List<ProfileTab> get profileTabs;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
