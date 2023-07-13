import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pic_connect/data/repository/auth_repository_impl.dart';
import 'package:pic_connect/data/repository/post_repository_impl.dart';
import 'package:pic_connect/data/repository/storage_repository_impl.dart';
import 'package:pic_connect/data/repository/user_repository_impl.dart';
import 'package:pic_connect/domain/respository/auth_repository.dart';
import 'package:pic_connect/domain/respository/post_repository.dart';
import 'package:pic_connect/domain/respository/storage_repository.dart';
import 'package:pic_connect/domain/respository/user_repository.dart';
import 'package:pic_connect/domain/usecase/get_user_details_use_case.dart';
import 'package:pic_connect/domain/usecase/is_logged_in_use_case.dart';
import 'package:pic_connect/domain/usecase/sign_in_user_use_case.dart';
import 'package:pic_connect/domain/usecase/sign_out_use_case.dart';
import 'package:pic_connect/domain/usecase/sign_up_user_use_case.dart';
import 'package:pic_connect/features/feed/feed_bloc.dart';
import 'package:pic_connect/features/profile/profile_bloc.dart';
import 'package:pic_connect/features/signin/signin_bloc.dart';
import 'package:pic_connect/features/signup/signup_bloc.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() async {

  /// Data Source ///
  serviceLocator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  serviceLocator
      .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  /// Repository ///
  serviceLocator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<AuthRepository>(() =>
      AuthRepositoryImpl(serviceLocator(), serviceLocator(), serviceLocator()));
  serviceLocator.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(serviceLocator(), serviceLocator()));
  serviceLocator.registerLazySingleton<StorageRepository>(
      () => StorageRepositoryImpl(serviceLocator(), serviceLocator()));

  /// UseCase ///
  serviceLocator.registerLazySingleton(() =>
      IsLoggedInUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() =>
      SignInUserUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() =>
      SignOutUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() =>
      SignUpUserUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() =>
      GetUserDetailsUseCase(authRepository: serviceLocator()));

  /// BloC ///
  serviceLocator.registerFactory(() =>
      SignInBloc(signInUserUseCase: serviceLocator(), isLoggedInUseCase: serviceLocator()));
  serviceLocator.registerFactory(() =>
      SignUpBloc(signUpUserUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => FeedBloc());
  serviceLocator.registerFactory(() => ProfileBloc());
}
