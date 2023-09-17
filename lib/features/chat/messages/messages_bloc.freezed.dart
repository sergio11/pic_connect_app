// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessagesEvent {
  String get roomUuid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomUuid) onLoadMessagesOfRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomUuid)? onLoadMessagesOfRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomUuid)? onLoadMessagesOfRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadMessagesOfRoomEvent value)
        onLoadMessagesOfRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadMessagesOfRoomEvent value)? onLoadMessagesOfRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadMessagesOfRoomEvent value)? onLoadMessagesOfRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessagesEventCopyWith<MessagesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesEventCopyWith<$Res> {
  factory $MessagesEventCopyWith(
          MessagesEvent value, $Res Function(MessagesEvent) then) =
      _$MessagesEventCopyWithImpl<$Res, MessagesEvent>;
  @useResult
  $Res call({String roomUuid});
}

/// @nodoc
class _$MessagesEventCopyWithImpl<$Res, $Val extends MessagesEvent>
    implements $MessagesEventCopyWith<$Res> {
  _$MessagesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomUuid = null,
  }) {
    return _then(_value.copyWith(
      roomUuid: null == roomUuid
          ? _value.roomUuid
          : roomUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnLoadMessagesOfRoomEventCopyWith<$Res>
    implements $MessagesEventCopyWith<$Res> {
  factory _$$OnLoadMessagesOfRoomEventCopyWith(
          _$OnLoadMessagesOfRoomEvent value,
          $Res Function(_$OnLoadMessagesOfRoomEvent) then) =
      __$$OnLoadMessagesOfRoomEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roomUuid});
}

/// @nodoc
class __$$OnLoadMessagesOfRoomEventCopyWithImpl<$Res>
    extends _$MessagesEventCopyWithImpl<$Res, _$OnLoadMessagesOfRoomEvent>
    implements _$$OnLoadMessagesOfRoomEventCopyWith<$Res> {
  __$$OnLoadMessagesOfRoomEventCopyWithImpl(_$OnLoadMessagesOfRoomEvent _value,
      $Res Function(_$OnLoadMessagesOfRoomEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomUuid = null,
  }) {
    return _then(_$OnLoadMessagesOfRoomEvent(
      null == roomUuid
          ? _value.roomUuid
          : roomUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnLoadMessagesOfRoomEvent implements OnLoadMessagesOfRoomEvent {
  const _$OnLoadMessagesOfRoomEvent(this.roomUuid);

  @override
  final String roomUuid;

  @override
  String toString() {
    return 'MessagesEvent.onLoadMessagesOfRoom(roomUuid: $roomUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadMessagesOfRoomEvent &&
            (identical(other.roomUuid, roomUuid) ||
                other.roomUuid == roomUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadMessagesOfRoomEventCopyWith<_$OnLoadMessagesOfRoomEvent>
      get copyWith => __$$OnLoadMessagesOfRoomEventCopyWithImpl<
          _$OnLoadMessagesOfRoomEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomUuid) onLoadMessagesOfRoom,
  }) {
    return onLoadMessagesOfRoom(roomUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomUuid)? onLoadMessagesOfRoom,
  }) {
    return onLoadMessagesOfRoom?.call(roomUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomUuid)? onLoadMessagesOfRoom,
    required TResult orElse(),
  }) {
    if (onLoadMessagesOfRoom != null) {
      return onLoadMessagesOfRoom(roomUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadMessagesOfRoomEvent value)
        onLoadMessagesOfRoom,
  }) {
    return onLoadMessagesOfRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadMessagesOfRoomEvent value)? onLoadMessagesOfRoom,
  }) {
    return onLoadMessagesOfRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadMessagesOfRoomEvent value)? onLoadMessagesOfRoom,
    required TResult orElse(),
  }) {
    if (onLoadMessagesOfRoom != null) {
      return onLoadMessagesOfRoom(this);
    }
    return orElse();
  }
}

abstract class OnLoadMessagesOfRoomEvent implements MessagesEvent {
  const factory OnLoadMessagesOfRoomEvent(final String roomUuid) =
      _$OnLoadMessagesOfRoomEvent;

  @override
  String get roomUuid;
  @override
  @JsonKey(ignore: true)
  _$$OnLoadMessagesOfRoomEventCopyWith<_$OnLoadMessagesOfRoomEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MessagesState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessagesStateCopyWith<MessagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesStateCopyWith<$Res> {
  factory $MessagesStateCopyWith(
          MessagesState value, $Res Function(MessagesState) then) =
      _$MessagesStateCopyWithImpl<$Res, MessagesState>;
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class _$MessagesStateCopyWithImpl<$Res, $Val extends MessagesState>
    implements $MessagesStateCopyWith<$Res> {
  _$MessagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessagesStateCopyWith<$Res>
    implements $MessagesStateCopyWith<$Res> {
  factory _$$_MessagesStateCopyWith(
          _$_MessagesState value, $Res Function(_$_MessagesState) then) =
      __$$_MessagesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$_MessagesStateCopyWithImpl<$Res>
    extends _$MessagesStateCopyWithImpl<$Res, _$_MessagesState>
    implements _$$_MessagesStateCopyWith<$Res> {
  __$$_MessagesStateCopyWithImpl(
      _$_MessagesState _value, $Res Function(_$_MessagesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_MessagesState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MessagesState implements _MessagesState {
  const _$_MessagesState({this.isLoading = false, this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'MessagesState(isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessagesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessagesStateCopyWith<_$_MessagesState> get copyWith =>
      __$$_MessagesStateCopyWithImpl<_$_MessagesState>(this, _$identity);
}

abstract class _MessagesState implements MessagesState {
  const factory _MessagesState(
      {final bool isLoading, final String? errorMessage}) = _$_MessagesState;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_MessagesStateCopyWith<_$_MessagesState> get copyWith =>
      throw _privateConstructorUsedError;
}
