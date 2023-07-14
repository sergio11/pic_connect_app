import 'dart:async';

import 'package:flutter/widgets.dart';

class RouterRefreshStream with ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  RouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}