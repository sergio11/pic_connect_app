import 'package:flutter/material.dart';

abstract class LifecycleWatcherState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    debugPrint("initState add observer to WidgetsBinding");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    debugPrint("dispose  observer from WidgetsBinding");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint("didChangeAppLifecycleState -> ${state.name}");
    switch (state) {
      case AppLifecycleState.resumed:
        onResumed();
        break;
      case AppLifecycleState.inactive:
        onPaused();
        break;
      case AppLifecycleState.paused:
        onInactive();
        break;
      case AppLifecycleState.detached:
        onDetached();
        break;
    }
  }

  void onResumed() {}
  void onPaused() {}
  void onInactive() {}
  void onDetached() {}
}