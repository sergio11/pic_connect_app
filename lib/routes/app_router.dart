import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/di/service_locator.dart';
import 'package:pic_connect/features/add/add_post_bloc.dart';
import 'package:pic_connect/features/add/add_post_screen.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/comments/comments_bloc.dart';
import 'package:pic_connect/features/comments/comments_screen.dart';
import 'package:pic_connect/features/core/widgets/navigate_screen.dart';
import 'package:pic_connect/features/favorites/favorites_bloc.dart';
import 'package:pic_connect/features/favorites/favorites_screen.dart';
import 'package:pic_connect/features/feed/feed_bloc.dart';
import 'package:pic_connect/features/feed/feed_screen.dart';
import 'package:pic_connect/features/notfound/not_found_page.dart';
import 'package:pic_connect/features/onboarding/onboarding_screen.dart';
import 'package:pic_connect/features/profile/profile_bloc.dart';
import 'package:pic_connect/features/profile/profile_screen.dart';
import 'package:pic_connect/features/publications/publications_bloc.dart';
import 'package:pic_connect/features/publications/publications_screen.dart';
import 'package:pic_connect/features/search/search_bloc.dart';
import 'package:pic_connect/features/search/search_screen.dart';
import 'package:pic_connect/features/signin/signin_bloc.dart';
import 'package:pic_connect/features/signin/signin_screen.dart';
import 'package:pic_connect/features/signup/signup_bloc.dart';
import 'package:pic_connect/features/signup/signup_screen.dart';
import 'package:pic_connect/routes/route_utils.dart';
import 'package:pic_connect/routes/router_refresh_stream.dart';

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
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: SystemUiOverlay.values);
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
          pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => serviceLocator<SignInBloc>(),
                child: LoginScreen(onSignUpPressed: () {
                  context.push(AppRoutesEnum.signup.screenPath);
                }),
              ),
              transitionDuration: const Duration(milliseconds: 800),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ))),
      GoRoute(
        path: AppRoutesEnum.signup.screenPath,
        name: AppRoutesEnum.signup.screenName,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: BlocProvider(
                create: (context) => serviceLocator<SignUpBloc>(),
                child: SignupScreen(onSignInPressed: () {
                  context.push(AppRoutesEnum.login.screenPath);
                })),
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    )),
      ),
      GoRoute(
          path: AppRoutesEnum.add.screenPath,
          name: AppRoutesEnum.add.screenName,
          builder: (BuildContext context, GoRouterState state) => BlocProvider(
                create: (context) => serviceLocator<AddPostBloc>()
                  ..add(OnAddNewPostEvent(state.extra as ImageSource,
                      context.read<AppBloc>().state.authUserUid!)),
                child: AddPostScreen(
                  onBackPressed: () {
                    context.go(AppRoutesEnum.home.screenPath);
                  },
                  onPostUploaded: () {
                    context.go(AppRoutesEnum.profile.screenPath);
                  }, onEditImageRequired: (Uint8List imageData) =>
                    context.push<Uint8List>(AppRoutesEnum.imageEditor.screenPath, extra: imageData),
                ),
              )),
      GoRoute(
          path: AppRoutesEnum.comments.screenPath,
          name: AppRoutesEnum.comments.screenName,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => serviceLocator<CommentsBloc>()
                  ..add(OnLoadCommentsByPostEvent(state.extra as String,
                      context.read<AppBloc>().state.authUserUid!)),
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
              transitionDuration: const Duration(milliseconds: 800),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ))),
      GoRoute(
          path: AppRoutesEnum.publications.screenPath,
          name: AppRoutesEnum.publications.screenName,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => serviceLocator<PublicationsBloc>()
                  ..add(OnLoadPublicationsEvent(state.extra as String)),
                child: PublicationsScreen(onShowCommentsByPost: (String postId) {
                  context.go(AppRoutesEnum.comments.screenPath,
                      extra: postId);
                },),
              ),
              transitionDuration: const Duration(milliseconds: 800),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ))),
      GoRoute(
          path: AppRoutesEnum.imageEditor.screenPath,
          name: AppRoutesEnum.imageEditor.screenName,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: ImageEditor(
                  image: state.extra as Uint8List
              ),
              transitionDuration: const Duration(milliseconds: 800),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ))),
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
                  path: AppRoutesEnum.favorites.screenPath,
                  name: AppRoutesEnum.favorites.screenName,
                  builder: (BuildContext context, GoRouterState state) =>
                      BlocProvider(
                        create: (context) => serviceLocator<FavoritesBloc>(),
                        child: const FavoritesScreen(),
                      )),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: AppRoutesEnum.profile.screenPath,
                  name: AppRoutesEnum.profile.screenName,
                  pageBuilder: (context, state) => CustomTransitionPage<void>(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (context) => serviceLocator<ProfileBloc>()
                          ..add(OnLoadProfileEvent(state.extra is String
                              ? state.extra as String
                              : context.read<AppBloc>().state.authUserUid!)),
                        child: ProfileScreen(onShowPublications: (String userUid) {
                          context.push(AppRoutesEnum.publications.screenPath,
                              extra: userUid);
                        },),
                      ),
                      transitionDuration: const Duration(milliseconds: 800),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(-1.0, 0.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              ))),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
