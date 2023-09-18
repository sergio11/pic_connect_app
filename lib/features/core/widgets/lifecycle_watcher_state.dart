import 'package:flutter/material.dart';

abstract class LifecycleWatcherState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {

  @override
  void initState() {
    debugPrint("initState add observer to WidgetsBinding");
    WidgetsBinding.instance.addObserver(this);
    super.initState();
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
        debugPrint("onResumed CALLED");
        onResumed();
        break;
      case AppLifecycleState.inactive:
        debugPrint("onPaused CALLED");
        onPaused();
        break;
      case AppLifecycleState.paused:
        debugPrint("onInactive CALLED");
        onInactive();
        break;
      case AppLifecycleState.detached:
        debugPrint("onDetached CALLED");
        onDetached();
        break;
    }
  }

  void onResumed() {}
  void onPaused() {}
  void onInactive() {}
  void onDetached() {}
}