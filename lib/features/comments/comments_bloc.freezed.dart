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
    required TResult Function(String postId, String authUserUid)
        loadCommentsByPost,
    required TResult Function(String postId, String text) publishComment,
    required TResult Function(String postId) refreshCommentsByPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId, String authUserUid)? loadCommentsByPost,
    TResult? Function(String postId, String text)? publishComment,
    TResult? Function(String postId)? refreshCommentsByPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId, String authUserUid)? loadCommentsByPost,
    TResult Function(String postId, String text)? publishComment,
    TResult Function(String postId)? refreshCommentsByPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadCommentsByPostEvent value)
        loadCommentsByPost,
    required TResult Function(OnPublishCommentEvent value) publishComment,
    required TResult Function(OnRefreshCommentsEvent value)
        refreshCommentsByPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadCommentsByPostEvent value)? loadCommentsByPost,
    TResult? Function(OnPublishCommentEvent value)? publishComment,
    TResult? Function(OnRefreshCommentsEvent value)? refreshCommentsByPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadCommentsByPostEvent value)? loadCommentsByPost,
    TResult Function(OnPublishCommentEvent value)? publishComment,
    TResult Function(OnRefreshCommentsEvent value)? refreshCommentsByPost,
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
  $Res call({String postId, String authUserUid});
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
    Object? authUserUid = null,
  }) {
    return _then(_$OnLoadCommentsByPostEvent(
      null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      null == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnLoadCommentsByPostEvent implements OnLoadCommentsByPostEvent {
  const _$OnLoadCommentsByPostEvent(this.postId, this.authUserUid);

  @override
  final String postId;
  @override
  final String authUserUid;

  @override
  String toString() {
    return 'CommentsEvent.loadCommentsByPost(postId: $postId, authUserUid: $authUserUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadCommentsByPostEvent &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.authUserUid, authUserUid) ||
                other.authUserUid == authUserUid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId, authUserUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadCommentsByPostEventCopyWith<_$OnLoadCommentsByPostEvent>
      get copyWith => __$$OnLoadCommentsByPostEventCopyWithImpl<
          _$OnLoadCommentsByPostEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId, String authUserUid)
        loadCommentsByPost,
    required TResult Function(String postId, String text) publishComment,
    required TResult Function(String postId) refreshCommentsByPost,
  }) {
    return loadCommentsByPost(postId, authUserUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId, String authUserUid)? loadCommentsByPost,
    TResult? Function(String postId, String text)? publishComment,
    TResult? Function(String postId)? refreshCommentsByPost,
  }) {
    return loadCommentsByPost?.call(postId, authUserUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId, String authUserUid)? loadCommentsByPost,
    TResult Function(String postId, String text)? publishComment,
    TResult Function(String postId)? refreshCommentsByPost,
    required TResult orElse(),
  }) {
    if (loadCommentsByPost != null) {
      return loadCommentsByPost(postId, authUserUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadCommentsByPostEvent value)
        loadCommentsByPost,
    required TResult Function(OnPublishCommentEvent value) publishComment,
    required TResult Function(OnRefreshCommentsEvent value)
        refreshCommentsByPost,
  }) {
    return loadCommentsByPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadCommentsByPostEvent value)? loadCommentsByPost,
    TResult? Function(OnPublishCommentEvent value)? publishComment,
    TResult? Function(OnRefreshCommentsEvent value)? refreshCommentsByPost,
  }) {
    return loadCommentsByPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadCommentsByPostEvent value)? loadCommentsByPost,
    TResult Function(OnPublishCommentEvent value)? publishComment,
    TResult Function(OnRefreshCommentsEvent value)? refreshCommentsByPost,
    required TResult orElse(),
  }) {
    if (loadCommentsByPost != null) {
      return loadCommentsByPost(this);
    }
    return orElse();
  }
}

abstract class OnLoadCommentsByPostEvent implements CommentsEvent {
  const factory OnLoadCommentsByPostEvent(
          final String postId, final String authUserUid) =
      _$OnLoadCommentsByPostEvent;

  @override
  String get postId;
  String get authUserUid;
  @override
  @JsonKey(ignore: true)
  _$$OnLoadCommentsByPostEventCopyWith<_$OnLoadCommentsByPostEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnPublishCommentEventCopyWith<$Res>
    implements $CommentsEventCopyWith<$Res> {
  factory _$$OnPublishCommentEventCopyWith(_$OnPublishCommentEvent value,
          $Res Function(_$OnPublishCommentEvent) then) =
      __$$OnPublishCommentEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String postId, String text});
}

/// @nodoc
class __$$OnPublishCommentEventCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$OnPublishCommentEvent>
    implements _$$OnPublishCommentEventCopyWith<$Res> {
  __$$OnPublishCommentEventCopyWithImpl(_$OnPublishCommentEvent _value,
      $Res Function(_$OnPublishCommentEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? text = null,
  }) {
    return _then(_$OnPublishCommentEvent(
      null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnPublishCommentEvent implements OnPublishCommentEvent {
  const _$OnPublishCommentEvent(this.postId, this.text);

  @override
  final String postId;
  @override
  final String text;

  @override
  String toString() {
    return 'CommentsEvent.publishComment(postId: $postId, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnPublishCommentEvent &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnPublishCommentEventCopyWith<_$OnPublishCommentEvent> get copyWith =>
      __$$OnPublishCommentEventCopyWithImpl<_$OnPublishCommentEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId, String authUserUid)
        loadCommentsByPost,
    required TResult Function(String postId, String text) publishComment,
    required TResult Function(String postId) refreshCommentsByPost,
  }) {
    return publishComment(postId, text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId, String authUserUid)? loadCommentsByPost,
    TResult? Function(String postId, String text)? publishComment,
    TResult? Function(String postId)? refreshCommentsByPost,
  }) {
    return publishComment?.call(postId, text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId, String authUserUid)? loadCommentsByPost,
    TResult Function(String postId, String text)? publishComment,
    TResult Function(String postId)? refreshCommentsByPost,
    required TResult orElse(),
  }) {
    if (publishComment != null) {
      return publishComment(postId, text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadCommentsByPostEvent value)
        loadCommentsByPost,
    required TResult Function(OnPublishCommentEvent value) publishComment,
    required TResult Function(OnRefreshCommentsEvent value)
        refreshCommentsByPost,
  }) {
    return publishComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadCommentsByPostEvent value)? loadCommentsByPost,
    TResult? Function(OnPublishCommentEvent value)? publishComment,
    TResult? Function(OnRefreshCommentsEvent value)? refreshCommentsByPost,
  }) {
    return publishComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadCommentsByPostEvent value)? loadCommentsByPost,
    TResult Function(OnPublishCommentEvent value)? publishComment,
    TResult Function(OnRefreshCommentsEvent value)? refreshCommentsByPost,
    required TResult orElse(),
  }) {
    if (publishComment != null) {
      return publishComment(this);
    }
    return orElse();
  }
}

abstract class OnPublishCommentEvent implements CommentsEvent {
  const factory OnPublishCommentEvent(final String postId, final String text) =
      _$OnPublishCommentEvent;

  @override
  String get postId;
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$OnPublishCommentEventCopyWith<_$OnPublishCommentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnRefreshCommentsEventCopyWith<$Res>
    implements $CommentsEventCopyWith<$Res> {
  factory _$$OnRefreshCommentsEventCopyWith(_$OnRefreshCommentsEvent value,
          $Res Function(_$OnRefreshCommentsEvent) then) =
      __$$OnRefreshCommentsEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$OnRefreshCommentsEventCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$OnRefreshCommentsEvent>
    implements _$$OnRefreshCommentsEventCopyWith<$Res> {
  __$$OnRefreshCommentsEventCopyWithImpl(_$OnRefreshCommentsEvent _value,
      $Res Function(_$OnRefreshCommentsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_$OnRefreshCommentsEvent(
      null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnRefreshCommentsEvent implements OnRefreshCommentsEvent {
  const _$OnRefreshCommentsEvent(this.postId);

  @override
  final String postId;

  @override
  String toString() {
    return 'CommentsEvent.refreshCommentsByPost(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnRefreshCommentsEvent &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnRefreshCommentsEventCopyWith<_$OnRefreshCommentsEvent> get copyWith =>
      __$$OnRefreshCommentsEventCopyWithImpl<_$OnRefreshCommentsEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId, String authUserUid)
        loadCommentsByPost,
    required TResult Function(String postId, String text) publishComment,
    required TResult Function(String postId) refreshCommentsByPost,
  }) {
    return refreshCommentsByPost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String postId, String authUserUid)? loadCommentsByPost,
    TResult? Function(String postId, String text)? publishComment,
    TResult? Function(String postId)? refreshCommentsByPost,
  }) {
    return refreshCommentsByPost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId, String authUserUid)? loadCommentsByPost,
    TResult Function(String postId, String text)? publishComment,
    TResult Function(String postId)? refreshCommentsByPost,
    required TResult orElse(),
  }) {
    if (refreshCommentsByPost != null) {
      return refreshCommentsByPost(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadCommentsByPostEvent value)
        loadCommentsByPost,
    required TResult Function(OnPublishCommentEvent value) publishComment,
    required TResult Function(OnRefreshCommentsEvent value)
        refreshCommentsByPost,
  }) {
    return refreshCommentsByPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadCommentsByPostEvent value)? loadCommentsByPost,
    TResult? Function(OnPublishCommentEvent value)? publishComment,
    TResult? Function(OnRefreshCommentsEvent value)? refreshCommentsByPost,
  }) {
    return refreshCommentsByPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadCommentsByPostEvent value)? loadCommentsByPost,
    TResult Function(OnPublishCommentEvent value)? publishComment,
    TResult Function(OnRefreshCommentsEvent value)? refreshCommentsByPost,
    required TResult orElse(),
  }) {
    if (refreshCommentsByPost != null) {
      return refreshCommentsByPost(this);
    }
    return orElse();
  }
}

abstract class OnRefreshCommentsEvent implements CommentsEvent {
  const factory OnRefreshCommentsEvent(final String postId) =
      _$OnRefreshCommentsEvent;

  @override
  String get postId;
  @override
  @JsonKey(ignore: true)
  _$$OnRefreshCommentsEventCopyWith<_$OnRefreshCommentsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CommentsState {
  String get postId => throw _privateConstructorUsedError;
  String get authUserImageUrl => throw _privateConstructorUsedError;
  List<CommentBO> get commentsByPost => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPublishingComment => throw _privateConstructorUsedError;
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
      {String postId,
      String authUserImageUrl,
      List<CommentBO> commentsByPost,
      bool isLoading,
      bool isPublishingComment,
      String? errorMessage});
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
    Object? postId = null,
    Object? authUserImageUrl = null,
    Object? commentsByPost = null,
    Object? isLoading = null,
    Object? isPublishingComment = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      authUserImageUrl: null == authUserImageUrl
          ? _value.authUserImageUrl
          : authUserImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      commentsByPost: null == commentsByPost
          ? _value.commentsByPost
          : commentsByPost // ignore: cast_nullable_to_non_nullable
              as List<CommentBO>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublishingComment: null == isPublishingComment
          ? _value.isPublishingComment
          : isPublishingComment // ignore: cast_nullable_to_non_nullable
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
      {String postId,
      String authUserImageUrl,
      List<CommentBO> commentsByPost,
      bool isLoading,
      bool isPublishingComment,
      String? errorMessage});
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
    Object? postId = null,
    Object? authUserImageUrl = null,
    Object? commentsByPost = null,
    Object? isLoading = null,
    Object? isPublishingComment = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_CommentsState(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      authUserImageUrl: null == authUserImageUrl
          ? _value.authUserImageUrl
          : authUserImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      commentsByPost: null == commentsByPost
          ? _value._commentsByPost
          : commentsByPost // ignore: cast_nullable_to_non_nullable
              as List<CommentBO>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublishingComment: null == isPublishingComment
          ? _value.isPublishingComment
          : isPublishingComment // ignore: cast_nullable_to_non_nullable
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
      {this.postId = "",
      this.authUserImageUrl = "https://i.stack.imgur.com/l60Hf.png",
      final List<CommentBO> commentsByPost = const [],
      this.isLoading = false,
      this.isPublishingComment = false,
      this.errorMessage})
      : _commentsByPost = commentsByPost;

  @override
  @JsonKey()
  final String postId;
  @override
  @JsonKey()
  final String authUserImageUrl;
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
  @JsonKey()
  final bool isPublishingComment;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CommentsState(postId: $postId, authUserImageUrl: $authUserImageUrl, commentsByPost: $commentsByPost, isLoading: $isLoading, isPublishingComment: $isPublishingComment, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentsState &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.authUserImageUrl, authUserImageUrl) ||
                other.authUserImageUrl == authUserImageUrl) &&
            const DeepCollectionEquality()
                .equals(other._commentsByPost, _commentsByPost) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isPublishingComment, isPublishingComment) ||
                other.isPublishingComment == isPublishingComment) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      postId,
      authUserImageUrl,
      const DeepCollectionEquality().hash(_commentsByPost),
      isLoading,
      isPublishingComment,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentsStateCopyWith<_$_CommentsState> get copyWith =>
      __$$_CommentsStateCopyWithImpl<_$_CommentsState>(this, _$identity);
}

abstract class _CommentsState implements CommentsState {
  const factory _CommentsState(
      {final String postId,
      final String authUserImageUrl,
      final List<CommentBO> commentsByPost,
      final bool isLoading,
      final bool isPublishingComment,
      final String? errorMessage}) = _$_CommentsState;

  @override
  String get postId;
  @override
  String get authUserImageUrl;
  @override
  List<CommentBO> get commentsByPost;
  @override
  bool get isLoading;
  @override
  bool get isPublishingComment;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CommentsStateCopyWith<_$_CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
