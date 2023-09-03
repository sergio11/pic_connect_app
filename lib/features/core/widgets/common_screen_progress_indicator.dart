import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pic_connect/utils/colors.dart';

class CommonScreenProgressIndicator extends StatelessWidget {

  final Color backgroundColor;
  final Color spinnerColor;

  const CommonScreenProgressIndicator({
    super.key,
    this.backgroundColor = primaryColor,
    this.spinnerColor = secondaryColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
          child: SpinKitChasingDots(
            color: spinnerColor,
            size: 80.0,
          )),
    );
  }

}