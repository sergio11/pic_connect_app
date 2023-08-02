import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pic_connect/utils/colors.dart';

class CommonScreenProgressIndicator extends StatelessWidget {

  const CommonScreenProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: whiteColor,
      child: const Center(
          child: SpinKitChasingDots(
            color: secondaryColor,
            size: 80.0,
          )),
    );
  }

}