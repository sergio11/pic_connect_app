// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostCardEvent {
  PostBO get post => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostBO post) showPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PostBO post)? showPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostBO post)? showPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnShowPostEvent value) showPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnShowPostEvent value)? showPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnShowPostEvent value)? showPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostCardEventCopyWith<PostCardEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCardEventCopyWith<$Res> {
  factory $PostCardEventCopyWith(
          PostCardEvent value, $Res Function(PostCardEvent) then) =
      _$PostCardEventCopyWithImpl<$Res, PostCardEvent>;
  @useResult
  $Res call({PostBO post});
}

/// @nodoc
class _$PostCardEventCopyWithImpl<$Res, $Val extends PostCardEvent>
    implements $PostCardEventCopyWith<$Res> {
  _$PostCardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
  }) {
    return _then(_value.copyWith(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostBO,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnShowPostEventCopyWith<$Res>
    implements $PostCardEventCopyWith<$Res> {
  factory _$$OnShowPostEventCopyWith(
          _$OnShowPostEvent value, $Res Function(_$OnShowPostEvent) then) =
      __$$OnShowPostEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PostBO post});
}

/// @nodoc
class __$$OnShowPostEventCopyWithImpl<$Res>
    extends _$PostCardEventCopyWithImpl<$Res, _$OnShowPostEvent>
    implements _$$OnShowPostEventCopyWith<$Res> {
  __$$OnShowPostEventCopyWithImpl(
      _$OnShowPostEvent _value, $Res Function(_$OnShowPostEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
  }) {
    return _then(_$OnShowPostEvent(
      null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostBO,
    ));
  }
}

/// @nodoc

class _$OnShowPostEvent implements OnShowPostEvent {
  const _$OnShowPostEvent(this.post);

  @override
  final PostBO post;

  @override
  String toString() {
    return 'PostCardEvent.showPost(post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnShowPostEvent &&
            (identical(other.post, post) || other.post == post));
  }

  @override
  int get hashCode => Object.hash(runtimeType, post);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnShowPostEventCopyWith<_$OnShowPostEvent> get copyWith =>
      __$$OnShowPostEventCopyWithImpl<_$OnShowPostEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostBO post) showPost,
  }) {
    return showPost(post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PostBO post)? showPost,
  }) {
    return showPost?.call(post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostBO post)? showPost,
    required TResult orElse(),
  }) {
    if (showPost != null) {
      return showPost(post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnShowPostEvent value) showPost,
  }) {
    return showPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnShowPostEvent value)? showPost,
  }) {
    return showPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnShowPostEvent value)? showPost,
    required TResult orElse(),
  }) {
    if (showPost != null) {
      return showPost(this);
    }
    return orElse();
  }
}

abstract class OnShowPostEvent implements PostCardEvent {
  const factory OnShowPostEvent(final PostBO post) = _$OnShowPostEvent;

  @override
  PostBO get post;
  @override
  @JsonKey(ignore: true)
  _$$OnShowPostEventCopyWith<_$OnShowPostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PostCardState {
  String? get authUserUid => throw _privateConstructorUsedError;
  PostBO? get postBO => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostCardStateCopyWith<PostCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCardStateCopyWith<$Res> {
  factory $PostCardStateCopyWith(
          PostCardState value, $Res Function(PostCardState) then) =
      _$PostCardStateCopyWithImpl<$Res, PostCardState>;
  @useResult
  $Res call({String? authUserUid, PostBO? postBO});
}

/// @nodoc
class _$PostCardStateCopyWithImpl<$Res, $Val extends PostCardState>
    implements $PostCardStateCopyWith<$Res> {
  _$PostCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUserUid = freezed,
    Object? postBO = freezed,
  }) {
    return _then(_value.copyWith(
      authUserUid: freezed == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String?,
      postBO: freezed == postBO
          ? _value.postBO
          : postBO // ignore: cast_nullable_to_non_nullable
              as PostBO?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostCardStateCopyWith<$Res>
    implements $PostCardStateCopyWith<$Res> {
  factory _$$_PostCardStateCopyWith(
          _$_PostCardState value, $Res Function(_$_PostCardState) then) =
      __$$_PostCardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? authUserUid, PostBO? postBO});
}

/// @nodoc
class __$$_PostCardStateCopyWithImpl<$Res>
    extends _$PostCardStateCopyWithImpl<$Res, _$_PostCardState>
    implements _$$_PostCardStateCopyWith<$Res> {
  __$$_PostCardStateCopyWithImpl(
      _$_PostCardState _value, $Res Function(_$_PostCardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUserUid = freezed,
    Object? postBO = freezed,
  }) {
    return _then(_$_PostCardState(
      authUserUid: freezed == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String?,
      postBO: freezed == postBO
          ? _value.postBO
          : postBO // ignore: cast_nullable_to_non_nullable
              as PostBO?,
    ));
  }
}

/// @nodoc

class _$_PostCardState implements _PostCardState {
  const _$_PostCardState({this.authUserUid, this.postBO});

  @override
  final String? authUserUid;
  @override
  final PostBO? postBO;

  @override
  String toString() {
    return 'PostCardState(authUserUid: $authUserUid, postBO: $postBO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostCardState &&
            (identical(other.authUserUid, authUserUid) ||
                other.authUserUid == authUserUid) &&
            (identical(other.postBO, postBO) || other.postBO == postBO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authUserUid, postBO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCardStateCopyWith<_$_PostCardState> get copyWith =>
      __$$_PostCardStateCopyWithImpl<_$_PostCardState>(this, _$identity);
}

abstract class _PostCardState implements PostCardState {
  const factory _PostCardState(
      {final String? authUserUid, final PostBO? postBO}) = _$_PostCardState;

  @override
  String? get authUserUid;
  @override
  PostBO? get postBO;
  @override
  @JsonKey(ignore: true)
  _$$_PostCardStateCopyWith<_$_PostCardState> get copyWith =>
      throw _privateConstructorUsedError;
}
