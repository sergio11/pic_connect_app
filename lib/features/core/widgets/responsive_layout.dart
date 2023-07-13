import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget mobileScreenLayout;

  const ResponsiveLayout({
    Key? key,
    required this.mobileScreenLayout
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return widget.mobileScreenLayout;
    });
  }
}