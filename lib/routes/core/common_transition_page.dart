import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonTransitionPage extends CustomTransitionPage<void> {
  const CommonTransitionPage({
    required super.key,
    required super.child,
    super.transitionsBuilder = _onTransitionsBuilder,
    super.transitionDuration = const Duration(milliseconds: 800)
  });

  static Widget _onTransitionsBuilder(
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
}
