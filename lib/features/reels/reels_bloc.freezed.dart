// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reels_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReelsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTopReels value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTopReels value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTopReels value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReelsEventCopyWith<$Res> {
  factory $ReelsEventCopyWith(
          ReelsEvent value, $Res Function(ReelsEvent) then) =
      _$ReelsEventCopyWithImpl<$Res, ReelsEvent>;
}

/// @nodoc
class _$ReelsEventCopyWithImpl<$Res, $Val extends ReelsEvent>
    implements $ReelsEventCopyWith<$Res> {
  _$ReelsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnLoadTopReelsCopyWith<$Res> {
  factory _$$OnLoadTopReelsCopyWith(
          _$OnLoadTopReels value, $Res Function(_$OnLoadTopReels) then) =
      __$$OnLoadTopReelsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnLoadTopReelsCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$OnLoadTopReels>
    implements _$$OnLoadTopReelsCopyWith<$Res> {
  __$$OnLoadTopReelsCopyWithImpl(
      _$OnLoadTopReels _value, $Res Function(_$OnLoadTopReels) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnLoadTopReels implements OnLoadTopReels {
  const _$OnLoadTopReels();

  @override
  String toString() {
    return 'ReelsEvent.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnLoadTopReels);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTopReels value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTopReels value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTopReels value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class OnLoadTopReels implements ReelsEvent {
  const factory OnLoadTopReels() = _$OnLoadTopReels;
}

/// @nodoc
mixin _$ReelsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<PostBO> get topReels => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReelsStateCopyWith<ReelsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReelsStateCopyWith<$Res> {
  factory $ReelsStateCopyWith(
          ReelsState value, $Res Function(ReelsState) then) =
      _$ReelsStateCopyWithImpl<$Res, ReelsState>;
  @useResult
  $Res call({bool isLoading, List<PostBO> topReels, String? errorMessage});
}

/// @nodoc
class _$ReelsStateCopyWithImpl<$Res, $Val extends ReelsState>
    implements $ReelsStateCopyWith<$Res> {
  _$ReelsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? topReels = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      topReels: null == topReels
          ? _value.topReels
          : topReels // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReelsStateCopyWith<$Res>
    implements $ReelsStateCopyWith<$Res> {
  factory _$$_ReelsStateCopyWith(
          _$_ReelsState value, $Res Function(_$_ReelsState) then) =
      __$$_ReelsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<PostBO> topReels, String? errorMessage});
}

/// @nodoc
class __$$_ReelsStateCopyWithImpl<$Res>
    extends _$ReelsStateCopyWithImpl<$Res, _$_ReelsState>
    implements _$$_ReelsStateCopyWith<$Res> {
  __$$_ReelsStateCopyWithImpl(
      _$_ReelsState _value, $Res Function(_$_ReelsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? topReels = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ReelsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      topReels: null == topReels
          ? _value._topReels
          : topReels // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ReelsState implements _ReelsState {
  const _$_ReelsState(
      {this.isLoading = false,
      final List<PostBO> topReels = const [],
      this.errorMessage})
      : _topReels = topReels;

  @override
  @JsonKey()
  final bool isLoading;
  final List<PostBO> _topReels;
  @override
  @JsonKey()
  List<PostBO> get topReels {
    if (_topReels is EqualUnmodifiableListView) return _topReels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topReels);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ReelsState(isLoading: $isLoading, topReels: $topReels, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReelsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._topReels, _topReels) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_topReels), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReelsStateCopyWith<_$_ReelsState> get copyWith =>
      __$$_ReelsStateCopyWithImpl<_$_ReelsState>(this, _$identity);
}

abstract class _ReelsState implements ReelsState {
  const factory _ReelsState(
      {final bool isLoading,
      final List<PostBO> topReels,
      final String? errorMessage}) = _$_ReelsState;

  @override
  bool get isLoading;
  @override
  List<PostBO> get topReels;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ReelsStateCopyWith<_$_ReelsState> get copyWith =>
      throw _privateConstructorUsedError;
}
