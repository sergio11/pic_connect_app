// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
