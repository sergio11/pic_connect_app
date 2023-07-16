// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommentsEvent {
  String get postId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) loadCommentsByPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId)? loadCommentsByPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? loadCommentsByPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadCommentsByPostEvent value)
        loadCommentsByPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadCommentsByPostEvent value)? loadCommentsByPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadCommentsByPostEvent value)? loadCommentsByPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsEventCopyWith<CommentsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsEventCopyWith<$Res> {
  factory $CommentsEventCopyWith(
          CommentsEvent value, $Res Function(CommentsEvent) then) =
      _$CommentsEventCopyWithImpl<$Res, CommentsEvent>;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class _$CommentsEventCopyWithImpl<$Res, $Val extends CommentsEvent>
    implements $CommentsEventCopyWith<$Res> {
  _$CommentsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnLoadCommentsByPostEventCopyWith<$Res>
    implements $CommentsEventCopyWith<$Res> {
  factory _$$OnLoadCommentsByPostEventCopyWith(
          _$OnLoadCommentsByPostEvent value,
          $Res Function(_$OnLoadCommentsByPostEvent) then) =
      __$$OnLoadCommentsByPostEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$OnLoadCommentsByPostEventCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$OnLoadCommentsByPostEvent>
    implements _$$OnLoadCommentsByPostEventCopyWith<$Res> {
  __$$OnLoadCommentsByPostEventCopyWithImpl(_$OnLoadCommentsByPostEvent _value,
      $Res Function(_$OnLoadCommentsByPostEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_$OnLoadCommentsByPostEvent(
      null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnLoadCommentsByPostEvent implements OnLoadCommentsByPostEvent {
  const _$OnLoadCommentsByPostEvent(this.postId);

  @override
  final String postId;

  @override
  String toString() {
    return 'CommentsEvent.loadCommentsByPost(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadCommentsByPostEvent &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadCommentsByPostEventCopyWith<_$OnLoadCommentsByPostEvent>
      get copyWith => __$$OnLoadCommentsByPostEventCopyWithImpl<
          _$OnLoadCommentsByPostEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) loadCommentsByPost,
  }) {
    return loadCommentsByPost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId)? loadCommentsByPost,
  }) {
    return loadCommentsByPost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? loadCommentsByPost,
    required TResult orElse(),
  }) {
    if (loadCommentsByPost != null) {
      return loadCommentsByPost(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadCommentsByPostEvent value)
        loadCommentsByPost,
  }) {
    return loadCommentsByPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadCommentsByPostEvent value)? loadCommentsByPost,
  }) {
    return loadCommentsByPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadCommentsByPostEvent value)? loadCommentsByPost,
    required TResult orElse(),
  }) {
    if (loadCommentsByPost != null) {
      return loadCommentsByPost(this);
    }
    return orElse();
  }
}

abstract class OnLoadCommentsByPostEvent implements CommentsEvent {
  const factory OnLoadCommentsByPostEvent(final String postId) =
      _$OnLoadCommentsByPostEvent;

  @override
  String get postId;
  @override
  @JsonKey(ignore: true)
  _$$OnLoadCommentsByPostEventCopyWith<_$OnLoadCommentsByPostEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CommentsState {
  List<CommentBO> get commentsByPost => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsStateCopyWith<CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsStateCopyWith<$Res> {
  factory $CommentsStateCopyWith(
          CommentsState value, $Res Function(CommentsState) then) =
      _$CommentsStateCopyWithImpl<$Res, CommentsState>;
  @useResult
  $Res call(
      {List<CommentBO> commentsByPost, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$CommentsStateCopyWithImpl<$Res, $Val extends CommentsState>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentsByPost = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      commentsByPost: null == commentsByPost
          ? _value.commentsByPost
          : commentsByPost // ignore: cast_nullable_to_non_nullable
              as List<CommentBO>,
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
abstract class _$$_CommentsStateCopyWith<$Res>
    implements $CommentsStateCopyWith<$Res> {
  factory _$$_CommentsStateCopyWith(
          _$_CommentsState value, $Res Function(_$_CommentsState) then) =
      __$$_CommentsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CommentBO> commentsByPost, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$_CommentsStateCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$_CommentsState>
    implements _$$_CommentsStateCopyWith<$Res> {
  __$$_CommentsStateCopyWithImpl(
      _$_CommentsState _value, $Res Function(_$_CommentsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentsByPost = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_CommentsState(
      commentsByPost: null == commentsByPost
          ? _value._commentsByPost
          : commentsByPost // ignore: cast_nullable_to_non_nullable
              as List<CommentBO>,
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

class _$_CommentsState implements _CommentsState {
  const _$_CommentsState(
      {final List<CommentBO> commentsByPost = const [],
      this.isLoading = false,
      this.errorMessage})
      : _commentsByPost = commentsByPost;

  final List<CommentBO> _commentsByPost;
  @override
  @JsonKey()
  List<CommentBO> get commentsByPost {
    if (_commentsByPost is EqualUnmodifiableListView) return _commentsByPost;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentsByPost);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CommentsState(commentsByPost: $commentsByPost, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentsState &&
            const DeepCollectionEquality()
                .equals(other._commentsByPost, _commentsByPost) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_commentsByPost),
      isLoading,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentsStateCopyWith<_$_CommentsState> get copyWith =>
      __$$_CommentsStateCopyWithImpl<_$_CommentsState>(this, _$identity);
}

abstract class _CommentsState implements CommentsState {
  const factory _CommentsState(
      {final List<CommentBO> commentsByPost,
      final bool isLoading,
      final String? errorMessage}) = _$_CommentsState;

  @override
  List<CommentBO> get commentsByPost;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CommentsStateCopyWith<_$_CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
