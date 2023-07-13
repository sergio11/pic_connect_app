// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadLastPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadLastPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadLastPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadLastPostsEvent value) loadLastPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadLastPostsEvent value)? loadLastPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadLastPostsEvent value)? loadLastPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedEventCopyWith<$Res> {
  factory $FeedEventCopyWith(FeedEvent value, $Res Function(FeedEvent) then) =
      _$FeedEventCopyWithImpl<$Res, FeedEvent>;
}

/// @nodoc
class _$FeedEventCopyWithImpl<$Res, $Val extends FeedEvent>
    implements $FeedEventCopyWith<$Res> {
  _$FeedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnLoadLastPostsEventCopyWith<$Res> {
  factory _$$OnLoadLastPostsEventCopyWith(_$OnLoadLastPostsEvent value,
          $Res Function(_$OnLoadLastPostsEvent) then) =
      __$$OnLoadLastPostsEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnLoadLastPostsEventCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$OnLoadLastPostsEvent>
    implements _$$OnLoadLastPostsEventCopyWith<$Res> {
  __$$OnLoadLastPostsEventCopyWithImpl(_$OnLoadLastPostsEvent _value,
      $Res Function(_$OnLoadLastPostsEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnLoadLastPostsEvent implements OnLoadLastPostsEvent {
  const _$OnLoadLastPostsEvent();

  @override
  String toString() {
    return 'FeedEvent.loadLastPosts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnLoadLastPostsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadLastPosts,
  }) {
    return loadLastPosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadLastPosts,
  }) {
    return loadLastPosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadLastPosts,
    required TResult orElse(),
  }) {
    if (loadLastPosts != null) {
      return loadLastPosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadLastPostsEvent value) loadLastPosts,
  }) {
    return loadLastPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadLastPostsEvent value)? loadLastPosts,
  }) {
    return loadLastPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadLastPostsEvent value)? loadLastPosts,
    required TResult orElse(),
  }) {
    if (loadLastPosts != null) {
      return loadLastPosts(this);
    }
    return orElse();
  }
}

abstract class OnLoadLastPostsEvent implements FeedEvent {
  const factory OnLoadLastPostsEvent() = _$OnLoadLastPostsEvent;
}

/// @nodoc
mixin _$FeedState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedStateCopyWith<FeedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedStateCopyWith<$Res> {
  factory $FeedStateCopyWith(FeedState value, $Res Function(FeedState) then) =
      _$FeedStateCopyWithImpl<$Res, FeedState>;
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class _$FeedStateCopyWithImpl<$Res, $Val extends FeedState>
    implements $FeedStateCopyWith<$Res> {
  _$FeedStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_FeedStateCopyWith<$Res> implements $FeedStateCopyWith<$Res> {
  factory _$$_FeedStateCopyWith(
          _$_FeedState value, $Res Function(_$_FeedState) then) =
      __$$_FeedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$_FeedStateCopyWithImpl<$Res>
    extends _$FeedStateCopyWithImpl<$Res, _$_FeedState>
    implements _$$_FeedStateCopyWith<$Res> {
  __$$_FeedStateCopyWithImpl(
      _$_FeedState _value, $Res Function(_$_FeedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_FeedState(
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

class _$_FeedState implements _FeedState {
  const _$_FeedState({this.isLoading = false, this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'FeedState(isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedState &&
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
  _$$_FeedStateCopyWith<_$_FeedState> get copyWith =>
      __$$_FeedStateCopyWithImpl<_$_FeedState>(this, _$identity);
}

abstract class _FeedState implements FeedState {
  const factory _FeedState({final bool isLoading, final String? errorMessage}) =
      _$_FeedState;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_FeedStateCopyWith<_$_FeedState> get copyWith =>
      throw _privateConstructorUsedError;
}
