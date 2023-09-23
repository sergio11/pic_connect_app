import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get_it/get_it.dart';
import 'package:pic_connect/data/datasource/auth_datasource.dart';
import 'package:pic_connect/data/datasource/chat_datasource.dart';
import 'package:pic_connect/data/datasource/dto/comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/post_dto.dart';
import 'package:pic_connect/data/datasource/dto/room_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_user_dto.dart';
import 'package:pic_connect/data/datasource/dto/update_post_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/data/datasource/impl/auth_datasource_impl.dart';
import 'package:pic_connect/data/datasource/impl/chat_datasource_impl.dart';
import 'package:pic_connect/data/datasource/impl/post_datasource_impl.dart';
import 'package:pic_connect/data/datasource/impl/storage_datasource_impl.dart';
import 'package:pic_connect/data/datasource/impl/user_datasource_impl.dart';
import 'package:pic_connect/data/datasource/mapper/comment_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/post_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/room_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/save_post_comment_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/save_post_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/save_user_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/update_post_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/user_chat_dto_mapper.dart';
import 'package:pic_connect/data/datasource/mapper/user_dto_mapper.dart';
import 'package:pic_connect/data/datasource/post_datasource.dart';
import 'package:pic_connect/data/datasource/storage_datasource.dart';
import 'package:pic_connect/data/datasource/user_datasource.dart';
import 'package:pic_connect/data/mapper/comment_bo_mapper.dart';
import 'package:pic_connect/data/mapper/post_bo_mapper.dart';
import 'package:pic_connect/data/mapper/room_bo_mapper.dart';
import 'package:pic_connect/data/mapper/user_bo_mapper.dart';
import 'package:pic_connect/data/repository/auth_repository_impl.dart';
import 'package:pic_connect/data/repository/chat_repository_impl.dart';
import 'package:pic_connect/data/repository/post_repository_impl.dart';
import 'package:pic_connect/data/repository/user_repository_impl.dart';
import 'package:pic_connect/domain/models/comment.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/models/room.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/repository/chat_repository.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/repository/user_repository.dart';
import 'package:pic_connect/domain/usecase/create_new_roow_use_case.dart';
import 'package:pic_connect/domain/usecase/delete_post_use_case.dart';
import 'package:pic_connect/domain/usecase/delete_room_use_case.dart';
import 'package:pic_connect/domain/usecase/fetch_moments_by_user_use_case.dart';
import 'package:pic_connect/domain/usecase/fetch_moments_from_followed_users_last_24_hours_use_case.dart';
import 'package:pic_connect/domain/usecase/fetch_user_home_feed_use_case.dart';
import 'package:pic_connect/domain/usecase/find_all_comments_by_post_use_case.dart';
import 'package:pic_connect/domain/usecase/find_all_that_user_is_following_by_use_case.dart';
import 'package:pic_connect/domain/usecase/find_all_users_use_case.dart';
import 'package:pic_connect/domain/usecase/find_bookmark_posts_by_user_use_case.dart';
import 'package:pic_connect/domain/usecase/find_favorites_posts_by_user_use_case.dart';
import 'package:pic_connect/domain/usecase/find_followers_by_user_use_case.dart';
import 'package:pic_connect/domain/usecase/find_post_by_id_use_case.dart';
import 'package:pic_connect/domain/usecase/find_posts_by_user_use_case.dart';
import 'package:pic_connect/domain/usecase/find_posts_order_by_date_published_use_case.dart';
import 'package:pic_connect/domain/usecase/find_user_auth_rooms_use_case.dart';
import 'package:pic_connect/domain/usecase/find_users_by_name_use_case.dart';
import 'package:pic_connect/domain/usecase/follow_user_use_case.dart';
import 'package:pic_connect/domain/usecase/get_top_reels_with_most_likes_use_case.dart';
import 'package:pic_connect/domain/usecase/get_user_details_use_case.dart';
import 'package:pic_connect/domain/usecase/get_auth_user_uid_use_case.dart';
import 'package:pic_connect/domain/usecase/like_post_use_case.dart';
import 'package:pic_connect/domain/usecase/publish_comment_use_case.dart';
import 'package:pic_connect/domain/usecase/publish_post_use_case.dart';
import 'package:pic_connect/domain/usecase/save_bookmark_use_case.dart';
import 'package:pic_connect/domain/usecase/sign_in_user_use_case.dart';
import 'package:pic_connect/domain/usecase/sign_out_use_case.dart';
import 'package:pic_connect/domain/usecase/sign_up_user_use_case.dart';
import 'package:pic_connect/domain/usecase/unfollow_user_use_case.dart';
import 'package:pic_connect/domain/usecase/update_post_use_case.dart';
import 'package:pic_connect/domain/usecase/update_user_use_case.dart';
import 'package:pic_connect/features/add/add_post_bloc.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/chat/create/create_room_bloc.dart';
import 'package:pic_connect/features/chat/rooms/rooms_bloc.dart';
import 'package:pic_connect/features/comments/comments_bloc.dart';
import 'package:pic_connect/features/editpost/edit_post_bloc.dart';
import 'package:pic_connect/features/editprofile/edit_profile_bloc.dart';
import 'package:pic_connect/features/feed/feed_bloc.dart';
import 'package:pic_connect/features/followers/followers_bloc.dart';
import 'package:pic_connect/features/postcard/post_card_bloc.dart';
import 'package:pic_connect/features/profile/profile_bloc.dart';
import 'package:pic_connect/features/publications/publications_bloc.dart';
import 'package:pic_connect/features/reels/reels_bloc.dart';
import 'package:pic_connect/features/search/search_bloc.dart';
import 'package:pic_connect/features/signin/signin_bloc.dart';
import 'package:pic_connect/features/signup/signup_bloc.dart';
import 'package:pic_connect/utils/full_mapper.dart';
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
  serviceLocator
      .registerLazySingleton<FirebaseChatCore>(() => FirebaseChatCore.instance);

  // Mappers //
  serviceLocator.registerFactory<Mapper<DocumentSnapshot, UserDTO>>(
      () => UserDtoMapper());
  serviceLocator.registerFactory<Mapper<SaveUserDTO, Map<String, dynamic>>>(
      () => SaveUserDtoMapper());
  serviceLocator
      .registerFactory<Mapper<SavePostCommentDTO, Map<String, dynamic>>>(
          () => SavePostCommentDTOMapper());
  serviceLocator.registerFactory<Mapper<CreatePostDTO, Map<String, dynamic>>>(
      () => SavePostDtoMapper());
  serviceLocator.registerFactory<Mapper<UpdatePostDTO, Map<String, dynamic>>>(
      () => UpdatePostDtoMapper());
  serviceLocator.registerFactory<Mapper<UserDTO, UserBO>>(() => UserBoMapper());
  serviceLocator
      .registerFactory<Mapper<PostBoMapperData, PostBO>>(() => PostBoMapper());
  serviceLocator.registerFactory<Mapper<CommentBoMapperData, CommentBO>>(
      () => CommentBoMapper(userMapper: serviceLocator()));
  serviceLocator.registerFactory<Mapper<DocumentSnapshot, CommentDTO>>(
      () => CommentDtoMapper());
  serviceLocator.registerFactory<Mapper<DocumentSnapshot, PostDTO>>(
      () => PostDtoMapper());
  serviceLocator.registerFactory<Mapper<Room, RoomDTO>>(() => RoomDtoMapper());
  serviceLocator
      .registerFactory<FullMapper<User, UserDTO>>(() => UserChatDtoMapper());
  serviceLocator.registerFactory<Mapper<RoomBoMapperDataInput, RoomBO>>(() => RoomBoMapper());
  // DataSources //
  serviceLocator.registerLazySingleton<UserDatasource>(() => UserDatasourceImpl(
      firestore: serviceLocator(),
      userDtoMapper: serviceLocator(),
      saveUserDtoMapper: serviceLocator()));
  serviceLocator.registerLazySingleton<AuthDatasource>(
      () => AuthDatasourceImpl(auth: serviceLocator()));
  serviceLocator.registerLazySingleton<PostDatasource>(() => PostDatasourceImpl(
      firestore: serviceLocator(),
      savePostCommentMapper: serviceLocator(),
      savePostMapper: serviceLocator(),
      commentMapper: serviceLocator(),
      postMapper: serviceLocator(),
      updatePostMapper: serviceLocator()));
  serviceLocator.registerLazySingleton<StorageDatasource>(
      () => StorageDatasourceImpl(storage: serviceLocator()));
  serviceLocator.registerLazySingleton<ChatDatasource>(() => ChatDatasourceImpl(
      firebaseChatCore: serviceLocator(),
      userMapper: serviceLocator(),
      roomMapper: serviceLocator()));

  /// Repository ///
  serviceLocator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      userDatasource: serviceLocator(),
      userBoMapper: serviceLocator(),
      storageDatasource: serviceLocator()));
  serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authDatasource: serviceLocator(),
      userDatasource: serviceLocator(),
      storageDatasource: serviceLocator(),
      userBoMapper: serviceLocator()));
  serviceLocator.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
      postDatasource: serviceLocator(),
      storageDatasource: serviceLocator(),
      userDatasource: serviceLocator(),
      userBoMapper: serviceLocator(),
      postBoMapper: serviceLocator(),
      commentBoMapper: serviceLocator()));
  serviceLocator.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(
      userDatasource: serviceLocator(),
      chatDatasource: serviceLocator(),
      roomBoMapper: serviceLocator()));

  /// UseCase ///
  serviceLocator.registerLazySingleton(
      () => GetAuthUserUidUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => SignInUserUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => SignOutUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => SignUpUserUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => GetUserDetailsUseCase(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => FindPostsByUserUseCase(postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => FollowUserUseCase(
      authRepository: serviceLocator(), userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => UnFollowUserUseCase(
      authRepository: serviceLocator(), userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => FindUsersByNameUseCase(userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() =>
      FindPostsOrderByDatePublishedUseCase(postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => FindAllCommentsByPostUseCase(postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => FetchUserHomeFeedUseCase(
      authRepository: serviceLocator(),
      postRepository: serviceLocator(),
      userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => PublishPostUseCase(
      postRepository: serviceLocator(), authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => DeletePostUseCase(postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => LikePostUseCase(
      postRepository: serviceLocator(), authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => PublishCommentUseCase(
      authRepository: serviceLocator(), postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => FindFavoritesPostsByUserUseCase(postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => SaveBookmarkUseCase(
      authRepository: serviceLocator(), postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => FindBookmarkPostsByUserUseCase(postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() =>
      FindAllThatUserIsFollowingByUseCase(userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => FindFollowersByUserUseCase(userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => GetTopReelsWithMostLikesUseCase(postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => UpdateUserUseCase(userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() =>
      FetchMomentsFromFollowedUsersLast24HoursUseCase(
          authRepository: serviceLocator(),
          postRepository: serviceLocator(),
          userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => FetchMomentsByUserUseCase(postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => FindPostByIdUseCase(postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => FindUserAuthRoomsUseCase(chatRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => CreateNewRoomUseCase(chatRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => FindAllUsersUseCase(userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => UpdatePostUseCase(
      authRepository: serviceLocator(), postRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => DeleteRoomUseCase(chatRepository: serviceLocator()));

  /// BloC ///
  serviceLocator
      .registerFactory(() => AppBloc(getAuthUserUidUseCase: serviceLocator()));
  serviceLocator
      .registerFactory(() => SignInBloc(signInUserUseCase: serviceLocator()));
  serviceLocator
      .registerFactory(() => SignUpBloc(signUpUserUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => FeedBloc(
      fetchUserHomeFeedUseCase: serviceLocator(),
      fetchMomentsFromFollowedUsersTodayUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => ProfileBloc(
      getUserDetailsUseCase: serviceLocator(),
      getAuthUserUidUseCase: serviceLocator(),
      signOutUseCase: serviceLocator(),
      findPostsByUserUseCase: serviceLocator(),
      followUserUseCase: serviceLocator(),
      unFollowUserUseCase: serviceLocator(),
      findFavoritesPostsByUserUseCase: serviceLocator(),
      findBookmarkPostsByUserUseCase: serviceLocator(),
      fetchMomentsByUserUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => SearchBloc(
      findUsersByNameUseCase: serviceLocator(),
      findPostsOrderByDatePublishedUseCase: serviceLocator(),
      followUserUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => AddPostBloc(
      getUserDetailsUseCase: serviceLocator(),
      publishPostUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => ReelsBloc(
      getTopReelsWithMostLikesUseCase: serviceLocator(),
      likePostUseCase: serviceLocator(),
      saveBookmarkUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => PostCardBloc(
      deletePostUseCase: serviceLocator(),
      likePostUseCase: serviceLocator(),
      saveBookmarkUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => CommentsBloc(
      findAllCommentsByPostUseCase: serviceLocator(),
      publishCommentUseCase: serviceLocator(),
      getUserDetailsUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => PublicationsBloc(
      findPostsByUserUseCase: serviceLocator(),
      findFavoritesPostsByUserUseCase: serviceLocator(),
      findBookmarkPostsByUserUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => FollowersBloc(
      findFollowersByUserUseCase: serviceLocator(),
      findAllThatUserIsFollowingByUseCase: serviceLocator(),
      followUserUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => EditProfileBloc(
      getUserDetailsUseCase: serviceLocator(),
      updateUserUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => EditPostBloc(
      findPostByIdUseCase: serviceLocator(),
      updatePostUseCase: serviceLocator()));
  serviceLocator.registerFactory(() => CreateRoomBloc(
      createNewRoomUseCase: serviceLocator(),
      findAllUsersUseCase: serviceLocator()));
  serviceLocator.registerFactory(
      () => RoomsBloc(findUserAuthRoomsUseCase: serviceLocator(), deleteRoomUseCase: serviceLocator()));
}
