import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class AbstractEvent {}
class ShowBottomBarEvent extends AbstractEvent {}
class HideBottomBarEvent extends AbstractEvent {}

class EventController extends ChangeNotifier {
  final StreamController<AbstractEvent> _controller = StreamController<AbstractEvent>.broadcast();

  Stream<AbstractEvent> get eventStream => _controller.stream;

   void launchEvent(AbstractEvent event) {
    _controller.add(event);
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
