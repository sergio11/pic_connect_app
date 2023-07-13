import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/di/service_locator.dart';
import 'package:pic_connect/features/core/widgets/mobile_screen_layout.dart';
import 'package:pic_connect/features/core/widgets/responsive_layout.dart';
import 'package:pic_connect/features/feed/feed_bloc.dart';
import 'package:pic_connect/features/feed/feed_screen.dart';
import 'package:pic_connect/features/notfound/not_found_page.dart';
import 'package:pic_connect/features/profile/profile_bloc.dart';
import 'package:pic_connect/features/profile/profile_screen.dart';
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
              child: const SignupScreen(),
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
                  ),
                routes: <RouteBase>[],
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
                  ),
                routes: <RouteBase>[],
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