// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() addPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? addPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? addPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddPostEvent value) addPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddPostEvent value)? addPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddPostEvent value)? addPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPostEventCopyWith<$Res> {
  factory $AddPostEventCopyWith(
          AddPostEvent value, $Res Function(AddPostEvent) then) =
      _$AddPostEventCopyWithImpl<$Res, AddPostEvent>;
}

/// @nodoc
class _$AddPostEventCopyWithImpl<$Res, $Val extends AddPostEvent>
    implements $AddPostEventCopyWith<$Res> {
  _$AddPostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnAddPostEventCopyWith<$Res> {
  factory _$$OnAddPostEventCopyWith(
          _$OnAddPostEvent value, $Res Function(_$OnAddPostEvent) then) =
      __$$OnAddPostEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnAddPostEventCopyWithImpl<$Res>
    extends _$AddPostEventCopyWithImpl<$Res, _$OnAddPostEvent>
    implements _$$OnAddPostEventCopyWith<$Res> {
  __$$OnAddPostEventCopyWithImpl(
      _$OnAddPostEvent _value, $Res Function(_$OnAddPostEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnAddPostEvent implements OnAddPostEvent {
  const _$OnAddPostEvent();

  @override
  String toString() {
    return 'AddPostEvent.addPost()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnAddPostEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() addPost,
  }) {
    return addPost();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? addPost,
  }) {
    return addPost?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? addPost,
    required TResult orElse(),
  }) {
    if (addPost != null) {
      return addPost();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddPostEvent value) addPost,
  }) {
    return addPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddPostEvent value)? addPost,
  }) {
    return addPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddPostEvent value)? addPost,
    required TResult orElse(),
  }) {
    if (addPost != null) {
      return addPost(this);
    }
    return orElse();
  }
}

abstract class OnAddPostEvent implements AddPostEvent {
  const factory OnAddPostEvent() = _$OnAddPostEvent;
}

/// @nodoc
mixin _$AddPostState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPostStateCopyWith<AddPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPostStateCopyWith<$Res> {
  factory $AddPostStateCopyWith(
          AddPostState value, $Res Function(AddPostState) then) =
      _$AddPostStateCopyWithImpl<$Res, AddPostState>;
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class _$AddPostStateCopyWithImpl<$Res, $Val extends AddPostState>
    implements $AddPostStateCopyWith<$Res> {
  _$AddPostStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_AddPostStateCopyWith<$Res>
    implements $AddPostStateCopyWith<$Res> {
  factory _$$_AddPostStateCopyWith(
          _$_AddPostState value, $Res Function(_$_AddPostState) then) =
      __$$_AddPostStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$_AddPostStateCopyWithImpl<$Res>
    extends _$AddPostStateCopyWithImpl<$Res, _$_AddPostState>
    implements _$$_AddPostStateCopyWith<$Res> {
  __$$_AddPostStateCopyWithImpl(
      _$_AddPostState _value, $Res Function(_$_AddPostState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AddPostState(
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

class _$_AddPostState implements _AddPostState {
  const _$_AddPostState({this.isLoading = false, this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AddPostState(isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPostState &&
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
  _$$_AddPostStateCopyWith<_$_AddPostState> get copyWith =>
      __$$_AddPostStateCopyWithImpl<_$_AddPostState>(this, _$identity);
}

abstract class _AddPostState implements AddPostState {
  const factory _AddPostState(
      {final bool isLoading, final String? errorMessage}) = _$_AddPostState;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AddPostStateCopyWith<_$_AddPostState> get copyWith =>
      throw _privateConstructorUsedError;
}
