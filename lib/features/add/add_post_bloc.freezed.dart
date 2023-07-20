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
    required TResult Function(ImageSource imageSource, String userUid)
        addNewPost,
    required TResult Function(String filePath) selectFile,
    required TResult Function(String description) uploadPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult? Function(String filePath)? selectFile,
    TResult? Function(String description)? uploadPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult Function(String filePath)? selectFile,
    TResult Function(String description)? uploadPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddNewPostEvent value) addNewPost,
    required TResult Function(OnFileSelectedEvent value) selectFile,
    required TResult Function(OnUploadPostEvent value) uploadPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostEvent value)? addNewPost,
    TResult? Function(OnFileSelectedEvent value)? selectFile,
    TResult? Function(OnUploadPostEvent value)? uploadPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostEvent value)? addNewPost,
    TResult Function(OnFileSelectedEvent value)? selectFile,
    TResult Function(OnUploadPostEvent value)? uploadPost,
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
abstract class _$$OnAddNewPostEventCopyWith<$Res> {
  factory _$$OnAddNewPostEventCopyWith(
          _$OnAddNewPostEvent value, $Res Function(_$OnAddNewPostEvent) then) =
      __$$OnAddNewPostEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageSource imageSource, String userUid});
}

/// @nodoc
class __$$OnAddNewPostEventCopyWithImpl<$Res>
    extends _$AddPostEventCopyWithImpl<$Res, _$OnAddNewPostEvent>
    implements _$$OnAddNewPostEventCopyWith<$Res> {
  __$$OnAddNewPostEventCopyWithImpl(
      _$OnAddNewPostEvent _value, $Res Function(_$OnAddNewPostEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageSource = null,
    Object? userUid = null,
  }) {
    return _then(_$OnAddNewPostEvent(
      null == imageSource
          ? _value.imageSource
          : imageSource // ignore: cast_nullable_to_non_nullable
              as ImageSource,
      null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnAddNewPostEvent implements OnAddNewPostEvent {
  const _$OnAddNewPostEvent(this.imageSource, this.userUid);

  @override
  final ImageSource imageSource;
  @override
  final String userUid;

  @override
  String toString() {
    return 'AddPostEvent.addNewPost(imageSource: $imageSource, userUid: $userUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnAddNewPostEvent &&
            (identical(other.imageSource, imageSource) ||
                other.imageSource == imageSource) &&
            (identical(other.userUid, userUid) || other.userUid == userUid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageSource, userUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnAddNewPostEventCopyWith<_$OnAddNewPostEvent> get copyWith =>
      __$$OnAddNewPostEventCopyWithImpl<_$OnAddNewPostEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageSource imageSource, String userUid)
        addNewPost,
    required TResult Function(String filePath) selectFile,
    required TResult Function(String description) uploadPost,
  }) {
    return addNewPost(imageSource, userUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult? Function(String filePath)? selectFile,
    TResult? Function(String description)? uploadPost,
  }) {
    return addNewPost?.call(imageSource, userUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult Function(String filePath)? selectFile,
    TResult Function(String description)? uploadPost,
    required TResult orElse(),
  }) {
    if (addNewPost != null) {
      return addNewPost(imageSource, userUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddNewPostEvent value) addNewPost,
    required TResult Function(OnFileSelectedEvent value) selectFile,
    required TResult Function(OnUploadPostEvent value) uploadPost,
  }) {
    return addNewPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostEvent value)? addNewPost,
    TResult? Function(OnFileSelectedEvent value)? selectFile,
    TResult? Function(OnUploadPostEvent value)? uploadPost,
  }) {
    return addNewPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostEvent value)? addNewPost,
    TResult Function(OnFileSelectedEvent value)? selectFile,
    TResult Function(OnUploadPostEvent value)? uploadPost,
    required TResult orElse(),
  }) {
    if (addNewPost != null) {
      return addNewPost(this);
    }
    return orElse();
  }
}

abstract class OnAddNewPostEvent implements AddPostEvent {
  const factory OnAddNewPostEvent(
          final ImageSource imageSource, final String userUid) =
      _$OnAddNewPostEvent;

  ImageSource get imageSource;
  String get userUid;
  @JsonKey(ignore: true)
  _$$OnAddNewPostEventCopyWith<_$OnAddNewPostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnFileSelectedEventCopyWith<$Res> {
  factory _$$OnFileSelectedEventCopyWith(_$OnFileSelectedEvent value,
          $Res Function(_$OnFileSelectedEvent) then) =
      __$$OnFileSelectedEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String filePath});
}

/// @nodoc
class __$$OnFileSelectedEventCopyWithImpl<$Res>
    extends _$AddPostEventCopyWithImpl<$Res, _$OnFileSelectedEvent>
    implements _$$OnFileSelectedEventCopyWith<$Res> {
  __$$OnFileSelectedEventCopyWithImpl(
      _$OnFileSelectedEvent _value, $Res Function(_$OnFileSelectedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_$OnFileSelectedEvent(
      null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnFileSelectedEvent implements OnFileSelectedEvent {
  const _$OnFileSelectedEvent(this.filePath);

  @override
  final String filePath;

  @override
  String toString() {
    return 'AddPostEvent.selectFile(filePath: $filePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnFileSelectedEvent &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnFileSelectedEventCopyWith<_$OnFileSelectedEvent> get copyWith =>
      __$$OnFileSelectedEventCopyWithImpl<_$OnFileSelectedEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageSource imageSource, String userUid)
        addNewPost,
    required TResult Function(String filePath) selectFile,
    required TResult Function(String description) uploadPost,
  }) {
    return selectFile(filePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult? Function(String filePath)? selectFile,
    TResult? Function(String description)? uploadPost,
  }) {
    return selectFile?.call(filePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult Function(String filePath)? selectFile,
    TResult Function(String description)? uploadPost,
    required TResult orElse(),
  }) {
    if (selectFile != null) {
      return selectFile(filePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddNewPostEvent value) addNewPost,
    required TResult Function(OnFileSelectedEvent value) selectFile,
    required TResult Function(OnUploadPostEvent value) uploadPost,
  }) {
    return selectFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostEvent value)? addNewPost,
    TResult? Function(OnFileSelectedEvent value)? selectFile,
    TResult? Function(OnUploadPostEvent value)? uploadPost,
  }) {
    return selectFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostEvent value)? addNewPost,
    TResult Function(OnFileSelectedEvent value)? selectFile,
    TResult Function(OnUploadPostEvent value)? uploadPost,
    required TResult orElse(),
  }) {
    if (selectFile != null) {
      return selectFile(this);
    }
    return orElse();
  }
}

abstract class OnFileSelectedEvent implements AddPostEvent {
  const factory OnFileSelectedEvent(final String filePath) =
      _$OnFileSelectedEvent;

  String get filePath;
  @JsonKey(ignore: true)
  _$$OnFileSelectedEventCopyWith<_$OnFileSelectedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnUploadPostEventCopyWith<$Res> {
  factory _$$OnUploadPostEventCopyWith(
          _$OnUploadPostEvent value, $Res Function(_$OnUploadPostEvent) then) =
      __$$OnUploadPostEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$OnUploadPostEventCopyWithImpl<$Res>
    extends _$AddPostEventCopyWithImpl<$Res, _$OnUploadPostEvent>
    implements _$$OnUploadPostEventCopyWith<$Res> {
  __$$OnUploadPostEventCopyWithImpl(
      _$OnUploadPostEvent _value, $Res Function(_$OnUploadPostEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$OnUploadPostEvent(
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnUploadPostEvent implements OnUploadPostEvent {
  const _$OnUploadPostEvent(this.description);

  @override
  final String description;

  @override
  String toString() {
    return 'AddPostEvent.uploadPost(description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUploadPostEvent &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnUploadPostEventCopyWith<_$OnUploadPostEvent> get copyWith =>
      __$$OnUploadPostEventCopyWithImpl<_$OnUploadPostEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageSource imageSource, String userUid)
        addNewPost,
    required TResult Function(String filePath) selectFile,
    required TResult Function(String description) uploadPost,
  }) {
    return uploadPost(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult? Function(String filePath)? selectFile,
    TResult? Function(String description)? uploadPost,
  }) {
    return uploadPost?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult Function(String filePath)? selectFile,
    TResult Function(String description)? uploadPost,
    required TResult orElse(),
  }) {
    if (uploadPost != null) {
      return uploadPost(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddNewPostEvent value) addNewPost,
    required TResult Function(OnFileSelectedEvent value) selectFile,
    required TResult Function(OnUploadPostEvent value) uploadPost,
  }) {
    return uploadPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostEvent value)? addNewPost,
    TResult? Function(OnFileSelectedEvent value)? selectFile,
    TResult? Function(OnUploadPostEvent value)? uploadPost,
  }) {
    return uploadPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostEvent value)? addNewPost,
    TResult Function(OnFileSelectedEvent value)? selectFile,
    TResult Function(OnUploadPostEvent value)? uploadPost,
    required TResult orElse(),
  }) {
    if (uploadPost != null) {
      return uploadPost(this);
    }
    return orElse();
  }
}

abstract class OnUploadPostEvent implements AddPostEvent {
  const factory OnUploadPostEvent(final String description) =
      _$OnUploadPostEvent;

  String get description;
  @JsonKey(ignore: true)
  _$$OnUploadPostEventCopyWith<_$OnUploadPostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddPostState {
  ImageSource? get imageSource => throw _privateConstructorUsedError;
  String? get authorPhotoUrl => throw _privateConstructorUsedError;
  String? get postFilePath => throw _privateConstructorUsedError;
  bool get isPostUploading => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPostUploadedSuccessfully => throw _privateConstructorUsedError;
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
  $Res call(
      {ImageSource? imageSource,
      String? authorPhotoUrl,
      String? postFilePath,
      bool isPostUploading,
      bool isLoading,
      bool isPostUploadedSuccessfully,
      String? errorMessage});
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
    Object? imageSource = freezed,
    Object? authorPhotoUrl = freezed,
    Object? postFilePath = freezed,
    Object? isPostUploading = null,
    Object? isLoading = null,
    Object? isPostUploadedSuccessfully = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      imageSource: freezed == imageSource
          ? _value.imageSource
          : imageSource // ignore: cast_nullable_to_non_nullable
              as ImageSource?,
      authorPhotoUrl: freezed == authorPhotoUrl
          ? _value.authorPhotoUrl
          : authorPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      postFilePath: freezed == postFilePath
          ? _value.postFilePath
          : postFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isPostUploading: null == isPostUploading
          ? _value.isPostUploading
          : isPostUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPostUploadedSuccessfully: null == isPostUploadedSuccessfully
          ? _value.isPostUploadedSuccessfully
          : isPostUploadedSuccessfully // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {ImageSource? imageSource,
      String? authorPhotoUrl,
      String? postFilePath,
      bool isPostUploading,
      bool isLoading,
      bool isPostUploadedSuccessfully,
      String? errorMessage});
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
    Object? imageSource = freezed,
    Object? authorPhotoUrl = freezed,
    Object? postFilePath = freezed,
    Object? isPostUploading = null,
    Object? isLoading = null,
    Object? isPostUploadedSuccessfully = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AddPostState(
      imageSource: freezed == imageSource
          ? _value.imageSource
          : imageSource // ignore: cast_nullable_to_non_nullable
              as ImageSource?,
      authorPhotoUrl: freezed == authorPhotoUrl
          ? _value.authorPhotoUrl
          : authorPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      postFilePath: freezed == postFilePath
          ? _value.postFilePath
          : postFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isPostUploading: null == isPostUploading
          ? _value.isPostUploading
          : isPostUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPostUploadedSuccessfully: null == isPostUploadedSuccessfully
          ? _value.isPostUploadedSuccessfully
          : isPostUploadedSuccessfully // ignore: cast_nullable_to_non_nullable
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
  const _$_AddPostState(
      {this.imageSource = null,
      this.authorPhotoUrl,
      this.postFilePath,
      this.isPostUploading = false,
      this.isLoading = false,
      this.isPostUploadedSuccessfully = false,
      this.errorMessage});

  @override
  @JsonKey()
  final ImageSource? imageSource;
  @override
  final String? authorPhotoUrl;
  @override
  final String? postFilePath;
  @override
  @JsonKey()
  final bool isPostUploading;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isPostUploadedSuccessfully;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AddPostState(imageSource: $imageSource, authorPhotoUrl: $authorPhotoUrl, postFilePath: $postFilePath, isPostUploading: $isPostUploading, isLoading: $isLoading, isPostUploadedSuccessfully: $isPostUploadedSuccessfully, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPostState &&
            (identical(other.imageSource, imageSource) ||
                other.imageSource == imageSource) &&
            (identical(other.authorPhotoUrl, authorPhotoUrl) ||
                other.authorPhotoUrl == authorPhotoUrl) &&
            (identical(other.postFilePath, postFilePath) ||
                other.postFilePath == postFilePath) &&
            (identical(other.isPostUploading, isPostUploading) ||
                other.isPostUploading == isPostUploading) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isPostUploadedSuccessfully,
                    isPostUploadedSuccessfully) ||
                other.isPostUploadedSuccessfully ==
                    isPostUploadedSuccessfully) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      imageSource,
      authorPhotoUrl,
      postFilePath,
      isPostUploading,
      isLoading,
      isPostUploadedSuccessfully,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddPostStateCopyWith<_$_AddPostState> get copyWith =>
      __$$_AddPostStateCopyWithImpl<_$_AddPostState>(this, _$identity);
}

abstract class _AddPostState implements AddPostState {
  const factory _AddPostState(
      {final ImageSource? imageSource,
      final String? authorPhotoUrl,
      final String? postFilePath,
      final bool isPostUploading,
      final bool isLoading,
      final bool isPostUploadedSuccessfully,
      final String? errorMessage}) = _$_AddPostState;

  @override
  ImageSource? get imageSource;
  @override
  String? get authorPhotoUrl;
  @override
  String? get postFilePath;
  @override
  bool get isPostUploading;
  @override
  bool get isLoading;
  @override
  bool get isPostUploadedSuccessfully;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AddPostStateCopyWith<_$_AddPostState> get copyWith =>
      throw _privateConstructorUsedError;
}
