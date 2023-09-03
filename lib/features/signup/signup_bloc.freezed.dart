// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String username,
            String repeatPassword)
        onDoSignUp,
    required TResult Function(ImageSource imageSource) pickUpImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String username,
            String repeatPassword)?
        onDoSignUp,
    TResult? Function(ImageSource imageSource)? pickUpImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String username,
            String repeatPassword)?
        onDoSignUp,
    TResult Function(ImageSource imageSource)? pickUpImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnDoSignUpEvent value) onDoSignUp,
    required TResult Function(OnPickUpImageEvent value) pickUpImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnDoSignUpEvent value)? onDoSignUp,
    TResult? Function(OnPickUpImageEvent value)? pickUpImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnDoSignUpEvent value)? onDoSignUp,
    TResult Function(OnPickUpImageEvent value)? pickUpImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res, SignUpEvent>;
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res, $Val extends SignUpEvent>
    implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnDoSignUpEventCopyWith<$Res> {
  factory _$$OnDoSignUpEventCopyWith(
          _$OnDoSignUpEvent value, $Res Function(_$OnDoSignUpEvent) then) =
      __$$OnDoSignUpEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String email, String password, String username, String repeatPassword});
}

/// @nodoc
class __$$OnDoSignUpEventCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$OnDoSignUpEvent>
    implements _$$OnDoSignUpEventCopyWith<$Res> {
  __$$OnDoSignUpEventCopyWithImpl(
      _$OnDoSignUpEvent _value, $Res Function(_$OnDoSignUpEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? username = null,
    Object? repeatPassword = null,
  }) {
    return _then(_$OnDoSignUpEvent(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == repeatPassword
          ? _value.repeatPassword
          : repeatPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnDoSignUpEvent
    with DiagnosticableTreeMixin
    implements OnDoSignUpEvent {
  const _$OnDoSignUpEvent(
      this.email, this.password, this.username, this.repeatPassword);

  @override
  final String email;
  @override
  final String password;
  @override
  final String username;
  @override
  final String repeatPassword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.onDoSignUp(email: $email, password: $password, username: $username, repeatPassword: $repeatPassword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpEvent.onDoSignUp'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('repeatPassword', repeatPassword));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDoSignUpEvent &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.repeatPassword, repeatPassword) ||
                other.repeatPassword == repeatPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, username, repeatPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnDoSignUpEventCopyWith<_$OnDoSignUpEvent> get copyWith =>
      __$$OnDoSignUpEventCopyWithImpl<_$OnDoSignUpEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String username,
            String repeatPassword)
        onDoSignUp,
    required TResult Function(ImageSource imageSource) pickUpImage,
  }) {
    return onDoSignUp(email, password, username, repeatPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String username,
            String repeatPassword)?
        onDoSignUp,
    TResult? Function(ImageSource imageSource)? pickUpImage,
  }) {
    return onDoSignUp?.call(email, password, username, repeatPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String username,
            String repeatPassword)?
        onDoSignUp,
    TResult Function(ImageSource imageSource)? pickUpImage,
    required TResult orElse(),
  }) {
    if (onDoSignUp != null) {
      return onDoSignUp(email, password, username, repeatPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnDoSignUpEvent value) onDoSignUp,
    required TResult Function(OnPickUpImageEvent value) pickUpImage,
  }) {
    return onDoSignUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnDoSignUpEvent value)? onDoSignUp,
    TResult? Function(OnPickUpImageEvent value)? pickUpImage,
  }) {
    return onDoSignUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnDoSignUpEvent value)? onDoSignUp,
    TResult Function(OnPickUpImageEvent value)? pickUpImage,
    required TResult orElse(),
  }) {
    if (onDoSignUp != null) {
      return onDoSignUp(this);
    }
    return orElse();
  }
}

abstract class OnDoSignUpEvent implements SignUpEvent {
  const factory OnDoSignUpEvent(final String email, final String password,
      final String username, final String repeatPassword) = _$OnDoSignUpEvent;

  String get email;
  String get password;
  String get username;
  String get repeatPassword;
  @JsonKey(ignore: true)
  _$$OnDoSignUpEventCopyWith<_$OnDoSignUpEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnPickUpImageEventCopyWith<$Res> {
  factory _$$OnPickUpImageEventCopyWith(_$OnPickUpImageEvent value,
          $Res Function(_$OnPickUpImageEvent) then) =
      __$$OnPickUpImageEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageSource imageSource});
}

/// @nodoc
class __$$OnPickUpImageEventCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$OnPickUpImageEvent>
    implements _$$OnPickUpImageEventCopyWith<$Res> {
  __$$OnPickUpImageEventCopyWithImpl(
      _$OnPickUpImageEvent _value, $Res Function(_$OnPickUpImageEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageSource = null,
  }) {
    return _then(_$OnPickUpImageEvent(
      null == imageSource
          ? _value.imageSource
          : imageSource // ignore: cast_nullable_to_non_nullable
              as ImageSource,
    ));
  }
}

/// @nodoc

class _$OnPickUpImageEvent
    with DiagnosticableTreeMixin
    implements OnPickUpImageEvent {
  const _$OnPickUpImageEvent(this.imageSource);

  @override
  final ImageSource imageSource;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.pickUpImage(imageSource: $imageSource)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpEvent.pickUpImage'))
      ..add(DiagnosticsProperty('imageSource', imageSource));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnPickUpImageEvent &&
            (identical(other.imageSource, imageSource) ||
                other.imageSource == imageSource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageSource);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnPickUpImageEventCopyWith<_$OnPickUpImageEvent> get copyWith =>
      __$$OnPickUpImageEventCopyWithImpl<_$OnPickUpImageEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String username,
            String repeatPassword)
        onDoSignUp,
    required TResult Function(ImageSource imageSource) pickUpImage,
  }) {
    return pickUpImage(imageSource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String username,
            String repeatPassword)?
        onDoSignUp,
    TResult? Function(ImageSource imageSource)? pickUpImage,
  }) {
    return pickUpImage?.call(imageSource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String username,
            String repeatPassword)?
        onDoSignUp,
    TResult Function(ImageSource imageSource)? pickUpImage,
    required TResult orElse(),
  }) {
    if (pickUpImage != null) {
      return pickUpImage(imageSource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnDoSignUpEvent value) onDoSignUp,
    required TResult Function(OnPickUpImageEvent value) pickUpImage,
  }) {
    return pickUpImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnDoSignUpEvent value)? onDoSignUp,
    TResult? Function(OnPickUpImageEvent value)? pickUpImage,
  }) {
    return pickUpImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnDoSignUpEvent value)? onDoSignUp,
    TResult Function(OnPickUpImageEvent value)? pickUpImage,
    required TResult orElse(),
  }) {
    if (pickUpImage != null) {
      return pickUpImage(this);
    }
    return orElse();
  }
}

abstract class OnPickUpImageEvent implements SignUpEvent {
  const factory OnPickUpImageEvent(final ImageSource imageSource) =
      _$OnPickUpImageEvent;

  ImageSource get imageSource;
  @JsonKey(ignore: true)
  _$$OnPickUpImageEventCopyWith<_$OnPickUpImageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpState {
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  Uint8List? get image => throw _privateConstructorUsedError;
  bool get isSignUpSuccess => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {String? email,
      String? password,
      String? username,
      String? bio,
      Uint8List? image,
      bool isSignUpSuccess,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? username = freezed,
    Object? bio = freezed,
    Object? image = freezed,
    Object? isSignUpSuccess = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      isSignUpSuccess: null == isSignUpSuccess
          ? _value.isSignUpSuccess
          : isSignUpSuccess // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$_SignUpStateCopyWith(
          _$_SignUpState value, $Res Function(_$_SignUpState) then) =
      __$$_SignUpStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? password,
      String? username,
      String? bio,
      Uint8List? image,
      bool isSignUpSuccess,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class __$$_SignUpStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$_SignUpState>
    implements _$$_SignUpStateCopyWith<$Res> {
  __$$_SignUpStateCopyWithImpl(
      _$_SignUpState _value, $Res Function(_$_SignUpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? username = freezed,
    Object? bio = freezed,
    Object? image = freezed,
    Object? isSignUpSuccess = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_SignUpState(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      isSignUpSuccess: null == isSignUpSuccess
          ? _value.isSignUpSuccess
          : isSignUpSuccess // ignore: cast_nullable_to_non_nullable
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

class _$_SignUpState with DiagnosticableTreeMixin implements _SignUpState {
  const _$_SignUpState(
      {this.email,
      this.password,
      this.username,
      this.bio,
      this.image,
      this.isSignUpSuccess = false,
      this.isLoading = false,
      this.errorMessage});

  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? username;
  @override
  final String? bio;
  @override
  final Uint8List? image;
  @override
  @JsonKey()
  final bool isSignUpSuccess;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState(email: $email, password: $password, username: $username, bio: $bio, image: $image, isSignUpSuccess: $isSignUpSuccess, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('bio', bio))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('isSignUpSuccess', isSignUpSuccess))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.isSignUpSuccess, isSignUpSuccess) ||
                other.isSignUpSuccess == isSignUpSuccess) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      password,
      username,
      bio,
      const DeepCollectionEquality().hash(image),
      isSignUpSuccess,
      isLoading,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      __$$_SignUpStateCopyWithImpl<_$_SignUpState>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  const factory _SignUpState(
      {final String? email,
      final String? password,
      final String? username,
      final String? bio,
      final Uint8List? image,
      final bool isSignUpSuccess,
      final bool isLoading,
      final String? errorMessage}) = _$_SignUpState;

  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get username;
  @override
  String? get bio;
  @override
  Uint8List? get image;
  @override
  bool get isSignUpSuccess;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
