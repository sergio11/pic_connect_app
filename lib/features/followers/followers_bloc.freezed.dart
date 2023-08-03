// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FollowersEvent {
  String get userUid => throw _privateConstructorUsedError;
  String get authUserUid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUid, String authUserUid) loadFollowers,
    required TResult Function(String userUid, String authUserUid) loadFollowing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUid, String authUserUid)? loadFollowers,
    TResult? Function(String userUid, String authUserUid)? loadFollowing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUid, String authUserUid)? loadFollowers,
    TResult Function(String userUid, String authUserUid)? loadFollowing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadFollowersEvent value) loadFollowers,
    required TResult Function(OnLoadFollowingEvent value) loadFollowing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadFollowersEvent value)? loadFollowers,
    TResult? Function(OnLoadFollowingEvent value)? loadFollowing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadFollowersEvent value)? loadFollowers,
    TResult Function(OnLoadFollowingEvent value)? loadFollowing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowersEventCopyWith<FollowersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowersEventCopyWith<$Res> {
  factory $FollowersEventCopyWith(
          FollowersEvent value, $Res Function(FollowersEvent) then) =
      _$FollowersEventCopyWithImpl<$Res, FollowersEvent>;
  @useResult
  $Res call({String userUid, String authUserUid});
}

/// @nodoc
class _$FollowersEventCopyWithImpl<$Res, $Val extends FollowersEvent>
    implements $FollowersEventCopyWith<$Res> {
  _$FollowersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? authUserUid = null,
  }) {
    return _then(_value.copyWith(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      authUserUid: null == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnLoadFollowersEventCopyWith<$Res>
    implements $FollowersEventCopyWith<$Res> {
  factory _$$OnLoadFollowersEventCopyWith(_$OnLoadFollowersEvent value,
          $Res Function(_$OnLoadFollowersEvent) then) =
      __$$OnLoadFollowersEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUid, String authUserUid});
}

/// @nodoc
class __$$OnLoadFollowersEventCopyWithImpl<$Res>
    extends _$FollowersEventCopyWithImpl<$Res, _$OnLoadFollowersEvent>
    implements _$$OnLoadFollowersEventCopyWith<$Res> {
  __$$OnLoadFollowersEventCopyWithImpl(_$OnLoadFollowersEvent _value,
      $Res Function(_$OnLoadFollowersEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? authUserUid = null,
  }) {
    return _then(_$OnLoadFollowersEvent(
      null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      null == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnLoadFollowersEvent implements OnLoadFollowersEvent {
  const _$OnLoadFollowersEvent(this.userUid, this.authUserUid);

  @override
  final String userUid;
  @override
  final String authUserUid;

  @override
  String toString() {
    return 'FollowersEvent.loadFollowers(userUid: $userUid, authUserUid: $authUserUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadFollowersEvent &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.authUserUid, authUserUid) ||
                other.authUserUid == authUserUid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUid, authUserUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadFollowersEventCopyWith<_$OnLoadFollowersEvent> get copyWith =>
      __$$OnLoadFollowersEventCopyWithImpl<_$OnLoadFollowersEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUid, String authUserUid) loadFollowers,
    required TResult Function(String userUid, String authUserUid) loadFollowing,
  }) {
    return loadFollowers(userUid, authUserUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUid, String authUserUid)? loadFollowers,
    TResult? Function(String userUid, String authUserUid)? loadFollowing,
  }) {
    return loadFollowers?.call(userUid, authUserUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUid, String authUserUid)? loadFollowers,
    TResult Function(String userUid, String authUserUid)? loadFollowing,
    required TResult orElse(),
  }) {
    if (loadFollowers != null) {
      return loadFollowers(userUid, authUserUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadFollowersEvent value) loadFollowers,
    required TResult Function(OnLoadFollowingEvent value) loadFollowing,
  }) {
    return loadFollowers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadFollowersEvent value)? loadFollowers,
    TResult? Function(OnLoadFollowingEvent value)? loadFollowing,
  }) {
    return loadFollowers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadFollowersEvent value)? loadFollowers,
    TResult Function(OnLoadFollowingEvent value)? loadFollowing,
    required TResult orElse(),
  }) {
    if (loadFollowers != null) {
      return loadFollowers(this);
    }
    return orElse();
  }
}

abstract class OnLoadFollowersEvent implements FollowersEvent {
  const factory OnLoadFollowersEvent(
      final String userUid, final String authUserUid) = _$OnLoadFollowersEvent;

  @override
  String get userUid;
  @override
  String get authUserUid;
  @override
  @JsonKey(ignore: true)
  _$$OnLoadFollowersEventCopyWith<_$OnLoadFollowersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnLoadFollowingEventCopyWith<$Res>
    implements $FollowersEventCopyWith<$Res> {
  factory _$$OnLoadFollowingEventCopyWith(_$OnLoadFollowingEvent value,
          $Res Function(_$OnLoadFollowingEvent) then) =
      __$$OnLoadFollowingEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUid, String authUserUid});
}

/// @nodoc
class __$$OnLoadFollowingEventCopyWithImpl<$Res>
    extends _$FollowersEventCopyWithImpl<$Res, _$OnLoadFollowingEvent>
    implements _$$OnLoadFollowingEventCopyWith<$Res> {
  __$$OnLoadFollowingEventCopyWithImpl(_$OnLoadFollowingEvent _value,
      $Res Function(_$OnLoadFollowingEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? authUserUid = null,
  }) {
    return _then(_$OnLoadFollowingEvent(
      null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      null == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnLoadFollowingEvent implements OnLoadFollowingEvent {
  const _$OnLoadFollowingEvent(this.userUid, this.authUserUid);

  @override
  final String userUid;
  @override
  final String authUserUid;

  @override
  String toString() {
    return 'FollowersEvent.loadFollowing(userUid: $userUid, authUserUid: $authUserUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadFollowingEvent &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.authUserUid, authUserUid) ||
                other.authUserUid == authUserUid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUid, authUserUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadFollowingEventCopyWith<_$OnLoadFollowingEvent> get copyWith =>
      __$$OnLoadFollowingEventCopyWithImpl<_$OnLoadFollowingEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUid, String authUserUid) loadFollowers,
    required TResult Function(String userUid, String authUserUid) loadFollowing,
  }) {
    return loadFollowing(userUid, authUserUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUid, String authUserUid)? loadFollowers,
    TResult? Function(String userUid, String authUserUid)? loadFollowing,
  }) {
    return loadFollowing?.call(userUid, authUserUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUid, String authUserUid)? loadFollowers,
    TResult Function(String userUid, String authUserUid)? loadFollowing,
    required TResult orElse(),
  }) {
    if (loadFollowing != null) {
      return loadFollowing(userUid, authUserUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadFollowersEvent value) loadFollowers,
    required TResult Function(OnLoadFollowingEvent value) loadFollowing,
  }) {
    return loadFollowing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadFollowersEvent value)? loadFollowers,
    TResult? Function(OnLoadFollowingEvent value)? loadFollowing,
  }) {
    return loadFollowing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadFollowersEvent value)? loadFollowers,
    TResult Function(OnLoadFollowingEvent value)? loadFollowing,
    required TResult orElse(),
  }) {
    if (loadFollowing != null) {
      return loadFollowing(this);
    }
    return orElse();
  }
}

abstract class OnLoadFollowingEvent implements FollowersEvent {
  const factory OnLoadFollowingEvent(
      final String userUid, final String authUserUid) = _$OnLoadFollowingEvent;

  @override
  String get userUid;
  @override
  String get authUserUid;
  @override
  @JsonKey(ignore: true)
  _$$OnLoadFollowingEventCopyWith<_$OnLoadFollowingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FollowersState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<UserBO> get users => throw _privateConstructorUsedError;
  DisplayContentTypeEnum get contentTypeEnum =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowersStateCopyWith<FollowersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowersStateCopyWith<$Res> {
  factory $FollowersStateCopyWith(
          FollowersState value, $Res Function(FollowersState) then) =
      _$FollowersStateCopyWithImpl<$Res, FollowersState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<UserBO> users,
      DisplayContentTypeEnum contentTypeEnum,
      String? errorMessage});
}

/// @nodoc
class _$FollowersStateCopyWithImpl<$Res, $Val extends FollowersState>
    implements $FollowersStateCopyWith<$Res> {
  _$FollowersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? users = null,
    Object? contentTypeEnum = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserBO>,
      contentTypeEnum: null == contentTypeEnum
          ? _value.contentTypeEnum
          : contentTypeEnum // ignore: cast_nullable_to_non_nullable
              as DisplayContentTypeEnum,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FollowersStateCopyWith<$Res>
    implements $FollowersStateCopyWith<$Res> {
  factory _$$_FollowersStateCopyWith(
          _$_FollowersState value, $Res Function(_$_FollowersState) then) =
      __$$_FollowersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<UserBO> users,
      DisplayContentTypeEnum contentTypeEnum,
      String? errorMessage});
}

/// @nodoc
class __$$_FollowersStateCopyWithImpl<$Res>
    extends _$FollowersStateCopyWithImpl<$Res, _$_FollowersState>
    implements _$$_FollowersStateCopyWith<$Res> {
  __$$_FollowersStateCopyWithImpl(
      _$_FollowersState _value, $Res Function(_$_FollowersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? users = null,
    Object? contentTypeEnum = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_FollowersState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserBO>,
      contentTypeEnum: null == contentTypeEnum
          ? _value.contentTypeEnum
          : contentTypeEnum // ignore: cast_nullable_to_non_nullable
              as DisplayContentTypeEnum,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_FollowersState implements _FollowersState {
  const _$_FollowersState(
      {this.isLoading = false,
      final List<UserBO> users = const [],
      this.contentTypeEnum = DisplayContentTypeEnum.followers,
      this.errorMessage})
      : _users = users;

  @override
  @JsonKey()
  final bool isLoading;
  final List<UserBO> _users;
  @override
  @JsonKey()
  List<UserBO> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  @JsonKey()
  final DisplayContentTypeEnum contentTypeEnum;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'FollowersState(isLoading: $isLoading, users: $users, contentTypeEnum: $contentTypeEnum, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FollowersState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.contentTypeEnum, contentTypeEnum) ||
                other.contentTypeEnum == contentTypeEnum) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_users),
      contentTypeEnum,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowersStateCopyWith<_$_FollowersState> get copyWith =>
      __$$_FollowersStateCopyWithImpl<_$_FollowersState>(this, _$identity);
}

abstract class _FollowersState implements FollowersState {
  const factory _FollowersState(
      {final bool isLoading,
      final List<UserBO> users,
      final DisplayContentTypeEnum contentTypeEnum,
      final String? errorMessage}) = _$_FollowersState;

  @override
  bool get isLoading;
  @override
  List<UserBO> get users;
  @override
  DisplayContentTypeEnum get contentTypeEnum;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_FollowersStateCopyWith<_$_FollowersState> get copyWith =>
      throw _privateConstructorUsedError;
}
