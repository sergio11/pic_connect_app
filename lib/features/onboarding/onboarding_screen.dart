import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pic_connect/features/core/widgets/animate_gradient_widget.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:video_player/video_player.dart';

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

  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController =
    VideoPlayerController.asset("assets/pic_connect_onboarding_video.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _videoController.play();
        _videoController.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            _buildVideoBackground(),
            _buildScreenContent()
          ],
        ));
  }

  Widget _buildVideoBackground() {
    return SizedBox.expand(
        child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _videoController.value.size.width ?? 0,
              height: _videoController.value.size.height ?? 0,
              child: VideoPlayer(_videoController),
            )));
  }

  Widget _buildScreenContent() {
    return AnimateGradient(
      primaryBegin: Alignment.topLeft,
      primaryEnd: Alignment.bottomLeft,
      secondaryBegin: Alignment.bottomLeft,
      secondaryEnd: Alignment.topRight,
      primaryColors: [
        secondaryColorLight.withOpacity(0.8),
        accentColorShadow.withOpacity(0.8)
      ],
      secondaryColors: [
        secondaryColorExtraLight.withOpacity(0.8),
        accentColorShadow.withOpacity(0.8)
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
