import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/di/service_locator.dart';
import 'package:pic_connect/features/notfound/not_found_page.dart';
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
        path: PagesEnum.login.screenPath,
        name: PagesEnum.login.screenName,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => serviceLocator<SignInBloc>(),
              child: const LoginScreen(),
            ),
      ),
      GoRoute(
        path: PagesEnum.signup.screenPath,
        name: PagesEnum.signup.screenName,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => serviceLocator<SignUpBloc>(),
              child: const SignupScreen(),
            ),
      )
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;

}