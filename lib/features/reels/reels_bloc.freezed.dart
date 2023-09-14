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
    required TResult Function(String authUserUid) load,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) saveBookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String authUserUid)? load,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? saveBookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String authUserUid)? load,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? saveBookmark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTopReelsEvent value) load,
    required TResult Function(OnLikePostEvent value) likePost,
    required TResult Function(OnSaveBookmarkEvent value) saveBookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTopReelsEvent value)? load,
    TResult? Function(OnLikePostEvent value)? likePost,
    TResult? Function(OnSaveBookmarkEvent value)? saveBookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTopReelsEvent value)? load,
    TResult Function(OnLikePostEvent value)? likePost,
    TResult Function(OnSaveBookmarkEvent value)? saveBookmark,
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
abstract class _$$OnLoadTopReelsEventCopyWith<$Res> {
  factory _$$OnLoadTopReelsEventCopyWith(_$OnLoadTopReelsEvent value,
          $Res Function(_$OnLoadTopReelsEvent) then) =
      __$$OnLoadTopReelsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String authUserUid});
}

/// @nodoc
class __$$OnLoadTopReelsEventCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$OnLoadTopReelsEvent>
    implements _$$OnLoadTopReelsEventCopyWith<$Res> {
  __$$OnLoadTopReelsEventCopyWithImpl(
      _$OnLoadTopReelsEvent _value, $Res Function(_$OnLoadTopReelsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUserUid = null,
  }) {
    return _then(_$OnLoadTopReelsEvent(
      null == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnLoadTopReelsEvent implements OnLoadTopReelsEvent {
  const _$OnLoadTopReelsEvent(this.authUserUid);

  @override
  final String authUserUid;

  @override
  String toString() {
    return 'ReelsEvent.load(authUserUid: $authUserUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadTopReelsEvent &&
            (identical(other.authUserUid, authUserUid) ||
                other.authUserUid == authUserUid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authUserUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadTopReelsEventCopyWith<_$OnLoadTopReelsEvent> get copyWith =>
      __$$OnLoadTopReelsEventCopyWithImpl<_$OnLoadTopReelsEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authUserUid) load,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) saveBookmark,
  }) {
    return load(authUserUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String authUserUid)? load,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? saveBookmark,
  }) {
    return load?.call(authUserUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String authUserUid)? load,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? saveBookmark,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(authUserUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTopReelsEvent value) load,
    required TResult Function(OnLikePostEvent value) likePost,
    required TResult Function(OnSaveBookmarkEvent value) saveBookmark,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTopReelsEvent value)? load,
    TResult? Function(OnLikePostEvent value)? likePost,
    TResult? Function(OnSaveBookmarkEvent value)? saveBookmark,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTopReelsEvent value)? load,
    TResult Function(OnLikePostEvent value)? likePost,
    TResult Function(OnSaveBookmarkEvent value)? saveBookmark,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class OnLoadTopReelsEvent implements ReelsEvent {
  const factory OnLoadTopReelsEvent(final String authUserUid) =
      _$OnLoadTopReelsEvent;

  String get authUserUid;
  @JsonKey(ignore: true)
  _$$OnLoadTopReelsEventCopyWith<_$OnLoadTopReelsEvent> get copyWith =>
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
    extends _$ReelsEventCopyWithImpl<$Res, _$OnLikePostEvent>
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
    return 'ReelsEvent.likePost(postId: $postId)';
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
    required TResult Function(String authUserUid) load,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) saveBookmark,
  }) {
    return likePost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String authUserUid)? load,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? saveBookmark,
  }) {
    return likePost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String authUserUid)? load,
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
    required TResult Function(OnLoadTopReelsEvent value) load,
    required TResult Function(OnLikePostEvent value) likePost,
    required TResult Function(OnSaveBookmarkEvent value) saveBookmark,
  }) {
    return likePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTopReelsEvent value)? load,
    TResult? Function(OnLikePostEvent value)? likePost,
    TResult? Function(OnSaveBookmarkEvent value)? saveBookmark,
  }) {
    return likePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTopReelsEvent value)? load,
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

abstract class OnLikePostEvent implements ReelsEvent {
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
    extends _$ReelsEventCopyWithImpl<$Res, _$OnSaveBookmarkEvent>
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
    return 'ReelsEvent.saveBookmark(postId: $postId)';
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
    required TResult Function(String authUserUid) load,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) saveBookmark,
  }) {
    return saveBookmark(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String authUserUid)? load,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? saveBookmark,
  }) {
    return saveBookmark?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String authUserUid)? load,
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
    required TResult Function(OnLoadTopReelsEvent value) load,
    required TResult Function(OnLikePostEvent value) likePost,
    required TResult Function(OnSaveBookmarkEvent value) saveBookmark,
  }) {
    return saveBookmark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTopReelsEvent value)? load,
    TResult? Function(OnLikePostEvent value)? likePost,
    TResult? Function(OnSaveBookmarkEvent value)? saveBookmark,
  }) {
    return saveBookmark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTopReelsEvent value)? load,
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

abstract class OnSaveBookmarkEvent implements ReelsEvent {
  const factory OnSaveBookmarkEvent(final String postId) =
      _$OnSaveBookmarkEvent;

  String get postId;
  @JsonKey(ignore: true)
  _$$OnSaveBookmarkEventCopyWith<_$OnSaveBookmarkEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReelsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<PostBO> get topReels => throw _privateConstructorUsedError;
  String get authUserUid => throw _privateConstructorUsedError;
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
  $Res call(
      {bool isLoading,
      List<PostBO> topReels,
      String authUserUid,
      String? errorMessage});
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
    Object? authUserUid = null,
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
      authUserUid: null == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call(
      {bool isLoading,
      List<PostBO> topReels,
      String authUserUid,
      String? errorMessage});
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
    Object? authUserUid = null,
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
      authUserUid: null == authUserUid
          ? _value.authUserUid
          : authUserUid // ignore: cast_nullable_to_non_nullable
              as String,
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
      this.authUserUid = "",
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
  @JsonKey()
  final String authUserUid;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ReelsState(isLoading: $isLoading, topReels: $topReels, authUserUid: $authUserUid, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReelsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._topReels, _topReels) &&
            (identical(other.authUserUid, authUserUid) ||
                other.authUserUid == authUserUid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_topReels),
      authUserUid,
      errorMessage);

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
      final String authUserUid,
      final String? errorMessage}) = _$_ReelsState;

  @override
  bool get isLoading;
  @override
  List<PostBO> get topReels;
  @override
  String get authUserUid;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ReelsStateCopyWith<_$_ReelsState> get copyWith =>
      throw _privateConstructorUsedError;
}
