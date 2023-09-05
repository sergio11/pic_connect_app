// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProfilesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) onEditProfile,
    required TResult Function(String email, String username, String bio,
            String birthDate, String country)
        onUpdateProfile,
    required TResult Function(ImageSource imageSource)
        onUpdateProfileImageEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? onEditProfile,
    TResult? Function(String email, String username, String bio,
            String birthDate, String country)?
        onUpdateProfile,
    TResult? Function(ImageSource imageSource)? onUpdateProfileImageEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? onEditProfile,
    TResult Function(String email, String username, String bio,
            String birthDate, String country)?
        onUpdateProfile,
    TResult Function(ImageSource imageSource)? onUpdateProfileImageEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnEditProfileEvent value) onEditProfile,
    required TResult Function(OnUpdateProfileEvent value) onUpdateProfile,
    required TResult Function(OnUpdateProfileImageEvent value)
        onUpdateProfileImageEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnEditProfileEvent value)? onEditProfile,
    TResult? Function(OnUpdateProfileEvent value)? onUpdateProfile,
    TResult? Function(OnUpdateProfileImageEvent value)?
        onUpdateProfileImageEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnEditProfileEvent value)? onEditProfile,
    TResult Function(OnUpdateProfileEvent value)? onUpdateProfile,
    TResult Function(OnUpdateProfileImageEvent value)?
        onUpdateProfileImageEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfilesEventCopyWith<$Res> {
  factory $EditProfilesEventCopyWith(
          EditProfilesEvent value, $Res Function(EditProfilesEvent) then) =
      _$EditProfilesEventCopyWithImpl<$Res, EditProfilesEvent>;
}

/// @nodoc
class _$EditProfilesEventCopyWithImpl<$Res, $Val extends EditProfilesEvent>
    implements $EditProfilesEventCopyWith<$Res> {
  _$EditProfilesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnEditProfileEventCopyWith<$Res> {
  factory _$$OnEditProfileEventCopyWith(_$OnEditProfileEvent value,
          $Res Function(_$OnEditProfileEvent) then) =
      __$$OnEditProfileEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$OnEditProfileEventCopyWithImpl<$Res>
    extends _$EditProfilesEventCopyWithImpl<$Res, _$OnEditProfileEvent>
    implements _$$OnEditProfileEventCopyWith<$Res> {
  __$$OnEditProfileEventCopyWithImpl(
      _$OnEditProfileEvent _value, $Res Function(_$OnEditProfileEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$OnEditProfileEvent(
      null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnEditProfileEvent implements OnEditProfileEvent {
  const _$OnEditProfileEvent(this.uid);

  @override
  final String uid;

  @override
  String toString() {
    return 'EditProfilesEvent.onEditProfile(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnEditProfileEvent &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnEditProfileEventCopyWith<_$OnEditProfileEvent> get copyWith =>
      __$$OnEditProfileEventCopyWithImpl<_$OnEditProfileEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) onEditProfile,
    required TResult Function(String email, String username, String bio,
            String birthDate, String country)
        onUpdateProfile,
    required TResult Function(ImageSource imageSource)
        onUpdateProfileImageEvent,
  }) {
    return onEditProfile(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? onEditProfile,
    TResult? Function(String email, String username, String bio,
            String birthDate, String country)?
        onUpdateProfile,
    TResult? Function(ImageSource imageSource)? onUpdateProfileImageEvent,
  }) {
    return onEditProfile?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? onEditProfile,
    TResult Function(String email, String username, String bio,
            String birthDate, String country)?
        onUpdateProfile,
    TResult Function(ImageSource imageSource)? onUpdateProfileImageEvent,
    required TResult orElse(),
  }) {
    if (onEditProfile != null) {
      return onEditProfile(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnEditProfileEvent value) onEditProfile,
    required TResult Function(OnUpdateProfileEvent value) onUpdateProfile,
    required TResult Function(OnUpdateProfileImageEvent value)
        onUpdateProfileImageEvent,
  }) {
    return onEditProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnEditProfileEvent value)? onEditProfile,
    TResult? Function(OnUpdateProfileEvent value)? onUpdateProfile,
    TResult? Function(OnUpdateProfileImageEvent value)?
        onUpdateProfileImageEvent,
  }) {
    return onEditProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnEditProfileEvent value)? onEditProfile,
    TResult Function(OnUpdateProfileEvent value)? onUpdateProfile,
    TResult Function(OnUpdateProfileImageEvent value)?
        onUpdateProfileImageEvent,
    required TResult orElse(),
  }) {
    if (onEditProfile != null) {
      return onEditProfile(this);
    }
    return orElse();
  }
}

abstract class OnEditProfileEvent implements EditProfilesEvent {
  const factory OnEditProfileEvent(final String uid) = _$OnEditProfileEvent;

  String get uid;
  @JsonKey(ignore: true)
  _$$OnEditProfileEventCopyWith<_$OnEditProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnUpdateProfileEventCopyWith<$Res> {
  factory _$$OnUpdateProfileEventCopyWith(_$OnUpdateProfileEvent value,
          $Res Function(_$OnUpdateProfileEvent) then) =
      __$$OnUpdateProfileEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String email,
      String username,
      String bio,
      String birthDate,
      String country});
}

/// @nodoc
class __$$OnUpdateProfileEventCopyWithImpl<$Res>
    extends _$EditProfilesEventCopyWithImpl<$Res, _$OnUpdateProfileEvent>
    implements _$$OnUpdateProfileEventCopyWith<$Res> {
  __$$OnUpdateProfileEventCopyWithImpl(_$OnUpdateProfileEvent _value,
      $Res Function(_$OnUpdateProfileEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
    Object? bio = null,
    Object? birthDate = null,
    Object? country = null,
  }) {
    return _then(_$OnUpdateProfileEvent(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnUpdateProfileEvent implements OnUpdateProfileEvent {
  const _$OnUpdateProfileEvent(
      {required this.email,
      required this.username,
      required this.bio,
      required this.birthDate,
      required this.country});

  @override
  final String email;
  @override
  final String username;
  @override
  final String bio;
  @override
  final String birthDate;
  @override
  final String country;

  @override
  String toString() {
    return 'EditProfilesEvent.onUpdateProfile(email: $email, username: $username, bio: $bio, birthDate: $birthDate, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUpdateProfileEvent &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, username, bio, birthDate, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnUpdateProfileEventCopyWith<_$OnUpdateProfileEvent> get copyWith =>
      __$$OnUpdateProfileEventCopyWithImpl<_$OnUpdateProfileEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) onEditProfile,
    required TResult Function(String email, String username, String bio,
            String birthDate, String country)
        onUpdateProfile,
    required TResult Function(ImageSource imageSource)
        onUpdateProfileImageEvent,
  }) {
    return onUpdateProfile(email, username, bio, birthDate, country);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? onEditProfile,
    TResult? Function(String email, String username, String bio,
            String birthDate, String country)?
        onUpdateProfile,
    TResult? Function(ImageSource imageSource)? onUpdateProfileImageEvent,
  }) {
    return onUpdateProfile?.call(email, username, bio, birthDate, country);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? onEditProfile,
    TResult Function(String email, String username, String bio,
            String birthDate, String country)?
        onUpdateProfile,
    TResult Function(ImageSource imageSource)? onUpdateProfileImageEvent,
    required TResult orElse(),
  }) {
    if (onUpdateProfile != null) {
      return onUpdateProfile(email, username, bio, birthDate, country);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnEditProfileEvent value) onEditProfile,
    required TResult Function(OnUpdateProfileEvent value) onUpdateProfile,
    required TResult Function(OnUpdateProfileImageEvent value)
        onUpdateProfileImageEvent,
  }) {
    return onUpdateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnEditProfileEvent value)? onEditProfile,
    TResult? Function(OnUpdateProfileEvent value)? onUpdateProfile,
    TResult? Function(OnUpdateProfileImageEvent value)?
        onUpdateProfileImageEvent,
  }) {
    return onUpdateProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnEditProfileEvent value)? onEditProfile,
    TResult Function(OnUpdateProfileEvent value)? onUpdateProfile,
    TResult Function(OnUpdateProfileImageEvent value)?
        onUpdateProfileImageEvent,
    required TResult orElse(),
  }) {
    if (onUpdateProfile != null) {
      return onUpdateProfile(this);
    }
    return orElse();
  }
}

abstract class OnUpdateProfileEvent implements EditProfilesEvent {
  const factory OnUpdateProfileEvent(
      {required final String email,
      required final String username,
      required final String bio,
      required final String birthDate,
      required final String country}) = _$OnUpdateProfileEvent;

  String get email;
  String get username;
  String get bio;
  String get birthDate;
  String get country;
  @JsonKey(ignore: true)
  _$$OnUpdateProfileEventCopyWith<_$OnUpdateProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnUpdateProfileImageEventCopyWith<$Res> {
  factory _$$OnUpdateProfileImageEventCopyWith(
          _$OnUpdateProfileImageEvent value,
          $Res Function(_$OnUpdateProfileImageEvent) then) =
      __$$OnUpdateProfileImageEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageSource imageSource});
}

/// @nodoc
class __$$OnUpdateProfileImageEventCopyWithImpl<$Res>
    extends _$EditProfilesEventCopyWithImpl<$Res, _$OnUpdateProfileImageEvent>
    implements _$$OnUpdateProfileImageEventCopyWith<$Res> {
  __$$OnUpdateProfileImageEventCopyWithImpl(_$OnUpdateProfileImageEvent _value,
      $Res Function(_$OnUpdateProfileImageEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageSource = null,
  }) {
    return _then(_$OnUpdateProfileImageEvent(
      null == imageSource
          ? _value.imageSource
          : imageSource // ignore: cast_nullable_to_non_nullable
              as ImageSource,
    ));
  }
}

/// @nodoc

class _$OnUpdateProfileImageEvent implements OnUpdateProfileImageEvent {
  const _$OnUpdateProfileImageEvent(this.imageSource);

  @override
  final ImageSource imageSource;

  @override
  String toString() {
    return 'EditProfilesEvent.onUpdateProfileImageEvent(imageSource: $imageSource)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUpdateProfileImageEvent &&
            (identical(other.imageSource, imageSource) ||
                other.imageSource == imageSource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageSource);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnUpdateProfileImageEventCopyWith<_$OnUpdateProfileImageEvent>
      get copyWith => __$$OnUpdateProfileImageEventCopyWithImpl<
          _$OnUpdateProfileImageEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) onEditProfile,
    required TResult Function(String email, String username, String bio,
            String birthDate, String country)
        onUpdateProfile,
    required TResult Function(ImageSource imageSource)
        onUpdateProfileImageEvent,
  }) {
    return onUpdateProfileImageEvent(imageSource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? onEditProfile,
    TResult? Function(String email, String username, String bio,
            String birthDate, String country)?
        onUpdateProfile,
    TResult? Function(ImageSource imageSource)? onUpdateProfileImageEvent,
  }) {
    return onUpdateProfileImageEvent?.call(imageSource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? onEditProfile,
    TResult Function(String email, String username, String bio,
            String birthDate, String country)?
        onUpdateProfile,
    TResult Function(ImageSource imageSource)? onUpdateProfileImageEvent,
    required TResult orElse(),
  }) {
    if (onUpdateProfileImageEvent != null) {
      return onUpdateProfileImageEvent(imageSource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnEditProfileEvent value) onEditProfile,
    required TResult Function(OnUpdateProfileEvent value) onUpdateProfile,
    required TResult Function(OnUpdateProfileImageEvent value)
        onUpdateProfileImageEvent,
  }) {
    return onUpdateProfileImageEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnEditProfileEvent value)? onEditProfile,
    TResult? Function(OnUpdateProfileEvent value)? onUpdateProfile,
    TResult? Function(OnUpdateProfileImageEvent value)?
        onUpdateProfileImageEvent,
  }) {
    return onUpdateProfileImageEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnEditProfileEvent value)? onEditProfile,
    TResult Function(OnUpdateProfileEvent value)? onUpdateProfile,
    TResult Function(OnUpdateProfileImageEvent value)?
        onUpdateProfileImageEvent,
    required TResult orElse(),
  }) {
    if (onUpdateProfileImageEvent != null) {
      return onUpdateProfileImageEvent(this);
    }
    return orElse();
  }
}

abstract class OnUpdateProfileImageEvent implements EditProfilesEvent {
  const factory OnUpdateProfileImageEvent(final ImageSource imageSource) =
      _$OnUpdateProfileImageEvent;

  ImageSource get imageSource;
  @JsonKey(ignore: true)
  _$$OnUpdateProfileImageEventCopyWith<_$OnUpdateProfileImageEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EditProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  Uint8List? get image => throw _privateConstructorUsedError;
  bool get allowUserInput => throw _privateConstructorUsedError;
  String get userUid => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get birthDate => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileStateCopyWith<EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res, EditProfileState>;
  @useResult
  $Res call(
      {bool isLoading,
      Uint8List? image,
      bool allowUserInput,
      String userUid,
      String username,
      String email,
      String bio,
      String photoUrl,
      String country,
      String birthDate,
      String? errorMessage});
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res, $Val extends EditProfileState>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? image = freezed,
    Object? allowUserInput = null,
    Object? userUid = null,
    Object? username = null,
    Object? email = null,
    Object? bio = null,
    Object? photoUrl = null,
    Object? country = null,
    Object? birthDate = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      allowUserInput: null == allowUserInput
          ? _value.allowUserInput
          : allowUserInput // ignore: cast_nullable_to_non_nullable
              as bool,
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditProfileStateCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory _$$_EditProfileStateCopyWith(
          _$_EditProfileState value, $Res Function(_$_EditProfileState) then) =
      __$$_EditProfileStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Uint8List? image,
      bool allowUserInput,
      String userUid,
      String username,
      String email,
      String bio,
      String photoUrl,
      String country,
      String birthDate,
      String? errorMessage});
}

/// @nodoc
class __$$_EditProfileStateCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$_EditProfileState>
    implements _$$_EditProfileStateCopyWith<$Res> {
  __$$_EditProfileStateCopyWithImpl(
      _$_EditProfileState _value, $Res Function(_$_EditProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? image = freezed,
    Object? allowUserInput = null,
    Object? userUid = null,
    Object? username = null,
    Object? email = null,
    Object? bio = null,
    Object? photoUrl = null,
    Object? country = null,
    Object? birthDate = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_EditProfileState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      allowUserInput: null == allowUserInput
          ? _value.allowUserInput
          : allowUserInput // ignore: cast_nullable_to_non_nullable
              as bool,
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EditProfileState implements _EditProfileState {
  const _$_EditProfileState(
      {this.isLoading = false,
      this.image,
      this.allowUserInput = true,
      this.userUid = "",
      this.username = "",
      this.email = "",
      this.bio = "",
      this.photoUrl = "",
      this.country = "",
      this.birthDate = "",
      this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Uint8List? image;
  @override
  @JsonKey()
  final bool allowUserInput;
  @override
  @JsonKey()
  final String userUid;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String bio;
  @override
  @JsonKey()
  final String photoUrl;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey()
  final String birthDate;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'EditProfileState(isLoading: $isLoading, image: $image, allowUserInput: $allowUserInput, userUid: $userUid, username: $username, email: $email, bio: $bio, photoUrl: $photoUrl, country: $country, birthDate: $birthDate, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditProfileState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.allowUserInput, allowUserInput) ||
                other.allowUserInput == allowUserInput) &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(image),
      allowUserInput,
      userUid,
      username,
      email,
      bio,
      photoUrl,
      country,
      birthDate,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditProfileStateCopyWith<_$_EditProfileState> get copyWith =>
      __$$_EditProfileStateCopyWithImpl<_$_EditProfileState>(this, _$identity);
}

abstract class _EditProfileState implements EditProfileState {
  const factory _EditProfileState(
      {final bool isLoading,
      final Uint8List? image,
      final bool allowUserInput,
      final String userUid,
      final String username,
      final String email,
      final String bio,
      final String photoUrl,
      final String country,
      final String birthDate,
      final String? errorMessage}) = _$_EditProfileState;

  @override
  bool get isLoading;
  @override
  Uint8List? get image;
  @override
  bool get allowUserInput;
  @override
  String get userUid;
  @override
  String get username;
  @override
  String get email;
  @override
  String get bio;
  @override
  String get photoUrl;
  @override
  String get country;
  @override
  String get birthDate;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_EditProfileStateCopyWith<_$_EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
