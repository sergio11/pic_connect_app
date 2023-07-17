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
    required TResult Function(ImageSource imageSource) addNewPostFrom,
    required TResult Function(String filePath) takePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource)? addNewPostFrom,
    TResult? Function(String filePath)? takePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource)? addNewPostFrom,
    TResult Function(String filePath)? takePhoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddNewPostFromEvent value) addNewPostFrom,
    required TResult Function(OnTakePhotoEvent value) takePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostFromEvent value)? addNewPostFrom,
    TResult? Function(OnTakePhotoEvent value)? takePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostFromEvent value)? addNewPostFrom,
    TResult Function(OnTakePhotoEvent value)? takePhoto,
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
abstract class _$$OnAddNewPostFromEventCopyWith<$Res> {
  factory _$$OnAddNewPostFromEventCopyWith(_$OnAddNewPostFromEvent value,
          $Res Function(_$OnAddNewPostFromEvent) then) =
      __$$OnAddNewPostFromEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageSource imageSource});
}

/// @nodoc
class __$$OnAddNewPostFromEventCopyWithImpl<$Res>
    extends _$AddPostEventCopyWithImpl<$Res, _$OnAddNewPostFromEvent>
    implements _$$OnAddNewPostFromEventCopyWith<$Res> {
  __$$OnAddNewPostFromEventCopyWithImpl(_$OnAddNewPostFromEvent _value,
      $Res Function(_$OnAddNewPostFromEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageSource = null,
  }) {
    return _then(_$OnAddNewPostFromEvent(
      null == imageSource
          ? _value.imageSource
          : imageSource // ignore: cast_nullable_to_non_nullable
              as ImageSource,
    ));
  }
}

/// @nodoc

class _$OnAddNewPostFromEvent implements OnAddNewPostFromEvent {
  const _$OnAddNewPostFromEvent(this.imageSource);

  @override
  final ImageSource imageSource;

  @override
  String toString() {
    return 'AddPostEvent.addNewPostFrom(imageSource: $imageSource)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnAddNewPostFromEvent &&
            (identical(other.imageSource, imageSource) ||
                other.imageSource == imageSource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageSource);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnAddNewPostFromEventCopyWith<_$OnAddNewPostFromEvent> get copyWith =>
      __$$OnAddNewPostFromEventCopyWithImpl<_$OnAddNewPostFromEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageSource imageSource) addNewPostFrom,
    required TResult Function(String filePath) takePhoto,
  }) {
    return addNewPostFrom(imageSource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource)? addNewPostFrom,
    TResult? Function(String filePath)? takePhoto,
  }) {
    return addNewPostFrom?.call(imageSource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource)? addNewPostFrom,
    TResult Function(String filePath)? takePhoto,
    required TResult orElse(),
  }) {
    if (addNewPostFrom != null) {
      return addNewPostFrom(imageSource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddNewPostFromEvent value) addNewPostFrom,
    required TResult Function(OnTakePhotoEvent value) takePhoto,
  }) {
    return addNewPostFrom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostFromEvent value)? addNewPostFrom,
    TResult? Function(OnTakePhotoEvent value)? takePhoto,
  }) {
    return addNewPostFrom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostFromEvent value)? addNewPostFrom,
    TResult Function(OnTakePhotoEvent value)? takePhoto,
    required TResult orElse(),
  }) {
    if (addNewPostFrom != null) {
      return addNewPostFrom(this);
    }
    return orElse();
  }
}

abstract class OnAddNewPostFromEvent implements AddPostEvent {
  const factory OnAddNewPostFromEvent(final ImageSource imageSource) =
      _$OnAddNewPostFromEvent;

  ImageSource get imageSource;
  @JsonKey(ignore: true)
  _$$OnAddNewPostFromEventCopyWith<_$OnAddNewPostFromEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnTakePhotoEventCopyWith<$Res> {
  factory _$$OnTakePhotoEventCopyWith(
          _$OnTakePhotoEvent value, $Res Function(_$OnTakePhotoEvent) then) =
      __$$OnTakePhotoEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String filePath});
}

/// @nodoc
class __$$OnTakePhotoEventCopyWithImpl<$Res>
    extends _$AddPostEventCopyWithImpl<$Res, _$OnTakePhotoEvent>
    implements _$$OnTakePhotoEventCopyWith<$Res> {
  __$$OnTakePhotoEventCopyWithImpl(
      _$OnTakePhotoEvent _value, $Res Function(_$OnTakePhotoEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_$OnTakePhotoEvent(
      null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnTakePhotoEvent implements OnTakePhotoEvent {
  const _$OnTakePhotoEvent(this.filePath);

  @override
  final String filePath;

  @override
  String toString() {
    return 'AddPostEvent.takePhoto(filePath: $filePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnTakePhotoEvent &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnTakePhotoEventCopyWith<_$OnTakePhotoEvent> get copyWith =>
      __$$OnTakePhotoEventCopyWithImpl<_$OnTakePhotoEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageSource imageSource) addNewPostFrom,
    required TResult Function(String filePath) takePhoto,
  }) {
    return takePhoto(filePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource)? addNewPostFrom,
    TResult? Function(String filePath)? takePhoto,
  }) {
    return takePhoto?.call(filePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource)? addNewPostFrom,
    TResult Function(String filePath)? takePhoto,
    required TResult orElse(),
  }) {
    if (takePhoto != null) {
      return takePhoto(filePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddNewPostFromEvent value) addNewPostFrom,
    required TResult Function(OnTakePhotoEvent value) takePhoto,
  }) {
    return takePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostFromEvent value)? addNewPostFrom,
    TResult? Function(OnTakePhotoEvent value)? takePhoto,
  }) {
    return takePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostFromEvent value)? addNewPostFrom,
    TResult Function(OnTakePhotoEvent value)? takePhoto,
    required TResult orElse(),
  }) {
    if (takePhoto != null) {
      return takePhoto(this);
    }
    return orElse();
  }
}

abstract class OnTakePhotoEvent implements AddPostEvent {
  const factory OnTakePhotoEvent(final String filePath) = _$OnTakePhotoEvent;

  String get filePath;
  @JsonKey(ignore: true)
  _$$OnTakePhotoEventCopyWith<_$OnTakePhotoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddPostState {
  ImageSource get imageSource => throw _privateConstructorUsedError;
  String? get authorPhotoUrl => throw _privateConstructorUsedError;
  String? get postFilePath => throw _privateConstructorUsedError;
  bool get isPostUploading => throw _privateConstructorUsedError;
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
  $Res call(
      {ImageSource imageSource,
      String? authorPhotoUrl,
      String? postFilePath,
      bool isPostUploading,
      bool isLoading,
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
    Object? imageSource = null,
    Object? authorPhotoUrl = freezed,
    Object? postFilePath = freezed,
    Object? isPostUploading = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      imageSource: null == imageSource
          ? _value.imageSource
          : imageSource // ignore: cast_nullable_to_non_nullable
              as ImageSource,
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
      {ImageSource imageSource,
      String? authorPhotoUrl,
      String? postFilePath,
      bool isPostUploading,
      bool isLoading,
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
    Object? imageSource = null,
    Object? authorPhotoUrl = freezed,
    Object? postFilePath = freezed,
    Object? isPostUploading = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AddPostState(
      imageSource: null == imageSource
          ? _value.imageSource
          : imageSource // ignore: cast_nullable_to_non_nullable
              as ImageSource,
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
      {this.imageSource = ImageSource.gallery,
      this.authorPhotoUrl,
      this.postFilePath,
      this.isPostUploading = false,
      this.isLoading = false,
      this.errorMessage});

  @override
  @JsonKey()
  final ImageSource imageSource;
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
  final String? errorMessage;

  @override
  String toString() {
    return 'AddPostState(imageSource: $imageSource, authorPhotoUrl: $authorPhotoUrl, postFilePath: $postFilePath, isPostUploading: $isPostUploading, isLoading: $isLoading, errorMessage: $errorMessage)';
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
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageSource, authorPhotoUrl,
      postFilePath, isPostUploading, isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddPostStateCopyWith<_$_AddPostState> get copyWith =>
      __$$_AddPostStateCopyWithImpl<_$_AddPostState>(this, _$identity);
}

abstract class _AddPostState implements AddPostState {
  const factory _AddPostState(
      {final ImageSource imageSource,
      final String? authorPhotoUrl,
      final String? postFilePath,
      final bool isPostUploading,
      final bool isLoading,
      final String? errorMessage}) = _$_AddPostState;

  @override
  ImageSource get imageSource;
  @override
  String? get authorPhotoUrl;
  @override
  String? get postFilePath;
  @override
  bool get isPostUploading;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AddPostStateCopyWith<_$_AddPostState> get copyWith =>
      throw _privateConstructorUsedError;
}
