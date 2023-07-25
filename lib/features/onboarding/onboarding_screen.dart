import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pic_connect/features/core/widgets/animate_gradient_widget.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          children: [_buildVideoBackground(), _buildScreenContent()],
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
        secondaryColorMediumLight.withOpacity(0.8),
        accentColorShadow.withOpacity(0.8)
      ],
      secondaryColors: [
        secondaryColorLight.withOpacity(0.8),
        accentColorShadow.withOpacity(0.8)
      ],
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 0,
                ),
                SvgPicture.asset(
                  'assets/pic_connect_logo.svg',
                  color: primaryColor,
                  height: 80,
                ),
                _buildCarouselSlider(),
                _buildActions(),
                _buildFooter()
              ])),
    );
  }

  Widget _buildCarouselSlider() {
    final l10n = AppLocalizations.of(context);
    return CarouselSlider(
      options: CarouselOptions(
          height: 250.0,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2.0),
      items: [
        {
          "image": "welcome_camera.png",
          "title": l10n.welcomeTitle,
          "text": l10n.welcomeText
        },
        {
          "image": "discover_inspiration.png",
          "title": l10n.discoverTitle,
          "text": l10n.discoverText
        },
        {
          "image": "connect_people.png",
          "title": l10n.connectTitle,
          "text": l10n.connectText
        },
        {
          "image": "capture_and_share_moments.png",
          "title": l10n.captureTitle,
          "text": l10n.captureText
        }
      ].map((slideItem) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/${slideItem["image"]!}",
                      height: 85,
                    ),
                    Text(slideItem["title"]!,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: primaryColor, fontWeight: FontWeight.bold)),
                    Text(slideItem["text"]!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                            ))
                  ],
                ));
          },
        );
      }).toList(),
    );
  }

  Widget _buildActions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_buildSignInButton(), _buildSignUpButton()],
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child:
          Text("Build with passion by dreamsoftware \n Sergio Sánchez © 2023",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
    );
  }

  Widget _buildSignInButton() {
    return CommonButton(
      text: "Sign In",
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: widget.onSignInPressed,
      sizeType: CommonButtonSizeType.large,
    );
  }

  Widget _buildSignUpButton() {
    return CommonButton(
      text: "Sign Up",
      backgroundColor: accentColor,
      textColor: primaryColor,
      borderColor: accentColor,
      onPressed: widget.onSignUpPressed,
      reverseStyle: true,
      sizeType: CommonButtonSizeType.large,
    );
  }
}
