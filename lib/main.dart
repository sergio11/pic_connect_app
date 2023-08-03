import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/di/service_locator.dart';
import 'package:pic_connect/features/app/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/routes/app_router.dart';
import 'package:pic_connect/routes/router_refresh_stream.dart';
import 'package:provider/provider.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await setupServiceLocator();
  runApp(BlocProvider(
      create: (context) => serviceLocator<AppBloc>()
        ..add(const OnVerifySession()),
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => RouterRefreshStream(context.read<AppBloc>().stream)),
            ProxyProvider<RouterRefreshStream, AppRouter>(
                update: (context, routerRefreshStream, _) => AppRouter(routerRefreshStream: routerRefreshStream))
          ],
          child: const MainApp())
  ));
  Future.delayed(const Duration(seconds: 3), () {
    FlutterNativeSplash.remove();
  });
}