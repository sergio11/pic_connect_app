import 'package:flutter/material.dart';
import 'package:pic_connect/features/core/helpers.dart';

class CommonOnBoardingContainer extends StatelessWidget {
  final List<Widget> children;

  const CommonOnBoardingContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return wrapIntoAnimateGradient(
        child: SingleChildScrollView(
            child: Container(
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: MediaQuery.of(context).size.height),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: children,
                    )))));
  }
}
