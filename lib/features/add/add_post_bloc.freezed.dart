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
    required TResult Function(String imageFilePath) onPhotoSelected,
    required TResult Function(String videoFilePath) onVideoSelected,
    required TResult Function(
            String placeInfo, String description, List<String> tags)
        uploadPost,
    required TResult Function(Uint8List imageData) editedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult? Function(String imageFilePath)? onPhotoSelected,
    TResult? Function(String videoFilePath)? onVideoSelected,
    TResult? Function(String placeInfo, String description, List<String> tags)?
        uploadPost,
    TResult? Function(Uint8List imageData)? editedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult Function(String imageFilePath)? onPhotoSelected,
    TResult Function(String videoFilePath)? onVideoSelected,
    TResult Function(String placeInfo, String description, List<String> tags)?
        uploadPost,
    TResult Function(Uint8List imageData)? editedImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddNewPostEvent value) addNewPost,
    required TResult Function(OnPhotoSelectedEvent value) onPhotoSelected,
    required TResult Function(OnVideoSelectedEvent value) onVideoSelected,
    required TResult Function(OnUploadPostEvent value) uploadPost,
    required TResult Function(OnEditedImageEvent value) editedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostEvent value)? addNewPost,
    TResult? Function(OnPhotoSelectedEvent value)? onPhotoSelected,
    TResult? Function(OnVideoSelectedEvent value)? onVideoSelected,
    TResult? Function(OnUploadPostEvent value)? uploadPost,
    TResult? Function(OnEditedImageEvent value)? editedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostEvent value)? addNewPost,
    TResult Function(OnPhotoSelectedEvent value)? onPhotoSelected,
    TResult Function(OnVideoSelectedEvent value)? onVideoSelected,
    TResult Function(OnUploadPostEvent value)? uploadPost,
    TResult Function(OnEditedImageEvent value)? editedImage,
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

class _$OnAddNewPostEvent
    with DiagnosticableTreeMixin
    implements OnAddNewPostEvent {
  const _$OnAddNewPostEvent(this.imageSource, this.userUid);

  @override
  final ImageSource imageSource;
  @override
  final String userUid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddPostEvent.addNewPost(imageSource: $imageSource, userUid: $userUid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddPostEvent.addNewPost'))
      ..add(DiagnosticsProperty('imageSource', imageSource))
      ..add(DiagnosticsProperty('userUid', userUid));
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
    required TResult Function(String imageFilePath) onPhotoSelected,
    required TResult Function(String videoFilePath) onVideoSelected,
    required TResult Function(
            String placeInfo, String description, List<String> tags)
        uploadPost,
    required TResult Function(Uint8List imageData) editedImage,
  }) {
    return addNewPost(imageSource, userUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult? Function(String imageFilePath)? onPhotoSelected,
    TResult? Function(String videoFilePath)? onVideoSelected,
    TResult? Function(String placeInfo, String description, List<String> tags)?
        uploadPost,
    TResult? Function(Uint8List imageData)? editedImage,
  }) {
    return addNewPost?.call(imageSource, userUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult Function(String imageFilePath)? onPhotoSelected,
    TResult Function(String videoFilePath)? onVideoSelected,
    TResult Function(String placeInfo, String description, List<String> tags)?
        uploadPost,
    TResult Function(Uint8List imageData)? editedImage,
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
    required TResult Function(OnPhotoSelectedEvent value) onPhotoSelected,
    required TResult Function(OnVideoSelectedEvent value) onVideoSelected,
    required TResult Function(OnUploadPostEvent value) uploadPost,
    required TResult Function(OnEditedImageEvent value) editedImage,
  }) {
    return addNewPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostEvent value)? addNewPost,
    TResult? Function(OnPhotoSelectedEvent value)? onPhotoSelected,
    TResult? Function(OnVideoSelectedEvent value)? onVideoSelected,
    TResult? Function(OnUploadPostEvent value)? uploadPost,
    TResult? Function(OnEditedImageEvent value)? editedImage,
  }) {
    return addNewPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostEvent value)? addNewPost,
    TResult Function(OnPhotoSelectedEvent value)? onPhotoSelected,
    TResult Function(OnVideoSelectedEvent value)? onVideoSelected,
    TResult Function(OnUploadPostEvent value)? uploadPost,
    TResult Function(OnEditedImageEvent value)? editedImage,
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
abstract class _$$OnPhotoSelectedEventCopyWith<$Res> {
  factory _$$OnPhotoSelectedEventCopyWith(_$OnPhotoSelectedEvent value,
          $Res Function(_$OnPhotoSelectedEvent) then) =
      __$$OnPhotoSelectedEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String imageFilePath});
}

/// @nodoc
class __$$OnPhotoSelectedEventCopyWithImpl<$Res>
    extends _$AddPostEventCopyWithImpl<$Res, _$OnPhotoSelectedEvent>
    implements _$$OnPhotoSelectedEventCopyWith<$Res> {
  __$$OnPhotoSelectedEventCopyWithImpl(_$OnPhotoSelectedEvent _value,
      $Res Function(_$OnPhotoSelectedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFilePath = null,
  }) {
    return _then(_$OnPhotoSelectedEvent(
      null == imageFilePath
          ? _value.imageFilePath
          : imageFilePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnPhotoSelectedEvent
    with DiagnosticableTreeMixin
    implements OnPhotoSelectedEvent {
  const _$OnPhotoSelectedEvent(this.imageFilePath);

  @override
  final String imageFilePath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddPostEvent.onPhotoSelected(imageFilePath: $imageFilePath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddPostEvent.onPhotoSelected'))
      ..add(DiagnosticsProperty('imageFilePath', imageFilePath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnPhotoSelectedEvent &&
            (identical(other.imageFilePath, imageFilePath) ||
                other.imageFilePath == imageFilePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageFilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnPhotoSelectedEventCopyWith<_$OnPhotoSelectedEvent> get copyWith =>
      __$$OnPhotoSelectedEventCopyWithImpl<_$OnPhotoSelectedEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageSource imageSource, String userUid)
        addNewPost,
    required TResult Function(String imageFilePath) onPhotoSelected,
    required TResult Function(String videoFilePath) onVideoSelected,
    required TResult Function(
            String placeInfo, String description, List<String> tags)
        uploadPost,
    required TResult Function(Uint8List imageData) editedImage,
  }) {
    return onPhotoSelected(imageFilePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult? Function(String imageFilePath)? onPhotoSelected,
    TResult? Function(String videoFilePath)? onVideoSelected,
    TResult? Function(String placeInfo, String description, List<String> tags)?
        uploadPost,
    TResult? Function(Uint8List imageData)? editedImage,
  }) {
    return onPhotoSelected?.call(imageFilePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult Function(String imageFilePath)? onPhotoSelected,
    TResult Function(String videoFilePath)? onVideoSelected,
    TResult Function(String placeInfo, String description, List<String> tags)?
        uploadPost,
    TResult Function(Uint8List imageData)? editedImage,
    required TResult orElse(),
  }) {
    if (onPhotoSelected != null) {
      return onPhotoSelected(imageFilePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddNewPostEvent value) addNewPost,
    required TResult Function(OnPhotoSelectedEvent value) onPhotoSelected,
    required TResult Function(OnVideoSelectedEvent value) onVideoSelected,
    required TResult Function(OnUploadPostEvent value) uploadPost,
    required TResult Function(OnEditedImageEvent value) editedImage,
  }) {
    return onPhotoSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostEvent value)? addNewPost,
    TResult? Function(OnPhotoSelectedEvent value)? onPhotoSelected,
    TResult? Function(OnVideoSelectedEvent value)? onVideoSelected,
    TResult? Function(OnUploadPostEvent value)? uploadPost,
    TResult? Function(OnEditedImageEvent value)? editedImage,
  }) {
    return onPhotoSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostEvent value)? addNewPost,
    TResult Function(OnPhotoSelectedEvent value)? onPhotoSelected,
    TResult Function(OnVideoSelectedEvent value)? onVideoSelected,
    TResult Function(OnUploadPostEvent value)? uploadPost,
    TResult Function(OnEditedImageEvent value)? editedImage,
    required TResult orElse(),
  }) {
    if (onPhotoSelected != null) {
      return onPhotoSelected(this);
    }
    return orElse();
  }
}

abstract class OnPhotoSelectedEvent implements AddPostEvent {
  const factory OnPhotoSelectedEvent(final String imageFilePath) =
      _$OnPhotoSelectedEvent;

  String get imageFilePath;
  @JsonKey(ignore: true)
  _$$OnPhotoSelectedEventCopyWith<_$OnPhotoSelectedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnVideoSelectedEventCopyWith<$Res> {
  factory _$$OnVideoSelectedEventCopyWith(_$OnVideoSelectedEvent value,
          $Res Function(_$OnVideoSelectedEvent) then) =
      __$$OnVideoSelectedEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String videoFilePath});
}

/// @nodoc
class __$$OnVideoSelectedEventCopyWithImpl<$Res>
    extends _$AddPostEventCopyWithImpl<$Res, _$OnVideoSelectedEvent>
    implements _$$OnVideoSelectedEventCopyWith<$Res> {
  __$$OnVideoSelectedEventCopyWithImpl(_$OnVideoSelectedEvent _value,
      $Res Function(_$OnVideoSelectedEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoFilePath = null,
  }) {
    return _then(_$OnVideoSelectedEvent(
      null == videoFilePath
          ? _value.videoFilePath
          : videoFilePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnVideoSelectedEvent
    with DiagnosticableTreeMixin
    implements OnVideoSelectedEvent {
  const _$OnVideoSelectedEvent(this.videoFilePath);

  @override
  final String videoFilePath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddPostEvent.onVideoSelected(videoFilePath: $videoFilePath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddPostEvent.onVideoSelected'))
      ..add(DiagnosticsProperty('videoFilePath', videoFilePath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnVideoSelectedEvent &&
            (identical(other.videoFilePath, videoFilePath) ||
                other.videoFilePath == videoFilePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoFilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnVideoSelectedEventCopyWith<_$OnVideoSelectedEvent> get copyWith =>
      __$$OnVideoSelectedEventCopyWithImpl<_$OnVideoSelectedEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageSource imageSource, String userUid)
        addNewPost,
    required TResult Function(String imageFilePath) onPhotoSelected,
    required TResult Function(String videoFilePath) onVideoSelected,
    required TResult Function(
            String placeInfo, String description, List<String> tags)
        uploadPost,
    required TResult Function(Uint8List imageData) editedImage,
  }) {
    return onVideoSelected(videoFilePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult? Function(String imageFilePath)? onPhotoSelected,
    TResult? Function(String videoFilePath)? onVideoSelected,
    TResult? Function(String placeInfo, String description, List<String> tags)?
        uploadPost,
    TResult? Function(Uint8List imageData)? editedImage,
  }) {
    return onVideoSelected?.call(videoFilePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult Function(String imageFilePath)? onPhotoSelected,
    TResult Function(String videoFilePath)? onVideoSelected,
    TResult Function(String placeInfo, String description, List<String> tags)?
        uploadPost,
    TResult Function(Uint8List imageData)? editedImage,
    required TResult orElse(),
  }) {
    if (onVideoSelected != null) {
      return onVideoSelected(videoFilePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddNewPostEvent value) addNewPost,
    required TResult Function(OnPhotoSelectedEvent value) onPhotoSelected,
    required TResult Function(OnVideoSelectedEvent value) onVideoSelected,
    required TResult Function(OnUploadPostEvent value) uploadPost,
    required TResult Function(OnEditedImageEvent value) editedImage,
  }) {
    return onVideoSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostEvent value)? addNewPost,
    TResult? Function(OnPhotoSelectedEvent value)? onPhotoSelected,
    TResult? Function(OnVideoSelectedEvent value)? onVideoSelected,
    TResult? Function(OnUploadPostEvent value)? uploadPost,
    TResult? Function(OnEditedImageEvent value)? editedImage,
  }) {
    return onVideoSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostEvent value)? addNewPost,
    TResult Function(OnPhotoSelectedEvent value)? onPhotoSelected,
    TResult Function(OnVideoSelectedEvent value)? onVideoSelected,
    TResult Function(OnUploadPostEvent value)? uploadPost,
    TResult Function(OnEditedImageEvent value)? editedImage,
    required TResult orElse(),
  }) {
    if (onVideoSelected != null) {
      return onVideoSelected(this);
    }
    return orElse();
  }
}

abstract class OnVideoSelectedEvent implements AddPostEvent {
  const factory OnVideoSelectedEvent(final String videoFilePath) =
      _$OnVideoSelectedEvent;

  String get videoFilePath;
  @JsonKey(ignore: true)
  _$$OnVideoSelectedEventCopyWith<_$OnVideoSelectedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnUploadPostEventCopyWith<$Res> {
  factory _$$OnUploadPostEventCopyWith(
          _$OnUploadPostEvent value, $Res Function(_$OnUploadPostEvent) then) =
      __$$OnUploadPostEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String placeInfo, String description, List<String> tags});
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
    Object? placeInfo = null,
    Object? description = null,
    Object? tags = null,
  }) {
    return _then(_$OnUploadPostEvent(
      null == placeInfo
          ? _value.placeInfo
          : placeInfo // ignore: cast_nullable_to_non_nullable
              as String,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$OnUploadPostEvent
    with DiagnosticableTreeMixin
    implements OnUploadPostEvent {
  const _$OnUploadPostEvent(
      this.placeInfo, this.description, final List<String> tags)
      : _tags = tags;

  @override
  final String placeInfo;
  @override
  final String description;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddPostEvent.uploadPost(placeInfo: $placeInfo, description: $description, tags: $tags)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddPostEvent.uploadPost'))
      ..add(DiagnosticsProperty('placeInfo', placeInfo))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('tags', tags));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUploadPostEvent &&
            (identical(other.placeInfo, placeInfo) ||
                other.placeInfo == placeInfo) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(runtimeType, placeInfo, description,
      const DeepCollectionEquality().hash(_tags));

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
    required TResult Function(String imageFilePath) onPhotoSelected,
    required TResult Function(String videoFilePath) onVideoSelected,
    required TResult Function(
            String placeInfo, String description, List<String> tags)
        uploadPost,
    required TResult Function(Uint8List imageData) editedImage,
  }) {
    return uploadPost(placeInfo, description, tags);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult? Function(String imageFilePath)? onPhotoSelected,
    TResult? Function(String videoFilePath)? onVideoSelected,
    TResult? Function(String placeInfo, String description, List<String> tags)?
        uploadPost,
    TResult? Function(Uint8List imageData)? editedImage,
  }) {
    return uploadPost?.call(placeInfo, description, tags);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult Function(String imageFilePath)? onPhotoSelected,
    TResult Function(String videoFilePath)? onVideoSelected,
    TResult Function(String placeInfo, String description, List<String> tags)?
        uploadPost,
    TResult Function(Uint8List imageData)? editedImage,
    required TResult orElse(),
  }) {
    if (uploadPost != null) {
      return uploadPost(placeInfo, description, tags);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddNewPostEvent value) addNewPost,
    required TResult Function(OnPhotoSelectedEvent value) onPhotoSelected,
    required TResult Function(OnVideoSelectedEvent value) onVideoSelected,
    required TResult Function(OnUploadPostEvent value) uploadPost,
    required TResult Function(OnEditedImageEvent value) editedImage,
  }) {
    return uploadPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostEvent value)? addNewPost,
    TResult? Function(OnPhotoSelectedEvent value)? onPhotoSelected,
    TResult? Function(OnVideoSelectedEvent value)? onVideoSelected,
    TResult? Function(OnUploadPostEvent value)? uploadPost,
    TResult? Function(OnEditedImageEvent value)? editedImage,
  }) {
    return uploadPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostEvent value)? addNewPost,
    TResult Function(OnPhotoSelectedEvent value)? onPhotoSelected,
    TResult Function(OnVideoSelectedEvent value)? onVideoSelected,
    TResult Function(OnUploadPostEvent value)? uploadPost,
    TResult Function(OnEditedImageEvent value)? editedImage,
    required TResult orElse(),
  }) {
    if (uploadPost != null) {
      return uploadPost(this);
    }
    return orElse();
  }
}

abstract class OnUploadPostEvent implements AddPostEvent {
  const factory OnUploadPostEvent(final String placeInfo,
      final String description, final List<String> tags) = _$OnUploadPostEvent;

  String get placeInfo;
  String get description;
  List<String> get tags;
  @JsonKey(ignore: true)
  _$$OnUploadPostEventCopyWith<_$OnUploadPostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnEditedImageEventCopyWith<$Res> {
  factory _$$OnEditedImageEventCopyWith(_$OnEditedImageEvent value,
          $Res Function(_$OnEditedImageEvent) then) =
      __$$OnEditedImageEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List imageData});
}

/// @nodoc
class __$$OnEditedImageEventCopyWithImpl<$Res>
    extends _$AddPostEventCopyWithImpl<$Res, _$OnEditedImageEvent>
    implements _$$OnEditedImageEventCopyWith<$Res> {
  __$$OnEditedImageEventCopyWithImpl(
      _$OnEditedImageEvent _value, $Res Function(_$OnEditedImageEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageData = null,
  }) {
    return _then(_$OnEditedImageEvent(
      null == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$OnEditedImageEvent
    with DiagnosticableTreeMixin
    implements OnEditedImageEvent {
  const _$OnEditedImageEvent(this.imageData);

  @override
  final Uint8List imageData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddPostEvent.editedImage(imageData: $imageData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddPostEvent.editedImage'))
      ..add(DiagnosticsProperty('imageData', imageData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnEditedImageEvent &&
            const DeepCollectionEquality().equals(other.imageData, imageData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(imageData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnEditedImageEventCopyWith<_$OnEditedImageEvent> get copyWith =>
      __$$OnEditedImageEventCopyWithImpl<_$OnEditedImageEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageSource imageSource, String userUid)
        addNewPost,
    required TResult Function(String imageFilePath) onPhotoSelected,
    required TResult Function(String videoFilePath) onVideoSelected,
    required TResult Function(
            String placeInfo, String description, List<String> tags)
        uploadPost,
    required TResult Function(Uint8List imageData) editedImage,
  }) {
    return editedImage(imageData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult? Function(String imageFilePath)? onPhotoSelected,
    TResult? Function(String videoFilePath)? onVideoSelected,
    TResult? Function(String placeInfo, String description, List<String> tags)?
        uploadPost,
    TResult? Function(Uint8List imageData)? editedImage,
  }) {
    return editedImage?.call(imageData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageSource imageSource, String userUid)? addNewPost,
    TResult Function(String imageFilePath)? onPhotoSelected,
    TResult Function(String videoFilePath)? onVideoSelected,
    TResult Function(String placeInfo, String description, List<String> tags)?
        uploadPost,
    TResult Function(Uint8List imageData)? editedImage,
    required TResult orElse(),
  }) {
    if (editedImage != null) {
      return editedImage(imageData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAddNewPostEvent value) addNewPost,
    required TResult Function(OnPhotoSelectedEvent value) onPhotoSelected,
    required TResult Function(OnVideoSelectedEvent value) onVideoSelected,
    required TResult Function(OnUploadPostEvent value) uploadPost,
    required TResult Function(OnEditedImageEvent value) editedImage,
  }) {
    return editedImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnAddNewPostEvent value)? addNewPost,
    TResult? Function(OnPhotoSelectedEvent value)? onPhotoSelected,
    TResult? Function(OnVideoSelectedEvent value)? onVideoSelected,
    TResult? Function(OnUploadPostEvent value)? uploadPost,
    TResult? Function(OnEditedImageEvent value)? editedImage,
  }) {
    return editedImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAddNewPostEvent value)? addNewPost,
    TResult Function(OnPhotoSelectedEvent value)? onPhotoSelected,
    TResult Function(OnVideoSelectedEvent value)? onVideoSelected,
    TResult Function(OnUploadPostEvent value)? uploadPost,
    TResult Function(OnEditedImageEvent value)? editedImage,
    required TResult orElse(),
  }) {
    if (editedImage != null) {
      return editedImage(this);
    }
    return orElse();
  }
}

abstract class OnEditedImageEvent implements AddPostEvent {
  const factory OnEditedImageEvent(final Uint8List imageData) =
      _$OnEditedImageEvent;

  Uint8List get imageData;
  @JsonKey(ignore: true)
  _$$OnEditedImageEventCopyWith<_$OnEditedImageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddPostState {
  ImageSource? get imageSource => throw _privateConstructorUsedError;
  String? get authorPhotoUrl => throw _privateConstructorUsedError;
  Uint8List? get imageData => throw _privateConstructorUsedError;
  String? get videoFilePath => throw _privateConstructorUsedError;
  String? get placeInfo => throw _privateConstructorUsedError;
  bool get imageEditingRequired => throw _privateConstructorUsedError;
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
      Uint8List? imageData,
      String? videoFilePath,
      String? placeInfo,
      bool imageEditingRequired,
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
    Object? imageData = freezed,
    Object? videoFilePath = freezed,
    Object? placeInfo = freezed,
    Object? imageEditingRequired = null,
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
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      videoFilePath: freezed == videoFilePath
          ? _value.videoFilePath
          : videoFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      placeInfo: freezed == placeInfo
          ? _value.placeInfo
          : placeInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      imageEditingRequired: null == imageEditingRequired
          ? _value.imageEditingRequired
          : imageEditingRequired // ignore: cast_nullable_to_non_nullable
              as bool,
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
      Uint8List? imageData,
      String? videoFilePath,
      String? placeInfo,
      bool imageEditingRequired,
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
    Object? imageData = freezed,
    Object? videoFilePath = freezed,
    Object? placeInfo = freezed,
    Object? imageEditingRequired = null,
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
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      videoFilePath: freezed == videoFilePath
          ? _value.videoFilePath
          : videoFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      placeInfo: freezed == placeInfo
          ? _value.placeInfo
          : placeInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      imageEditingRequired: null == imageEditingRequired
          ? _value.imageEditingRequired
          : imageEditingRequired // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$_AddPostState extends _AddPostState with DiagnosticableTreeMixin {
  const _$_AddPostState(
      {this.imageSource = null,
      this.authorPhotoUrl,
      this.imageData,
      this.videoFilePath,
      this.placeInfo,
      this.imageEditingRequired = false,
      this.isPostUploading = false,
      this.isLoading = false,
      this.isPostUploadedSuccessfully = false,
      this.errorMessage})
      : super._();

  @override
  @JsonKey()
  final ImageSource? imageSource;
  @override
  final String? authorPhotoUrl;
  @override
  final Uint8List? imageData;
  @override
  final String? videoFilePath;
  @override
  final String? placeInfo;
  @override
  @JsonKey()
  final bool imageEditingRequired;
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddPostState(imageSource: $imageSource, authorPhotoUrl: $authorPhotoUrl, imageData: $imageData, videoFilePath: $videoFilePath, placeInfo: $placeInfo, imageEditingRequired: $imageEditingRequired, isPostUploading: $isPostUploading, isLoading: $isLoading, isPostUploadedSuccessfully: $isPostUploadedSuccessfully, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddPostState'))
      ..add(DiagnosticsProperty('imageSource', imageSource))
      ..add(DiagnosticsProperty('authorPhotoUrl', authorPhotoUrl))
      ..add(DiagnosticsProperty('imageData', imageData))
      ..add(DiagnosticsProperty('videoFilePath', videoFilePath))
      ..add(DiagnosticsProperty('placeInfo', placeInfo))
      ..add(DiagnosticsProperty('imageEditingRequired', imageEditingRequired))
      ..add(DiagnosticsProperty('isPostUploading', isPostUploading))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty(
          'isPostUploadedSuccessfully', isPostUploadedSuccessfully))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
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
            const DeepCollectionEquality().equals(other.imageData, imageData) &&
            (identical(other.videoFilePath, videoFilePath) ||
                other.videoFilePath == videoFilePath) &&
            (identical(other.placeInfo, placeInfo) ||
                other.placeInfo == placeInfo) &&
            (identical(other.imageEditingRequired, imageEditingRequired) ||
                other.imageEditingRequired == imageEditingRequired) &&
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
      const DeepCollectionEquality().hash(imageData),
      videoFilePath,
      placeInfo,
      imageEditingRequired,
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

abstract class _AddPostState extends AddPostState {
  const factory _AddPostState(
      {final ImageSource? imageSource,
      final String? authorPhotoUrl,
      final Uint8List? imageData,
      final String? videoFilePath,
      final String? placeInfo,
      final bool imageEditingRequired,
      final bool isPostUploading,
      final bool isLoading,
      final bool isPostUploadedSuccessfully,
      final String? errorMessage}) = _$_AddPostState;
  const _AddPostState._() : super._();

  @override
  ImageSource? get imageSource;
  @override
  String? get authorPhotoUrl;
  @override
  Uint8List? get imageData;
  @override
  String? get videoFilePath;
  @override
  String? get placeInfo;
  @override
  bool get imageEditingRequired;
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
