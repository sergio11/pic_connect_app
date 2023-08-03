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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostBO post, String authUserUid) showPost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) saveBookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PostBO post, String authUserUid)? showPost,
    TResult? Function(String postId)? deletePost,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? saveBookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostBO post, String authUserUid)? showPost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? saveBookmark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnShowPostEvent value) showPost,
    required TResult Function(OnDeletePostEvent value) deletePost,
    required TResult Function(OnLikePostEvent value) likePost,
    required TResult Function(OnSaveBookmarkEvent value) saveBookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnShowPostEvent value)? showPost,
    TResult? Function(OnDeletePostEvent value)? deletePost,
    TResult? Function(OnLikePostEvent value)? likePost,
    TResult? Function(OnSaveBookmarkEvent value)? saveBookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnShowPostEvent value)? showPost,
    TResult Function(OnDeletePostEvent value)? deletePost,
    TResult Function(OnLikePostEvent value)? likePost,
    TResult Function(OnSaveBookmarkEvent value)? saveBookmark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCardEventCopyWith<$Res> {
  factory $PostCardEventCopyWith(
          PostCardEvent value, $Res Function(PostCardEvent) then) =
      _$PostCardEventCopyWithImpl<$Res, PostCardEvent>;
}

/// @nodoc
class _$PostCardEventCopyWithImpl<$Res, $Val extends PostCardEvent>
    implements $PostCardEventCopyWith<$Res> {
  _$PostCardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnShowPostEventCopyWith<$Res> {
  factory _$$OnShowPostEventCopyWith(
          _$OnShowPostEvent value, $Res Function(_$OnShowPostEvent) then) =
      __$$OnShowPostEventCopyWithImpl<$Res>;
  @useResult
  $Res call({PostBO post, String authUserUid});
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
    Object? authUserUid = null,
  }) {
    return _then(_$OnShowPostEvent(
      null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostBO,
      null == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnShowPostEvent implements OnShowPostEvent {
  const _$OnShowPostEvent(this.post, this.authUserUid);

  @override
  final PostBO post;
  @override
  final String authUserUid;

  @override
  String toString() {
    return 'PostCardEvent.showPost(post: $post, authUserUid: $authUserUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnShowPostEvent &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.authUserUid, authUserUid) ||
                other.authUserUid == authUserUid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, post, authUserUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnShowPostEventCopyWith<_$OnShowPostEvent> get copyWith =>
      __$$OnShowPostEventCopyWithImpl<_$OnShowPostEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostBO post, String authUserUid) showPost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) saveBookmark,
  }) {
    return showPost(post, authUserUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PostBO post, String authUserUid)? showPost,
    TResult? Function(String postId)? deletePost,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? saveBookmark,
  }) {
    return showPost?.call(post, authUserUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostBO post, String authUserUid)? showPost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? saveBookmark,
    required TResult orElse(),
  }) {
    if (showPost != null) {
      return showPost(post, authUserUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnShowPostEvent value) showPost,
    required TResult Function(OnDeletePostEvent value) deletePost,
    required TResult Function(OnLikePostEvent value) likePost,
    required TResult Function(OnSaveBookmarkEvent value) saveBookmark,
  }) {
    return showPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnShowPostEvent value)? showPost,
    TResult? Function(OnDeletePostEvent value)? deletePost,
    TResult? Function(OnLikePostEvent value)? likePost,
    TResult? Function(OnSaveBookmarkEvent value)? saveBookmark,
  }) {
    return showPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnShowPostEvent value)? showPost,
    TResult Function(OnDeletePostEvent value)? deletePost,
    TResult Function(OnLikePostEvent value)? likePost,
    TResult Function(OnSaveBookmarkEvent value)? saveBookmark,
    required TResult orElse(),
  }) {
    if (showPost != null) {
      return showPost(this);
    }
    return orElse();
  }
}

abstract class OnShowPostEvent implements PostCardEvent {
  const factory OnShowPostEvent(final PostBO post, final String authUserUid) =
      _$OnShowPostEvent;

  PostBO get post;
  String get authUserUid;
  @JsonKey(ignore: true)
  _$$OnShowPostEventCopyWith<_$OnShowPostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnDeletePostEventCopyWith<$Res> {
  factory _$$OnDeletePostEventCopyWith(
          _$OnDeletePostEvent value, $Res Function(_$OnDeletePostEvent) then) =
      __$$OnDeletePostEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$OnDeletePostEventCopyWithImpl<$Res>
    extends _$PostCardEventCopyWithImpl<$Res, _$OnDeletePostEvent>
    implements _$$OnDeletePostEventCopyWith<$Res> {
  __$$OnDeletePostEventCopyWithImpl(
      _$OnDeletePostEvent _value, $Res Function(_$OnDeletePostEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_$OnDeletePostEvent(
      null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnDeletePostEvent implements OnDeletePostEvent {
  const _$OnDeletePostEvent(this.postId);

  @override
  final String postId;

  @override
  String toString() {
    return 'PostCardEvent.deletePost(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDeletePostEvent &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnDeletePostEventCopyWith<_$OnDeletePostEvent> get copyWith =>
      __$$OnDeletePostEventCopyWithImpl<_$OnDeletePostEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostBO post, String authUserUid) showPost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) saveBookmark,
  }) {
    return deletePost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PostBO post, String authUserUid)? showPost,
    TResult? Function(String postId)? deletePost,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? saveBookmark,
  }) {
    return deletePost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostBO post, String authUserUid)? showPost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? saveBookmark,
    required TResult orElse(),
  }) {
    if (deletePost != null) {
      return deletePost(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnShowPostEvent value) showPost,
    required TResult Function(OnDeletePostEvent value) deletePost,
    required TResult Function(OnLikePostEvent value) likePost,
    required TResult Function(OnSaveBookmarkEvent value) saveBookmark,
  }) {
    return deletePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnShowPostEvent value)? showPost,
    TResult? Function(OnDeletePostEvent value)? deletePost,
    TResult? Function(OnLikePostEvent value)? likePost,
    TResult? Function(OnSaveBookmarkEvent value)? saveBookmark,
  }) {
    return deletePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnShowPostEvent value)? showPost,
    TResult Function(OnDeletePostEvent value)? deletePost,
    TResult Function(OnLikePostEvent value)? likePost,
    TResult Function(OnSaveBookmarkEvent value)? saveBookmark,
    required TResult orElse(),
  }) {
    if (deletePost != null) {
      return deletePost(this);
    }
    return orElse();
  }
}

abstract class OnDeletePostEvent implements PostCardEvent {
  const factory OnDeletePostEvent(final String postId) = _$OnDeletePostEvent;

  String get postId;
  @JsonKey(ignore: true)
  _$$OnDeletePostEventCopyWith<_$OnDeletePostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnLikePostEventCopyWith<$Res> {
  factory _$$OnLikePostEventCopyWith(
          _$OnLikePostEvent value, $Res Function(_$OnLikePostEvent) then) =
      __$$OnLikePostEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$OnLikePostEventCopyWithImpl<$Res>
    extends _$PostCardEventCopyWithImpl<$Res, _$OnLikePostEvent>
    implements _$$OnLikePostEventCopyWith<$Res> {
  __$$OnLikePostEventCopyWithImpl(
      _$OnLikePostEvent _value, $Res Function(_$OnLikePostEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_$OnLikePostEvent(
      null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnLikePostEvent implements OnLikePostEvent {
  const _$OnLikePostEvent(this.postId);

  @override
  final String postId;

  @override
  String toString() {
    return 'PostCardEvent.likePost(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLikePostEvent &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLikePostEventCopyWith<_$OnLikePostEvent> get copyWith =>
      __$$OnLikePostEventCopyWithImpl<_$OnLikePostEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostBO post, String authUserUid) showPost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) saveBookmark,
  }) {
    return likePost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PostBO post, String authUserUid)? showPost,
    TResult? Function(String postId)? deletePost,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? saveBookmark,
  }) {
    return likePost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostBO post, String authUserUid)? showPost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? saveBookmark,
    required TResult orElse(),
  }) {
    if (likePost != null) {
      return likePost(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnShowPostEvent value) showPost,
    required TResult Function(OnDeletePostEvent value) deletePost,
    required TResult Function(OnLikePostEvent value) likePost,
    required TResult Function(OnSaveBookmarkEvent value) saveBookmark,
  }) {
    return likePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnShowPostEvent value)? showPost,
    TResult? Function(OnDeletePostEvent value)? deletePost,
    TResult? Function(OnLikePostEvent value)? likePost,
    TResult? Function(OnSaveBookmarkEvent value)? saveBookmark,
  }) {
    return likePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnShowPostEvent value)? showPost,
    TResult Function(OnDeletePostEvent value)? deletePost,
    TResult Function(OnLikePostEvent value)? likePost,
    TResult Function(OnSaveBookmarkEvent value)? saveBookmark,
    required TResult orElse(),
  }) {
    if (likePost != null) {
      return likePost(this);
    }
    return orElse();
  }
}

abstract class OnLikePostEvent implements PostCardEvent {
  const factory OnLikePostEvent(final String postId) = _$OnLikePostEvent;

  String get postId;
  @JsonKey(ignore: true)
  _$$OnLikePostEventCopyWith<_$OnLikePostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSaveBookmarkEventCopyWith<$Res> {
  factory _$$OnSaveBookmarkEventCopyWith(_$OnSaveBookmarkEvent value,
          $Res Function(_$OnSaveBookmarkEvent) then) =
      __$$OnSaveBookmarkEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$OnSaveBookmarkEventCopyWithImpl<$Res>
    extends _$PostCardEventCopyWithImpl<$Res, _$OnSaveBookmarkEvent>
    implements _$$OnSaveBookmarkEventCopyWith<$Res> {
  __$$OnSaveBookmarkEventCopyWithImpl(
      _$OnSaveBookmarkEvent _value, $Res Function(_$OnSaveBookmarkEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_$OnSaveBookmarkEvent(
      null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnSaveBookmarkEvent implements OnSaveBookmarkEvent {
  const _$OnSaveBookmarkEvent(this.postId);

  @override
  final String postId;

  @override
  String toString() {
    return 'PostCardEvent.saveBookmark(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSaveBookmarkEvent &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSaveBookmarkEventCopyWith<_$OnSaveBookmarkEvent> get copyWith =>
      __$$OnSaveBookmarkEventCopyWithImpl<_$OnSaveBookmarkEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostBO post, String authUserUid) showPost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) saveBookmark,
  }) {
    return saveBookmark(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PostBO post, String authUserUid)? showPost,
    TResult? Function(String postId)? deletePost,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? saveBookmark,
  }) {
    return saveBookmark?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostBO post, String authUserUid)? showPost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? saveBookmark,
    required TResult orElse(),
  }) {
    if (saveBookmark != null) {
      return saveBookmark(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnShowPostEvent value) showPost,
    required TResult Function(OnDeletePostEvent value) deletePost,
    required TResult Function(OnLikePostEvent value) likePost,
    required TResult Function(OnSaveBookmarkEvent value) saveBookmark,
  }) {
    return saveBookmark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnShowPostEvent value)? showPost,
    TResult? Function(OnDeletePostEvent value)? deletePost,
    TResult? Function(OnLikePostEvent value)? likePost,
    TResult? Function(OnSaveBookmarkEvent value)? saveBookmark,
  }) {
    return saveBookmark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnShowPostEvent value)? showPost,
    TResult Function(OnDeletePostEvent value)? deletePost,
    TResult Function(OnLikePostEvent value)? likePost,
    TResult Function(OnSaveBookmarkEvent value)? saveBookmark,
    required TResult orElse(),
  }) {
    if (saveBookmark != null) {
      return saveBookmark(this);
    }
    return orElse();
  }
}

abstract class OnSaveBookmarkEvent implements PostCardEvent {
  const factory OnSaveBookmarkEvent(final String postId) =
      _$OnSaveBookmarkEvent;

  String get postId;
  @JsonKey(ignore: true)
  _$$OnSaveBookmarkEventCopyWith<_$OnSaveBookmarkEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PostCardState {
  bool get isPostOwner => throw _privateConstructorUsedError;
  bool get isLikedByAuthUser => throw _privateConstructorUsedError;
  bool get isBookmarkedByAuthUser => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get datePublished => throw _privateConstructorUsedError;
  String get postImageUrl => throw _privateConstructorUsedError;
  bool get isPostDeleted => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get authorImageUrl => throw _privateConstructorUsedError;

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
  $Res call(
      {bool isPostOwner,
      bool isLikedByAuthUser,
      bool isBookmarkedByAuthUser,
      int likes,
      int commentCount,
      String postId,
      String username,
      String description,
      String datePublished,
      String postImageUrl,
      bool isPostDeleted,
      List<String> tags,
      String authorImageUrl});
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
    Object? isPostOwner = null,
    Object? isLikedByAuthUser = null,
    Object? isBookmarkedByAuthUser = null,
    Object? likes = null,
    Object? commentCount = null,
    Object? postId = null,
    Object? username = null,
    Object? description = null,
    Object? datePublished = null,
    Object? postImageUrl = null,
    Object? isPostDeleted = null,
    Object? tags = null,
    Object? authorImageUrl = null,
  }) {
    return _then(_value.copyWith(
      isPostOwner: null == isPostOwner
          ? _value.isPostOwner
          : isPostOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      isLikedByAuthUser: null == isLikedByAuthUser
          ? _value.isLikedByAuthUser
          : isLikedByAuthUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookmarkedByAuthUser: null == isBookmarkedByAuthUser
          ? _value.isBookmarkedByAuthUser
          : isBookmarkedByAuthUser // ignore: cast_nullable_to_non_nullable
              as bool,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      datePublished: null == datePublished
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as String,
      postImageUrl: null == postImageUrl
          ? _value.postImageUrl
          : postImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isPostDeleted: null == isPostDeleted
          ? _value.isPostDeleted
          : isPostDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      authorImageUrl: null == authorImageUrl
          ? _value.authorImageUrl
          : authorImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call(
      {bool isPostOwner,
      bool isLikedByAuthUser,
      bool isBookmarkedByAuthUser,
      int likes,
      int commentCount,
      String postId,
      String username,
      String description,
      String datePublished,
      String postImageUrl,
      bool isPostDeleted,
      List<String> tags,
      String authorImageUrl});
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
    Object? isPostOwner = null,
    Object? isLikedByAuthUser = null,
    Object? isBookmarkedByAuthUser = null,
    Object? likes = null,
    Object? commentCount = null,
    Object? postId = null,
    Object? username = null,
    Object? description = null,
    Object? datePublished = null,
    Object? postImageUrl = null,
    Object? isPostDeleted = null,
    Object? tags = null,
    Object? authorImageUrl = null,
  }) {
    return _then(_$_PostCardState(
      isPostOwner: null == isPostOwner
          ? _value.isPostOwner
          : isPostOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      isLikedByAuthUser: null == isLikedByAuthUser
          ? _value.isLikedByAuthUser
          : isLikedByAuthUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookmarkedByAuthUser: null == isBookmarkedByAuthUser
          ? _value.isBookmarkedByAuthUser
          : isBookmarkedByAuthUser // ignore: cast_nullable_to_non_nullable
              as bool,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      datePublished: null == datePublished
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as String,
      postImageUrl: null == postImageUrl
          ? _value.postImageUrl
          : postImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isPostDeleted: null == isPostDeleted
          ? _value.isPostDeleted
          : isPostDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      authorImageUrl: null == authorImageUrl
          ? _value.authorImageUrl
          : authorImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PostCardState implements _PostCardState {
  const _$_PostCardState(
      {this.isPostOwner = false,
      this.isLikedByAuthUser = false,
      this.isBookmarkedByAuthUser = false,
      this.likes = 0,
      this.commentCount = 0,
      this.postId = "",
      this.username = "",
      this.description = "",
      this.datePublished = "",
      this.postImageUrl = "",
      this.isPostDeleted = false,
      final List<String> tags = const [],
      this.authorImageUrl = "https://i.stack.imgur.com/l60Hf.png"})
      : _tags = tags;

  @override
  @JsonKey()
  final bool isPostOwner;
  @override
  @JsonKey()
  final bool isLikedByAuthUser;
  @override
  @JsonKey()
  final bool isBookmarkedByAuthUser;
  @override
  @JsonKey()
  final int likes;
  @override
  @JsonKey()
  final int commentCount;
  @override
  @JsonKey()
  final String postId;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String datePublished;
  @override
  @JsonKey()
  final String postImageUrl;
  @override
  @JsonKey()
  final bool isPostDeleted;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final String authorImageUrl;

  @override
  String toString() {
    return 'PostCardState(isPostOwner: $isPostOwner, isLikedByAuthUser: $isLikedByAuthUser, isBookmarkedByAuthUser: $isBookmarkedByAuthUser, likes: $likes, commentCount: $commentCount, postId: $postId, username: $username, description: $description, datePublished: $datePublished, postImageUrl: $postImageUrl, isPostDeleted: $isPostDeleted, tags: $tags, authorImageUrl: $authorImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostCardState &&
            (identical(other.isPostOwner, isPostOwner) ||
                other.isPostOwner == isPostOwner) &&
            (identical(other.isLikedByAuthUser, isLikedByAuthUser) ||
                other.isLikedByAuthUser == isLikedByAuthUser) &&
            (identical(other.isBookmarkedByAuthUser, isBookmarkedByAuthUser) ||
                other.isBookmarkedByAuthUser == isBookmarkedByAuthUser) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.datePublished, datePublished) ||
                other.datePublished == datePublished) &&
            (identical(other.postImageUrl, postImageUrl) ||
                other.postImageUrl == postImageUrl) &&
            (identical(other.isPostDeleted, isPostDeleted) ||
                other.isPostDeleted == isPostDeleted) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.authorImageUrl, authorImageUrl) ||
                other.authorImageUrl == authorImageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isPostOwner,
      isLikedByAuthUser,
      isBookmarkedByAuthUser,
      likes,
      commentCount,
      postId,
      username,
      description,
      datePublished,
      postImageUrl,
      isPostDeleted,
      const DeepCollectionEquality().hash(_tags),
      authorImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCardStateCopyWith<_$_PostCardState> get copyWith =>
      __$$_PostCardStateCopyWithImpl<_$_PostCardState>(this, _$identity);
}

abstract class _PostCardState implements PostCardState {
  const factory _PostCardState(
      {final bool isPostOwner,
      final bool isLikedByAuthUser,
      final bool isBookmarkedByAuthUser,
      final int likes,
      final int commentCount,
      final String postId,
      final String username,
      final String description,
      final String datePublished,
      final String postImageUrl,
      final bool isPostDeleted,
      final List<String> tags,
      final String authorImageUrl}) = _$_PostCardState;

  @override
  bool get isPostOwner;
  @override
  bool get isLikedByAuthUser;
  @override
  bool get isBookmarkedByAuthUser;
  @override
  int get likes;
  @override
  int get commentCount;
  @override
  String get postId;
  @override
  String get username;
  @override
  String get description;
  @override
  String get datePublished;
  @override
  String get postImageUrl;
  @override
  bool get isPostDeleted;
  @override
  List<String> get tags;
  @override
  String get authorImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PostCardStateCopyWith<_$_PostCardState> get copyWith =>
      throw _privateConstructorUsedError;
}
