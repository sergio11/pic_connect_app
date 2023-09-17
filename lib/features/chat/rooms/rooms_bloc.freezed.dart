// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rooms_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomsEvent {
  String get authUserUuid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authUserUuid) onLoadUserRooms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String authUserUuid)? onLoadUserRooms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String authUserUuid)? onLoadUserRooms,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadUserRoomsEvent value) onLoadUserRooms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadUserRoomsEvent value)? onLoadUserRooms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadUserRoomsEvent value)? onLoadUserRooms,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomsEventCopyWith<RoomsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomsEventCopyWith<$Res> {
  factory $RoomsEventCopyWith(
          RoomsEvent value, $Res Function(RoomsEvent) then) =
      _$RoomsEventCopyWithImpl<$Res, RoomsEvent>;
  @useResult
  $Res call({String authUserUuid});
}

/// @nodoc
class _$RoomsEventCopyWithImpl<$Res, $Val extends RoomsEvent>
    implements $RoomsEventCopyWith<$Res> {
  _$RoomsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUserUuid = null,
  }) {
    return _then(_value.copyWith(
      authUserUuid: null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnLoadUserRoomsEventCopyWith<$Res>
    implements $RoomsEventCopyWith<$Res> {
  factory _$$OnLoadUserRoomsEventCopyWith(_$OnLoadUserRoomsEvent value,
          $Res Function(_$OnLoadUserRoomsEvent) then) =
      __$$OnLoadUserRoomsEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String authUserUuid});
}

/// @nodoc
class __$$OnLoadUserRoomsEventCopyWithImpl<$Res>
    extends _$RoomsEventCopyWithImpl<$Res, _$OnLoadUserRoomsEvent>
    implements _$$OnLoadUserRoomsEventCopyWith<$Res> {
  __$$OnLoadUserRoomsEventCopyWithImpl(_$OnLoadUserRoomsEvent _value,
      $Res Function(_$OnLoadUserRoomsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUserUuid = null,
  }) {
    return _then(_$OnLoadUserRoomsEvent(
      null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnLoadUserRoomsEvent implements OnLoadUserRoomsEvent {
  const _$OnLoadUserRoomsEvent(this.authUserUuid);

  @override
  final String authUserUuid;

  @override
  String toString() {
    return 'RoomsEvent.onLoadUserRooms(authUserUuid: $authUserUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadUserRoomsEvent &&
            (identical(other.authUserUuid, authUserUuid) ||
                other.authUserUuid == authUserUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authUserUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadUserRoomsEventCopyWith<_$OnLoadUserRoomsEvent> get copyWith =>
      __$$OnLoadUserRoomsEventCopyWithImpl<_$OnLoadUserRoomsEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authUserUuid) onLoadUserRooms,
  }) {
    return onLoadUserRooms(authUserUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String authUserUuid)? onLoadUserRooms,
  }) {
    return onLoadUserRooms?.call(authUserUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String authUserUuid)? onLoadUserRooms,
    required TResult orElse(),
  }) {
    if (onLoadUserRooms != null) {
      return onLoadUserRooms(authUserUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadUserRoomsEvent value) onLoadUserRooms,
  }) {
    return onLoadUserRooms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadUserRoomsEvent value)? onLoadUserRooms,
  }) {
    return onLoadUserRooms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadUserRoomsEvent value)? onLoadUserRooms,
    required TResult orElse(),
  }) {
    if (onLoadUserRooms != null) {
      return onLoadUserRooms(this);
    }
    return orElse();
  }
}

abstract class OnLoadUserRoomsEvent implements RoomsEvent {
  const factory OnLoadUserRoomsEvent(final String authUserUuid) =
      _$OnLoadUserRoomsEvent;

  @override
  String get authUserUuid;
  @override
  @JsonKey(ignore: true)
  _$$OnLoadUserRoomsEventCopyWith<_$OnLoadUserRoomsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RoomsState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get authUserUuid => throw _privateConstructorUsedError;
  List<RoomBO> get rooms => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomsStateCopyWith<RoomsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomsStateCopyWith<$Res> {
  factory $RoomsStateCopyWith(
          RoomsState value, $Res Function(RoomsState) then) =
      _$RoomsStateCopyWithImpl<$Res, RoomsState>;
  @useResult
  $Res call(
      {bool isLoading,
      String authUserUuid,
      List<RoomBO> rooms,
      String? errorMessage});
}

/// @nodoc
class _$RoomsStateCopyWithImpl<$Res, $Val extends RoomsState>
    implements $RoomsStateCopyWith<$Res> {
  _$RoomsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? authUserUuid = null,
    Object? rooms = null,
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
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomBO>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoomsStateCopyWith<$Res>
    implements $RoomsStateCopyWith<$Res> {
  factory _$$_RoomsStateCopyWith(
          _$_RoomsState value, $Res Function(_$_RoomsState) then) =
      __$$_RoomsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String authUserUuid,
      List<RoomBO> rooms,
      String? errorMessage});
}

/// @nodoc
class __$$_RoomsStateCopyWithImpl<$Res>
    extends _$RoomsStateCopyWithImpl<$Res, _$_RoomsState>
    implements _$$_RoomsStateCopyWith<$Res> {
  __$$_RoomsStateCopyWithImpl(
      _$_RoomsState _value, $Res Function(_$_RoomsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? authUserUuid = null,
    Object? rooms = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_RoomsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      authUserUuid: null == authUserUuid
          ? _value.authUserUuid
          : authUserUuid // ignore: cast_nullable_to_non_nullable
              as String,
      rooms: null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomBO>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RoomsState implements _RoomsState {
  const _$_RoomsState(
      {this.isLoading = false,
      this.authUserUuid = "",
      final List<RoomBO> rooms = const [],
      this.errorMessage})
      : _rooms = rooms;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String authUserUuid;
  final List<RoomBO> _rooms;
  @override
  @JsonKey()
  List<RoomBO> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'RoomsState(isLoading: $isLoading, authUserUuid: $authUserUuid, rooms: $rooms, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.authUserUuid, authUserUuid) ||
                other.authUserUuid == authUserUuid) &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, authUserUuid,
      const DeepCollectionEquality().hash(_rooms), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomsStateCopyWith<_$_RoomsState> get copyWith =>
      __$$_RoomsStateCopyWithImpl<_$_RoomsState>(this, _$identity);
}

abstract class _RoomsState implements RoomsState {
  const factory _RoomsState(
      {final bool isLoading,
      final String authUserUuid,
      final List<RoomBO> rooms,
      final String? errorMessage}) = _$_RoomsState;

  @override
  bool get isLoading;
  @override
  String get authUserUuid;
  @override
  List<RoomBO> get rooms;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_RoomsStateCopyWith<_$_RoomsState> get copyWith =>
      throw _privateConstructorUsedError;
}
