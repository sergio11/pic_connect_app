import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pic_connect/routes/app_router.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:provider/provider.dart';

import 'app_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          final GoRouter router = Provider.of<AppRouter>(context).router;
          return  MaterialApp.router(
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            title: 'PicConnect',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
              textTheme: Theme.of(context)
                  .textTheme
                  .apply(fontFamily: 'montserrat'),
              scaffoldBackgroundColor: mobileBackgroundColor,
            ),
          );
        });

  }
}