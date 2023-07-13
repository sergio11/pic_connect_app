import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/di/service_locator.dart';
import 'package:pic_connect/features/add/add_post_bloc.dart';
import 'package:pic_connect/features/add/add_post_screen.dart';
import 'package:pic_connect/features/core/widgets/mobile_screen_layout.dart';
import 'package:pic_connect/features/core/widgets/responsive_layout.dart';
import 'package:pic_connect/features/favorites/favorites_bloc.dart';
import 'package:pic_connect/features/favorites/favorites_screen.dart';
import 'package:pic_connect/features/feed/feed_bloc.dart';
import 'package:pic_connect/features/feed/feed_screen.dart';
import 'package:pic_connect/features/notfound/not_found_page.dart';
import 'package:pic_connect/features/profile/profile_bloc.dart';
import 'package:pic_connect/features/profile/profile_screen.dart';
import 'package:pic_connect/features/search/search_bloc.dart';
import 'package:pic_connect/features/search/search_screen.dart';
import 'package:pic_connect/features/signin/signin_bloc.dart';
import 'package:pic_connect/features/signin/signin_screen.dart';
import 'package:pic_connect/features/signup/signup_bloc.dart';
import 'package:pic_connect/features/signup/signup_screen.dart';
import 'package:pic_connect/routes/route_utils.dart';


class AppRouter {

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: AppRoutesEnum.login.screenPath,
        name: AppRoutesEnum.login.screenName,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => serviceLocator<SignInBloc>(),
              child: LoginScreen(onSigInSuccess: () {
                context.go(AppRoutesEnum.home.screenPath);
              }, onSignUpPressed: () {
                context.go(AppRoutesEnum.signup.screenPath);
              },),
            ),
        // onSignInSuccess: () => context.go(PagesEnum.signup.screenPath)
      ),
      GoRoute(
        path: AppRoutesEnum.signup.screenPath,
        name: AppRoutesEnum.signup.screenName,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => serviceLocator<SignUpBloc>(),
              child: SignupScreen(onSignUpSuccess: () {
                context.go(AppRoutesEnum.home.screenPath);
              }, onSignInPressed: () {
                context.go(AppRoutesEnum.login.screenPath);
              },),
            ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(navigationShell: navigationShell));
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutesEnum.home.screenPath,
                name: AppRoutesEnum.home.screenName,
                builder: (BuildContext context, GoRouterState state) =>
                  BlocProvider(
                    create: (context) => serviceLocator<FeedBloc>(),
                    child: const FeedScreen(),
                  )
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutesEnum.search.screenPath,
                name: AppRoutesEnum.search.screenName,
                builder: (BuildContext context, GoRouterState state) =>
                    BlocProvider(
                      create: (context) => serviceLocator<SearchBloc>(),
                      child: const SearchScreen(),
                    )
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutesEnum.add.screenPath,
                name: AppRoutesEnum.add.screenName,
                builder: (BuildContext context, GoRouterState state) =>
                    BlocProvider(
                      create: (context) => serviceLocator<AddPostBloc>(),
                      child: const AddPostScreen(),
                    )
              ),
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
                    )
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutesEnum.profile.screenPath,
                name: AppRoutesEnum.profile.screenName,
                builder: (BuildContext context, GoRouterState state) =>
                  BlocProvider(
                    create: (context) => serviceLocator<ProfileBloc>(),
                    child: const ProfileScreen(),
                  )
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}