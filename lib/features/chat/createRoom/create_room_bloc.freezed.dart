// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_room_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateRoomEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authUserUuid) onLoadUsers,
    required TResult Function(String userUuid) onCreateRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String authUserUuid)? onLoadUsers,
    TResult? Function(String userUuid)? onCreateRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String authUserUuid)? onLoadUsers,
    TResult Function(String userUuid)? onCreateRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadUsersEvent value) onLoadUsers,
    required TResult Function(OnCreateRoomEvent value) onCreateRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadUsersEvent value)? onLoadUsers,
    TResult? Function(OnCreateRoomEvent value)? onCreateRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadUsersEvent value)? onLoadUsers,
    TResult Function(OnCreateRoomEvent value)? onCreateRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRoomEventCopyWith<$Res> {
  factory $CreateRoomEventCopyWith(
          CreateRoomEvent value, $Res Function(CreateRoomEvent) then) =
      _$CreateRoomEventCopyWithImpl<$Res, CreateRoomEvent>;
}

/// @nodoc
class _$CreateRoomEventCopyWithImpl<$Res, $Val extends CreateRoomEvent>
    implements $CreateRoomEventCopyWith<$Res> {
  _$CreateRoomEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnLoadUsersEventCopyWith<$Res> {
  factory _$$OnLoadUsersEventCopyWith(
          _$OnLoadUsersEvent value, $Res Function(_$OnLoadUsersEvent) then) =
      __$$OnLoadUsersEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String authUserUuid});
}

/// @nodoc
class __$$OnLoadUsersEventCopyWithImpl<$Res>
    extends _$CreateRoomEventCopyWithImpl<$Res, _$OnLoadUsersEvent>
    implements _$$OnLoadUsersEventCopyWith<$Res> {
  __$$OnLoadUsersEventCopyWithImpl(
      _$OnLoadUsersEvent _value, $Res Function(_$OnLoadUsersEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUserUuid = null,
  }) {
    return _then(_$OnLoadUsersEvent(
      null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnLoadUsersEvent implements OnLoadUsersEvent {
  const _$OnLoadUsersEvent(this.authUserUuid);

  @override
  final String authUserUuid;

  @override
  String toString() {
    return 'CreateRoomEvent.onLoadUsers(authUserUuid: $authUserUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadUsersEvent &&
            (identical(other.authUserUuid, authUserUuid) ||
                other.authUserUuid == authUserUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authUserUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadUsersEventCopyWith<_$OnLoadUsersEvent> get copyWith =>
      __$$OnLoadUsersEventCopyWithImpl<_$OnLoadUsersEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authUserUuid) onLoadUsers,
    required TResult Function(String userUuid) onCreateRoom,
  }) {
    return onLoadUsers(authUserUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String authUserUuid)? onLoadUsers,
    TResult? Function(String userUuid)? onCreateRoom,
  }) {
    return onLoadUsers?.call(authUserUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String authUserUuid)? onLoadUsers,
    TResult Function(String userUuid)? onCreateRoom,
    required TResult orElse(),
  }) {
    if (onLoadUsers != null) {
      return onLoadUsers(authUserUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadUsersEvent value) onLoadUsers,
    required TResult Function(OnCreateRoomEvent value) onCreateRoom,
  }) {
    return onLoadUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadUsersEvent value)? onLoadUsers,
    TResult? Function(OnCreateRoomEvent value)? onCreateRoom,
  }) {
    return onLoadUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadUsersEvent value)? onLoadUsers,
    TResult Function(OnCreateRoomEvent value)? onCreateRoom,
    required TResult orElse(),
  }) {
    if (onLoadUsers != null) {
      return onLoadUsers(this);
    }
    return orElse();
  }
}

abstract class OnLoadUsersEvent implements CreateRoomEvent {
  const factory OnLoadUsersEvent(final String authUserUuid) =
      _$OnLoadUsersEvent;

  String get authUserUuid;
  @JsonKey(ignore: true)
  _$$OnLoadUsersEventCopyWith<_$OnLoadUsersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnCreateRoomEventCopyWith<$Res> {
  factory _$$OnCreateRoomEventCopyWith(
          _$OnCreateRoomEvent value, $Res Function(_$OnCreateRoomEvent) then) =
      __$$OnCreateRoomEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String userUuid});
}

/// @nodoc
class __$$OnCreateRoomEventCopyWithImpl<$Res>
    extends _$CreateRoomEventCopyWithImpl<$Res, _$OnCreateRoomEvent>
    implements _$$OnCreateRoomEventCopyWith<$Res> {
  __$$OnCreateRoomEventCopyWithImpl(
      _$OnCreateRoomEvent _value, $Res Function(_$OnCreateRoomEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUuid = null,
  }) {
    return _then(_$OnCreateRoomEvent(
      null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnCreateRoomEvent implements OnCreateRoomEvent {
  const _$OnCreateRoomEvent(this.userUuid);

  @override
  final String userUuid;

  @override
  String toString() {
    return 'CreateRoomEvent.onCreateRoom(userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnCreateRoomEvent &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnCreateRoomEventCopyWith<_$OnCreateRoomEvent> get copyWith =>
      __$$OnCreateRoomEventCopyWithImpl<_$OnCreateRoomEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authUserUuid) onLoadUsers,
    required TResult Function(String userUuid) onCreateRoom,
  }) {
    return onCreateRoom(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String authUserUuid)? onLoadUsers,
    TResult? Function(String userUuid)? onCreateRoom,
  }) {
    return onCreateRoom?.call(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String authUserUuid)? onLoadUsers,
    TResult Function(String userUuid)? onCreateRoom,
    required TResult orElse(),
  }) {
    if (onCreateRoom != null) {
      return onCreateRoom(userUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadUsersEvent value) onLoadUsers,
    required TResult Function(OnCreateRoomEvent value) onCreateRoom,
  }) {
    return onCreateRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadUsersEvent value)? onLoadUsers,
    TResult? Function(OnCreateRoomEvent value)? onCreateRoom,
  }) {
    return onCreateRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadUsersEvent value)? onLoadUsers,
    TResult Function(OnCreateRoomEvent value)? onCreateRoom,
    required TResult orElse(),
  }) {
    if (onCreateRoom != null) {
      return onCreateRoom(this);
    }
    return orElse();
  }
}

abstract class OnCreateRoomEvent implements CreateRoomEvent {
  const factory OnCreateRoomEvent(final String userUuid) = _$OnCreateRoomEvent;

  String get userUuid;
  @JsonKey(ignore: true)
  _$$OnCreateRoomEventCopyWith<_$OnCreateRoomEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateRoomState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get authUserUuid => throw _privateConstructorUsedError;
  String get roomCreatedId => throw _privateConstructorUsedError;
  List<UserBO> get users => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateRoomStateCopyWith<CreateRoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRoomStateCopyWith<$Res> {
  factory $CreateRoomStateCopyWith(
          CreateRoomState value, $Res Function(CreateRoomState) then) =
      _$CreateRoomStateCopyWithImpl<$Res, CreateRoomState>;
  @useResult
  $Res call(
      {bool isLoading,
      String authUserUuid,
      String roomCreatedId,
      List<UserBO> users,
      String? errorMessage});
}

/// @nodoc
class _$CreateRoomStateCopyWithImpl<$Res, $Val extends CreateRoomState>
    implements $CreateRoomStateCopyWith<$Res> {
  _$CreateRoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? authUserUuid = null,
    Object? roomCreatedId = null,
    Object? users = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      authUserUuid: null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
      roomCreatedId: null == roomCreatedId
          ? _value.roomCreatedId
          : roomCreatedId // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserBO>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateRoomStateCopyWith<$Res>
    implements $CreateRoomStateCopyWith<$Res> {
  factory _$$_CreateRoomStateCopyWith(
          _$_CreateRoomState value, $Res Function(_$_CreateRoomState) then) =
      __$$_CreateRoomStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String authUserUuid,
      String roomCreatedId,
      List<UserBO> users,
      String? errorMessage});
}

/// @nodoc
class __$$_CreateRoomStateCopyWithImpl<$Res>
    extends _$CreateRoomStateCopyWithImpl<$Res, _$_CreateRoomState>
    implements _$$_CreateRoomStateCopyWith<$Res> {
  __$$_CreateRoomStateCopyWithImpl(
      _$_CreateRoomState _value, $Res Function(_$_CreateRoomState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? authUserUuid = null,
    Object? roomCreatedId = null,
    Object? users = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_CreateRoomState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      authUserUuid: null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
      roomCreatedId: null == roomCreatedId
          ? _value.roomCreatedId
          : roomCreatedId // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserBO>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CreateRoomState implements _CreateRoomState {
  const _$_CreateRoomState(
      {this.isLoading = false,
      this.authUserUuid = "",
      this.roomCreatedId = "",
      final List<UserBO> users = const [],
      this.errorMessage})
      : _users = users;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String authUserUuid;
  @override
  @JsonKey()
  final String roomCreatedId;
  final List<UserBO> _users;
  @override
  @JsonKey()
  List<UserBO> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CreateRoomState(isLoading: $isLoading, authUserUuid: $authUserUuid, roomCreatedId: $roomCreatedId, users: $users, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateRoomState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.authUserUuid, authUserUuid) ||
                other.authUserUuid == authUserUuid) &&
            (identical(other.roomCreatedId, roomCreatedId) ||
                other.roomCreatedId == roomCreatedId) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, authUserUuid,
      roomCreatedId, const DeepCollectionEquality().hash(_users), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateRoomStateCopyWith<_$_CreateRoomState> get copyWith =>
      __$$_CreateRoomStateCopyWithImpl<_$_CreateRoomState>(this, _$identity);
}

abstract class _CreateRoomState implements CreateRoomState {
  const factory _CreateRoomState(
      {final bool isLoading,
      final String authUserUuid,
      final String roomCreatedId,
      final List<UserBO> users,
      final String? errorMessage}) = _$_CreateRoomState;

  @override
  bool get isLoading;
  @override
  String get authUserUuid;
  @override
  String get roomCreatedId;
  @override
  List<UserBO> get users;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CreateRoomStateCopyWith<_$_CreateRoomState> get copyWith =>
      throw _privateConstructorUsedError;
}
