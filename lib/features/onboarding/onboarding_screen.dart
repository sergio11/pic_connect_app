import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pic_connect/features/core/widgets/animate_gradient_widget.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/utils/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  final VoidCallback onSignInPressed;
  final VoidCallback onSignUpPressed;

  const OnBoardingScreen(
      {Key? key, required this.onSignInPressed, required this.onSignUpPressed})
      : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            _buildScreenBackground(),
            _buildScreenContent()
          ],
        ));
  }

  Widget _buildScreenBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/onboarding_picture.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildScreenContent() {
    return AnimateGradient(
      primaryBegin: Alignment.topLeft,
      primaryEnd: Alignment.bottomLeft,
      secondaryBegin: Alignment.bottomLeft,
      secondaryEnd: Alignment.topRight,
      primaryColors: [
        accentColor.withOpacity(0.8),
        secondaryColor.withOpacity(0.8)
      ],
      secondaryColors: [
        secondaryColor.withOpacity(0.8),
        accentColor.withOpacity(0.8),
      ],
      child: SizedBox(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/pic_connect_logo.svg',
                  color: primaryColor,
                  height: 80,
                ),
                _buildActions()
              ])),
    );
  }

  Widget _buildActions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_buildSignInButton(), _buildSignUpButton()],
    );
  }

  Widget _buildSignInButton() {
    return CommonButton(
      text: "Sign In",
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: widget.onSignInPressed,
    );
  }

  Widget _buildSignUpButton() {
    return CommonButton(
      text: "Sign Up",
      backgroundColor: accentColor,
      textColor: primaryColor,
      borderColor: accentColor,
      onPressed: widget.onSignUpPressed,
    );
  }
}
