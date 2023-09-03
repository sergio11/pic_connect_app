// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PublicationsEvent {
  String get userUid => throw _privateConstructorUsedError;
  PostTypeEnum get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUid, PostTypeEnum type)
        loadPublications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUid, PostTypeEnum type)? loadPublications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUid, PostTypeEnum type)? loadPublications,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPublicationsEvent value) loadPublications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPublicationsEvent value)? loadPublications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPublicationsEvent value)? loadPublications,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PublicationsEventCopyWith<PublicationsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicationsEventCopyWith<$Res> {
  factory $PublicationsEventCopyWith(
          PublicationsEvent value, $Res Function(PublicationsEvent) then) =
      _$PublicationsEventCopyWithImpl<$Res, PublicationsEvent>;
  @useResult
  $Res call({String userUid, PostTypeEnum type});
}

/// @nodoc
class _$PublicationsEventCopyWithImpl<$Res, $Val extends PublicationsEvent>
    implements $PublicationsEventCopyWith<$Res> {
  _$PublicationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PostTypeEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnLoadPublicationsEventCopyWith<$Res>
    implements $PublicationsEventCopyWith<$Res> {
  factory _$$OnLoadPublicationsEventCopyWith(_$OnLoadPublicationsEvent value,
          $Res Function(_$OnLoadPublicationsEvent) then) =
      __$$OnLoadPublicationsEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUid, PostTypeEnum type});
}

/// @nodoc
class __$$OnLoadPublicationsEventCopyWithImpl<$Res>
    extends _$PublicationsEventCopyWithImpl<$Res, _$OnLoadPublicationsEvent>
    implements _$$OnLoadPublicationsEventCopyWith<$Res> {
  __$$OnLoadPublicationsEventCopyWithImpl(_$OnLoadPublicationsEvent _value,
      $Res Function(_$OnLoadPublicationsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? type = null,
  }) {
    return _then(_$OnLoadPublicationsEvent(
      null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PostTypeEnum,
    ));
  }
}

/// @nodoc

class _$OnLoadPublicationsEvent implements OnLoadPublicationsEvent {
  const _$OnLoadPublicationsEvent(this.userUid, this.type);

  @override
  final String userUid;
  @override
  final PostTypeEnum type;

  @override
  String toString() {
    return 'PublicationsEvent.loadPublications(userUid: $userUid, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadPublicationsEvent &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUid, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadPublicationsEventCopyWith<_$OnLoadPublicationsEvent> get copyWith =>
      __$$OnLoadPublicationsEventCopyWithImpl<_$OnLoadPublicationsEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUid, PostTypeEnum type)
        loadPublications,
  }) {
    return loadPublications(userUid, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUid, PostTypeEnum type)? loadPublications,
  }) {
    return loadPublications?.call(userUid, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUid, PostTypeEnum type)? loadPublications,
    required TResult orElse(),
  }) {
    if (loadPublications != null) {
      return loadPublications(userUid, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPublicationsEvent value) loadPublications,
  }) {
    return loadPublications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPublicationsEvent value)? loadPublications,
  }) {
    return loadPublications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPublicationsEvent value)? loadPublications,
    required TResult orElse(),
  }) {
    if (loadPublications != null) {
      return loadPublications(this);
    }
    return orElse();
  }
}

abstract class OnLoadPublicationsEvent implements PublicationsEvent {
  const factory OnLoadPublicationsEvent(
          final String userUid, final PostTypeEnum type) =
      _$OnLoadPublicationsEvent;

  @override
  String get userUid;
  @override
  PostTypeEnum get type;
  @override
  @JsonKey(ignore: true)
  _$$OnLoadPublicationsEventCopyWith<_$OnLoadPublicationsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PublicationsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<PostBO> get postList => throw _privateConstructorUsedError;
  int get postLen => throw _privateConstructorUsedError;
  String get authorUserUid => throw _privateConstructorUsedError;
  PostTypeEnum get type => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PublicationsStateCopyWith<PublicationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicationsStateCopyWith<$Res> {
  factory $PublicationsStateCopyWith(
          PublicationsState value, $Res Function(PublicationsState) then) =
      _$PublicationsStateCopyWithImpl<$Res, PublicationsState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<PostBO> postList,
      int postLen,
      String authorUserUid,
      PostTypeEnum type,
      String? errorMessage});
}

/// @nodoc
class _$PublicationsStateCopyWithImpl<$Res, $Val extends PublicationsState>
    implements $PublicationsStateCopyWith<$Res> {
  _$PublicationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? postList = null,
    Object? postLen = null,
    Object? authorUserUid = null,
    Object? type = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      postList: null == postList
          ? _value.postList
          : postList // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      postLen: null == postLen
          ? _value.postLen
          : postLen // ignore: cast_nullable_to_non_nullable
              as int,
      authorUserUid: null == authorUserUid
          ? _value.authorUserUid
          : authorUserUid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PostTypeEnum,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PublicationsStateCopyWith<$Res>
    implements $PublicationsStateCopyWith<$Res> {
  factory _$$_PublicationsStateCopyWith(_$_PublicationsState value,
          $Res Function(_$_PublicationsState) then) =
      __$$_PublicationsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<PostBO> postList,
      int postLen,
      String authorUserUid,
      PostTypeEnum type,
      String? errorMessage});
}

/// @nodoc
class __$$_PublicationsStateCopyWithImpl<$Res>
    extends _$PublicationsStateCopyWithImpl<$Res, _$_PublicationsState>
    implements _$$_PublicationsStateCopyWith<$Res> {
  __$$_PublicationsStateCopyWithImpl(
      _$_PublicationsState _value, $Res Function(_$_PublicationsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? postList = null,
    Object? postLen = null,
    Object? authorUserUid = null,
    Object? type = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_PublicationsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      postList: null == postList
          ? _value._postList
          : postList // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      postLen: null == postLen
          ? _value.postLen
          : postLen // ignore: cast_nullable_to_non_nullable
              as int,
      authorUserUid: null == authorUserUid
          ? _value.authorUserUid
          : authorUserUid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PostTypeEnum,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PublicationsState implements _PublicationsState {
  const _$_PublicationsState(
      {this.isLoading = true,
      final List<PostBO> postList = const [],
      this.postLen = 0,
      this.authorUserUid = "",
      this.type = PostTypeEnum.all,
      this.errorMessage})
      : _postList = postList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<PostBO> _postList;
  @override
  @JsonKey()
  List<PostBO> get postList {
    if (_postList is EqualUnmodifiableListView) return _postList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postList);
  }

  @override
  @JsonKey()
  final int postLen;
  @override
  @JsonKey()
  final String authorUserUid;
  @override
  @JsonKey()
  final PostTypeEnum type;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'PublicationsState(isLoading: $isLoading, postList: $postList, postLen: $postLen, authorUserUid: $authorUserUid, type: $type, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicationsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._postList, _postList) &&
            (identical(other.postLen, postLen) || other.postLen == postLen) &&
            (identical(other.authorUserUid, authorUserUid) ||
                other.authorUserUid == authorUserUid) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_postList),
      postLen,
      authorUserUid,
      type,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicationsStateCopyWith<_$_PublicationsState> get copyWith =>
      __$$_PublicationsStateCopyWithImpl<_$_PublicationsState>(
          this, _$identity);
}

abstract class _PublicationsState implements PublicationsState {
  const factory _PublicationsState(
      {final bool isLoading,
      final List<PostBO> postList,
      final int postLen,
      final String authorUserUid,
      final PostTypeEnum type,
      final String? errorMessage}) = _$_PublicationsState;

  @override
  bool get isLoading;
  @override
  List<PostBO> get postList;
  @override
  int get postLen;
  @override
  String get authorUserUid;
  @override
  PostTypeEnum get type;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_PublicationsStateCopyWith<_$_PublicationsState> get copyWith =>
      throw _privateConstructorUsedError;
}
