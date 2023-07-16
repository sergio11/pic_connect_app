// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term) searchUsers,
    required TResult Function() loadPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term)? searchUsers,
    TResult? Function()? loadPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term)? searchUsers,
    TResult Function()? loadPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnSearchUsersEvent value) searchUsers,
    required TResult Function(OnLoadLastPostsPublishedEvent value) loadPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnSearchUsersEvent value)? searchUsers,
    TResult? Function(OnLoadLastPostsPublishedEvent value)? loadPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnSearchUsersEvent value)? searchUsers,
    TResult Function(OnLoadLastPostsPublishedEvent value)? loadPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnSearchUsersEventCopyWith<$Res> {
  factory _$$OnSearchUsersEventCopyWith(_$OnSearchUsersEvent value,
          $Res Function(_$OnSearchUsersEvent) then) =
      __$$OnSearchUsersEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String term});
}

/// @nodoc
class __$$OnSearchUsersEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$OnSearchUsersEvent>
    implements _$$OnSearchUsersEventCopyWith<$Res> {
  __$$OnSearchUsersEventCopyWithImpl(
      _$OnSearchUsersEvent _value, $Res Function(_$OnSearchUsersEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = null,
  }) {
    return _then(_$OnSearchUsersEvent(
      null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnSearchUsersEvent implements OnSearchUsersEvent {
  const _$OnSearchUsersEvent(this.term);

  @override
  final String term;

  @override
  String toString() {
    return 'SearchEvent.searchUsers(term: $term)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSearchUsersEvent &&
            (identical(other.term, term) || other.term == term));
  }

  @override
  int get hashCode => Object.hash(runtimeType, term);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSearchUsersEventCopyWith<_$OnSearchUsersEvent> get copyWith =>
      __$$OnSearchUsersEventCopyWithImpl<_$OnSearchUsersEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term) searchUsers,
    required TResult Function() loadPosts,
  }) {
    return searchUsers(term);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term)? searchUsers,
    TResult? Function()? loadPosts,
  }) {
    return searchUsers?.call(term);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term)? searchUsers,
    TResult Function()? loadPosts,
    required TResult orElse(),
  }) {
    if (searchUsers != null) {
      return searchUsers(term);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnSearchUsersEvent value) searchUsers,
    required TResult Function(OnLoadLastPostsPublishedEvent value) loadPosts,
  }) {
    return searchUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnSearchUsersEvent value)? searchUsers,
    TResult? Function(OnLoadLastPostsPublishedEvent value)? loadPosts,
  }) {
    return searchUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnSearchUsersEvent value)? searchUsers,
    TResult Function(OnLoadLastPostsPublishedEvent value)? loadPosts,
    required TResult orElse(),
  }) {
    if (searchUsers != null) {
      return searchUsers(this);
    }
    return orElse();
  }
}

abstract class OnSearchUsersEvent implements SearchEvent {
  const factory OnSearchUsersEvent(final String term) = _$OnSearchUsersEvent;

  String get term;
  @JsonKey(ignore: true)
  _$$OnSearchUsersEventCopyWith<_$OnSearchUsersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnLoadLastPostsPublishedEventCopyWith<$Res> {
  factory _$$OnLoadLastPostsPublishedEventCopyWith(
          _$OnLoadLastPostsPublishedEvent value,
          $Res Function(_$OnLoadLastPostsPublishedEvent) then) =
      __$$OnLoadLastPostsPublishedEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnLoadLastPostsPublishedEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$OnLoadLastPostsPublishedEvent>
    implements _$$OnLoadLastPostsPublishedEventCopyWith<$Res> {
  __$$OnLoadLastPostsPublishedEventCopyWithImpl(
      _$OnLoadLastPostsPublishedEvent _value,
      $Res Function(_$OnLoadLastPostsPublishedEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnLoadLastPostsPublishedEvent implements OnLoadLastPostsPublishedEvent {
  const _$OnLoadLastPostsPublishedEvent();

  @override
  String toString() {
    return 'SearchEvent.loadPosts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadLastPostsPublishedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term) searchUsers,
    required TResult Function() loadPosts,
  }) {
    return loadPosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term)? searchUsers,
    TResult? Function()? loadPosts,
  }) {
    return loadPosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term)? searchUsers,
    TResult Function()? loadPosts,
    required TResult orElse(),
  }) {
    if (loadPosts != null) {
      return loadPosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnSearchUsersEvent value) searchUsers,
    required TResult Function(OnLoadLastPostsPublishedEvent value) loadPosts,
  }) {
    return loadPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnSearchUsersEvent value)? searchUsers,
    TResult? Function(OnLoadLastPostsPublishedEvent value)? loadPosts,
  }) {
    return loadPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnSearchUsersEvent value)? searchUsers,
    TResult Function(OnLoadLastPostsPublishedEvent value)? loadPosts,
    required TResult orElse(),
  }) {
    if (loadPosts != null) {
      return loadPosts(this);
    }
    return orElse();
  }
}

abstract class OnLoadLastPostsPublishedEvent implements SearchEvent {
  const factory OnLoadLastPostsPublishedEvent() =
      _$OnLoadLastPostsPublishedEvent;
}

/// @nodoc
mixin _$SearchState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isShowUsers => throw _privateConstructorUsedError;
  List<UserBO> get users => throw _privateConstructorUsedError;
  List<PostBO> get posts => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isShowUsers,
      List<UserBO> users,
      List<PostBO> posts,
      String? errorMessage});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isShowUsers = null,
    Object? users = null,
    Object? posts = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowUsers: null == isShowUsers
          ? _value.isShowUsers
          : isShowUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserBO>,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isShowUsers,
      List<UserBO> users,
      List<PostBO> posts,
      String? errorMessage});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_SearchState>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isShowUsers = null,
    Object? users = null,
    Object? posts = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_SearchState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowUsers: null == isShowUsers
          ? _value.isShowUsers
          : isShowUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserBO>,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostBO>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {this.isLoading = false,
      this.isShowUsers = false,
      final List<UserBO> users = const [],
      final List<PostBO> posts = const [],
      this.errorMessage})
      : _users = users,
        _posts = posts;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isShowUsers;
  final List<UserBO> _users;
  @override
  @JsonKey()
  List<UserBO> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<PostBO> _posts;
  @override
  @JsonKey()
  List<PostBO> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SearchState(isLoading: $isLoading, isShowUsers: $isShowUsers, users: $users, posts: $posts, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isShowUsers, isShowUsers) ||
                other.isShowUsers == isShowUsers) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isShowUsers,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_posts),
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final bool isLoading,
      final bool isShowUsers,
      final List<UserBO> users,
      final List<PostBO> posts,
      final String? errorMessage}) = _$_SearchState;

  @override
  bool get isLoading;
  @override
  bool get isShowUsers;
  @override
  List<UserBO> get users;
  @override
  List<PostBO> get posts;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
