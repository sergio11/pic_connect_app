import 'package:flutter/material.dart';
import 'package:pic_connect/routes/app_router.dart';
import 'package:pic_connect/utils/colors.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      title: 'PicConnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: 'montserrat'),
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
    );
  }
}