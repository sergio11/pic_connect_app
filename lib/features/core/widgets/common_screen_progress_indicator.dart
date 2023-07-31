import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CommonScreenProgressIndicator extends StatelessWidget {

  const CommonScreenProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Colors.black54,
      child: const Center(
          child: SpinKitChasingDots(
            color: Colors.white,
            size: 50.0,
          )),
    );
  }

}