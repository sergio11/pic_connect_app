import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:pic_connect/di/service_locator.dart';
import 'package:pic_connect/features/add/add_post_bloc.dart';
import 'package:pic_connect/features/add/add_post_screen.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/comments/comments_bloc.dart';
import 'package:pic_connect/features/comments/comments_screen.dart';
import 'package:pic_connect/features/core/widgets/navigate_screen.dart';
import 'package:pic_connect/features/editprofile/edit_profile_bloc.dart';
import 'package:pic_connect/features/editprofile/edit_profile_screen.dart';
import 'package:pic_connect/features/feed/feed_bloc.dart';
import 'package:pic_connect/features/feed/feed_screen.dart';
import 'package:pic_connect/features/followers/followers_bloc.dart';
import 'package:pic_connect/features/followers/followers_screen.dart';
import 'package:pic_connect/features/notfound/not_found_page.dart';
import 'package:pic_connect/features/onboarding/onboarding_screen.dart';
import 'package:pic_connect/features/profile/profile_bloc.dart';
import 'package:pic_connect/features/profile/profile_screen.dart';
import 'package:pic_connect/features/publications/publications_bloc.dart';
import 'package:pic_connect/features/publications/publications_screen.dart';
import 'package:pic_connect/features/reels/reels_bloc.dart';
import 'package:pic_connect/features/search/search_bloc.dart';
import 'package:pic_connect/features/search/search_screen.dart';
import 'package:pic_connect/features/signin/signin_bloc.dart';
import 'package:pic_connect/features/signin/signin_screen.dart';
import 'package:pic_connect/features/signup/signup_bloc.dart';
import 'package:pic_connect/features/signup/signup_screen.dart';
import 'package:pic_connect/routes/core/common_transition_page.dart';
import 'package:pic_connect/routes/route_utils.dart';
import 'package:pic_connect/routes/router_refresh_stream.dart';
import 'package:pic_connect/utils/utils.dart';

import '../features/reels/reels_screen.dart';

class AppRouter {
  final RouterRefreshStream routerRefreshStream;
  final _rootNavigatorKey = GlobalKey<NavigatorState>();

  AppRouter({required this.routerRefreshStream});

  get router => _router;

  late final _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: RouterRefreshStream(serviceLocator<AppBloc>().stream),
    redirect: (BuildContext context, GoRouterState state) async {
      final appState = context.read<AppBloc>().state;
      final bool loggedIn = appState.authUserUid != null;
      final matchedLocation = AppRoutesEnum.values
          .firstWhere((route) => route.screenPath == state.matchedLocation);
      if (matchedLocation.requireImmersiveMode) {
        disableSystemUI();
      } else {
        enableSystemUI();
      }
      debugPrint(
          "redirect - loggedIn: $loggedIn  - state.matchedLocation: ${state.matchedLocation}");
      if (!loggedIn && !unProtectedPaths.contains(matchedLocation)) {
        return AppRoutesEnum.onBoarding.screenPath;
      }
      // if the user is logged in but still on the login page, send them to
      // the home page
      if (loggedIn && matchedLocation == AppRoutesEnum.login) {
        return AppRoutesEnum.home.screenPath;
      }
      // no need to redirect at all
      return null;
    },
    routes: [
      GoRoute(
          path: AppRoutesEnum.onBoarding.screenPath,
          name: AppRoutesEnum.onBoarding.screenName,
          builder: (context, state) => OnBoardingScreen(
                onSignInPressed: () {
                  context.push(AppRoutesEnum.login.screenPath);
                },
                onSignUpPressed: () {
                  context.push(AppRoutesEnum.signup.screenPath);
                },
              )),
      GoRoute(
          path: AppRoutesEnum.login.screenPath,
          name: AppRoutesEnum.login.screenName,
          pageBuilder: (context, state) => CommonTransitionPage(
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => serviceLocator<SignInBloc>(),
                child: LoginScreen(onSignUpPressed: () {
                  context.push(AppRoutesEnum.signup.screenPath);
                }),
              ))),
      GoRoute(
        path: AppRoutesEnum.signup.screenPath,
        name: AppRoutesEnum.signup.screenName,
        pageBuilder: (context, state) => CommonTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
                create: (context) => serviceLocator<SignUpBloc>(),
                child: SignupScreen(onSignInPressed: () {
                  context.push(AppRoutesEnum.login.screenPath);
                }))),
      ),
      GoRoute(
          path: AppRoutesEnum.add.screenPath,
          name: AppRoutesEnum.add.screenName,
          builder: (BuildContext context, GoRouterState state) => BlocProvider(
                create: (context) {
                  final args = state.extra as AddPostScreenArgs;
                  return serviceLocator<AddPostBloc>()
                    ..add(OnAddNewPostEvent(args.type, args.imageSource,
                        context.read<AppBloc>().state.authUserUid!));
                },
                child: AddPostScreen(
                  onBackPressed: () {
                    context.go(AppRoutesEnum.home.screenPath);
                  },
                  onPostUploaded: () {
                    context.go(AppRoutesEnum.profile.screenPath);
                  },
                  onEditImageRequired: (Uint8List imageData) => context
                      .push<Uint8List>(AppRoutesEnum.imageEditor.screenPath,
                          extra: imageData),
                ),
              )),
      GoRoute(
          path: AppRoutesEnum.followers.screenPath,
          name: AppRoutesEnum.followers.screenName,
          pageBuilder: (context, state) => CommonTransitionPage(
                key: state.pageKey,
                child: BlocProvider(
                  create: (context) {
                    final authUserUid =
                        context.read<AppBloc>().state.authUserUid!;
                    return serviceLocator<FollowersBloc>()
                      ..add(OnLoadFollowersEvent(
                          state.extra is String
                              ? state.extra as String
                              : authUserUid,
                          authUserUid));
                  },
                  child: FollowersScreen(
                    onShowUserProfile: (String userUid) {
                      context.push(AppRoutesEnum.profile.screenPath,
                          extra: userUid);
                    },
                  ),
                ),
              )),
      GoRoute(
          path: AppRoutesEnum.following.screenPath,
          name: AppRoutesEnum.following.screenName,
          pageBuilder: (context, state) => CommonTransitionPage(
              key: state.pageKey,
              child: BlocProvider(
                create: (context) {
                  final authUserUid =
                      context.read<AppBloc>().state.authUserUid!;
                  return serviceLocator<FollowersBloc>()
                    ..add(OnLoadFollowingEvent(
                        state.extra is String
                            ? state.extra as String
                            : authUserUid,
                        authUserUid));
                },
                child: FollowersScreen(
                  onShowUserProfile: (String userUid) {
                    context.push(AppRoutesEnum.profile.screenPath,
                        extra: userUid);
                  },
                ),
              ))),
      GoRoute(
          path: AppRoutesEnum.comments.screenPath,
          name: AppRoutesEnum.comments.screenName,
          pageBuilder: (context, state) => CommonTransitionPage(
                key: state.pageKey,
                child: BlocProvider(
                  create: (context) {
                    final authUserUid = context.read<AppBloc>().state.authUserUid!;
                    return serviceLocator<CommentsBloc>()
                      ..add(OnLoadCommentsByPostEvent(state.extra is String
                        ? state.extra as String
                        : authUserUid, authUserUid));
                  },
                  child: CommentsScreen(
                    onBackPressed: () {
                      context.go(AppRoutesEnum.home.screenPath);
                    },
                    onShowUserProfile: (String userUid) {
                      context.push(AppRoutesEnum.profile.screenPath,
                          extra: userUid);
                    },
                  ),
                ),
              )),
      GoRoute(
          path: AppRoutesEnum.publications.screenPath,
          name: AppRoutesEnum.publications.screenName,
          pageBuilder: (context, state) => CommonTransitionPage(
                key: state.pageKey,
                child: BlocProvider(
                  create: (context) => serviceLocator<PublicationsBloc>()
                    ..add(OnLoadPublicationsEvent(
                        (state.extra as PublicationsScreenArgs).userUid,
                        (state.extra as PublicationsScreenArgs).type)),
                  child: PublicationsScreen(
                    onShowCommentsByPost: (String postId) {
                      context.go(AppRoutesEnum.comments.screenPath,
                          extra: postId);
                    },
                    onShowUserProfile: (String userUid) {
                      context.push(AppRoutesEnum.profile.screenPath,
                          extra: userUid);
                    },
                  ),
                ),
              )),
      GoRoute(
          path: AppRoutesEnum.editProfile.screenPath,
          name: AppRoutesEnum.editProfile.screenName,
          pageBuilder: (context, state) => CommonTransitionPage(
                key: state.pageKey,
                child: BlocProvider(
                  create: (context) => serviceLocator<EditProfileBloc>()
                    ..add(OnEditProfileEvent(state.extra as String)),
                  child: const EditProfileScreen(),
                ),
              )),
      GoRoute(
          path: AppRoutesEnum.imageEditor.screenPath,
          name: AppRoutesEnum.imageEditor.screenName,
          pageBuilder: (context, state) => CommonTransitionPage(
                key: state.pageKey,
                child: ImageEditor(image: state.extra as Uint8List),
              )),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return NavigateScreen(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: AppRoutesEnum.home.screenPath,
                  name: AppRoutesEnum.home.screenName,
                  builder: (BuildContext context, GoRouterState state) =>
                      BlocProvider(
                        create: (context) => serviceLocator<FeedBloc>()
                          ..add(OnLoadHomePostsEvent(
                              context.read<AppBloc>().state.authUserUid!)),
                        child: FeedScreen(
                          onShowCommentsByPost: (String postId) {
                            context.go(AppRoutesEnum.comments.screenPath,
                                extra: postId);
                          },
                          onShowFavoritePosts: () {
                            context.push(AppRoutesEnum.publications.screenPath,
                                extra: PublicationsScreenArgs(
                                    userUid: context
                                        .read<AppBloc>()
                                        .state
                                        .authUserUid!,
                                    type: PublicationsContentTypeEnum.pictures));
                          },
                          onShowUserProfile: (String userUid) {
                            context.push(AppRoutesEnum.profile.screenPath,
                                extra: userUid);
                          },
                        ),
                      ))
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: AppRoutesEnum.search.screenPath,
                  name: AppRoutesEnum.search.screenName,
                  builder: (BuildContext context, GoRouterState state) =>
                      BlocProvider(
                        create: (context) => serviceLocator<SearchBloc>()
                          ..add(const OnLoadLastPostsPublishedEvent()),
                        child: SearchScreen(
                          onShowUserProfile: (String userUid) {
                            context.push(AppRoutesEnum.profile.screenPath,
                                extra: userUid);
                          },
                        ),
                      )),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: AppRoutesEnum.reels.screenPath,
                  name: AppRoutesEnum.reels.screenName,
                  builder: (BuildContext context, GoRouterState state) =>
                      BlocProvider(
                        create: (context) => serviceLocator<ReelsBloc>()..add(const OnLoadTopReels()),
                        child: ReelsViewerScreen(
                          onGoToCommentsByPost: (String postId) {
                            context.go(AppRoutesEnum.comments.screenPath,
                                extra: postId);
                          },
                          onShowUserProfile: (String userUid) {
                            context.push(AppRoutesEnum.profile.screenPath,
                                extra: userUid);
                          },
                        ),
                      )),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: AppRoutesEnum.profile.screenPath,
                  name: AppRoutesEnum.profile.screenName,
                  pageBuilder: (context, state) {
                    final screenBloc = serviceLocator<ProfileBloc>();
                    return CommonTransitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (context) => screenBloc
                          ..add(OnLoadProfileEvent(state.extra is String
                              ? state.extra as String
                              : context.read<AppBloc>().state.authUserUid!)),
                        child: ProfileScreen(
                          onGoToPictures: (String userUid) {
                            context
                                .push(AppRoutesEnum.publications.screenPath,
                                    extra: PublicationsScreenArgs(
                                        userUid: userUid,
                                        type: PublicationsContentTypeEnum.pictures))
                                .then((value) =>
                                    screenBloc..add(const OnRefreshEvent()));
                          },
                          onGoToFollowersScreen: (String userUid) {
                            context
                                .push(AppRoutesEnum.followers.screenPath,
                                    extra: userUid)
                                .then((value) =>
                                    screenBloc..add(const OnRefreshEvent()));
                          },
                          onGoToFollowingScreen: (String userUid) {
                            context
                                .push(AppRoutesEnum.following.screenPath,
                                    extra: userUid)
                                .then((value) =>
                                    screenBloc..add(const OnRefreshEvent()));
                          },
                          onGoToEditProfileScreen: (String userUid) {
                            context
                                .push(AppRoutesEnum.editProfile.screenPath,
                                    extra: userUid)
                                .then((value) =>
                                    screenBloc..add(const OnRefreshEvent()));
                          },
                          onGoToReels: (String userUid) {
                            context
                                .push(AppRoutesEnum.publications.screenPath,
                                    extra: PublicationsScreenArgs(
                                        userUid: userUid,
                                        type: PublicationsContentTypeEnum.reels))
                                .then((value) =>
                                    screenBloc..add(const OnRefreshEvent()));
                          },
                          onGoToBookmarks: (String userUid) {
                            context
                                .push(AppRoutesEnum.publications.screenPath,
                                    extra: PublicationsScreenArgs(
                                        userUid: userUid,
                                        type: PublicationsContentTypeEnum.bookmarks))
                                .then((value) =>
                                    screenBloc..add(const OnRefreshEvent()));
                          },
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
