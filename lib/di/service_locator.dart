import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pic_connect/data/datasource/auth_datasource.dart';
import 'package:pic_connect/data/datasource/dto/comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/post_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_user_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/data/datasource/impl/auth_datasource_impl.dart';
import 'package:pic_connect/data/datasource/impl/post_datasource_impl.dart';
import 'package:pic_connect/data/datasource/impl/storage_datasource_impl.dart';
import 'package:pic_connect/data/datasource/impl/user_datasource_impl.dart';
import 'package:pic_connect/data/datasource/mapper/comment_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/post_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/save_post_comment_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/save_post_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/save_user_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/user_dto_mapper.dart';
import 'package:pic_connect/data/datasource/post_datasource.dart';
import 'package:pic_connect/data/datasource/storage_datasource.dart';
import 'package:pic_connect/data/datasource/user_datasource.dart';
import 'package:pic_connect/data/mapper/comment_bo_mapper.dart';
import 'package:pic_connect/data/mapper/post_bo_mapper.dart';
import 'package:pic_connect/data/mapper/user_bo_mapper.dart';
import 'package:pic_connect/data/repository/auth_repository_impl.dart';
import 'package:pic_connect/data/repository/post_repository_impl.dart';
import 'package:pic_connect/data/repository/user_repository_impl.dart';
import 'package:pic_connect/domain/models/comment.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/repository/user_repository.dart';
import 'package:pic_connect/domain/usecase/find_all_comments_by_post_use_case.dart';
import 'package:pic_connect/domain/usecase/find_posts_by_user_use_case.dart';
import 'package:pic_connect/domain/usecase/find_posts_order_by_date_published_use_case.dart';
import 'package:pic_connect/domain/usecase/find_users_by_name_use_case.dart';
import 'package:pic_connect/domain/usecase/follow_user_use_case.dart';
import 'package:pic_connect/domain/usecase/get_user_details_use_case.dart';
import 'package:pic_connect/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:pic_connect/domain/usecase/sign_in_user_use_case.dart';
import 'package:pic_connect/domain/usecase/sign_out_use_case.dart';
import 'package:pic_connect/domain/usecase/sign_up_user_use_case.dart';
import 'package:pic_connect/domain/usecase/unfollow_user_use_case.dart';
import 'package:pic_connect/features/add/add_post_bloc.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/favorites/favorites_bloc.dart';
import 'package:pic_connect/features/feed/feed_bloc.dart';
import 'package:pic_connect/features/profile/profile_bloc.dart';
import 'package:pic_connect/features/search/search_bloc.dart';
import 'package:pic_connect/features/signin/signin_bloc.dart';
import 'package:pic_connect/features/signup/signup_bloc.dart';
import 'package:pic_connect/utils/mapper.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() async {

  /// Firebase ///
  serviceLocator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  serviceLocator
      .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  // Mappers //
  serviceLocator.registerFactory<Mapper<DocumentSnapshot, UserDTO>>(() => UserDtoMapper());
  serviceLocator.registerFactory<Mapper<SaveUserDTO, Map<String, dynamic>>>(() => SaveUserDtoMapper());
  serviceLocator.registerFactory<Mapper<SavePostCommentDTO, Map<String, dynamic>>>(() => SavePostCommentDTOMapper());
  serviceLocator.registerFactory<Mapper<SavePostDTO, Map<String, dynamic>>>(() => SavePostDtoMapper());
  serviceLocator.registerFactory<Mapper<UserDTO, UserBO>>(() => UserBoMapper());
  serviceLocator.registerFactory<Mapper<PostBoMapperData, PostBO>>(() => PostBoMapper());
  serviceLocator.registerFactory<Mapper<CommentBoMapperData, CommentBO>>(() => CommentBoMapper(userMapper: serviceLocator()));
  serviceLocator.registerFactory<Mapper<DocumentSnapshot, CommentDTO>>(() => CommentDtoMapper());
  serviceLocator.registerFactory<Mapper<DocumentSnapshot, PostDTO>>(() => PostDtoMapper());
  // DataSources //
  serviceLocator.registerLazySingleton<UserDatasource>(() => UserDatasourceImpl(firestore: serviceLocator(), userDtoMapper: serviceLocator(), saveUserDtoMapper: serviceLocator()));
  serviceLocator.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl(auth: serviceLocator()));
  serviceLocator.registerLazySingleton<PostDatasource>(() => PostDatasourceImpl(firestore: serviceLocator(), savePostCommentMapper: serviceLocator(), savePostMapper: serviceLocator(), commentMapper: serviceLocator(), postMapper: serviceLocator()));
  serviceLocator.registerLazySingleton<StorageDatasource>(() => StorageDatasourceImpl(storage: serviceLocator()));
  /// Repository ///
  serviceLocator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userDatasource: serviceLocator(), userBoMapper: serviceLocator()));
  serviceLocator.registerLazySingleton<AuthRepository>(() =>
      AuthRepositoryImpl(authDatasource: serviceLocator(), userDatasource: serviceLocator(), storageDatasource: serviceLocator(), userBoMapper: serviceLocator()));
  serviceLocator.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(postDatasource: serviceLocator(), storageDatasource: serviceLocator(), userDatasource: serviceLocator(), userBoMapper: serviceLocator(), postBoMapper: serviceLocator(), commentBoMapper: serviceLocator()));

  /// UseCase ///
  serviceLocator.registerLazySingleton(() =>
      GetAuthUserUidUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() =>
      SignInUserUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() =>
      SignOutUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() =>
      SignUpUserUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() =>
      GetUserDetailsUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => FindPostsByUserUseCase(postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => FollowUserUseCase(authRepository: serviceLocator(), userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => UnFollowUserUseCase(authRepository: serviceLocator(), userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => FindUsersByNameUseCase(userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => FindPostsOrderByDatePublishedUseCase(postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => FindAllCommentsByPostUseCase(postRepository: serviceLocator()));
  /// BloC ///
  serviceLocator.registerFactory(() => AppBloc(getAuthUserUidUseCase: serviceLocator()));
  serviceLocator.registerFactory(() =>
      SignInBloc(signInUserUseCase: serviceLocator()));
  serviceLocator.registerFactory(() =>
      SignUpBloc(signUpUserUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => FeedBloc());
  serviceLocator.registerFactory(() => ProfileBloc(getUserDetailsUseCase: serviceLocator(), getAuthUserUidUseCase: serviceLocator(), signOutUseCase: serviceLocator(), findPostsByUserUseCase: serviceLocator(), followUserUseCase: serviceLocator(), unFollowUserUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => SearchBloc(findUsersByNameUseCase: serviceLocator(), findPostsOrderByDatePublishedUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => AddPostBloc());
  serviceLocator.registerFactory(() => FavoritesBloc());
}