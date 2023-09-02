import 'package:advstory/advstory.dart';
import 'package:flutter/material.dart';

class MomentAnimatedTray extends AnimatedTray {
  const MomentAnimatedTray({
    required this.profilePic,
    Key? key,
  }) : super(key: key);

  final String profilePic;

  @override
  AnimatedTrayState<AnimatedTray> createState() => MomentAnimatedTrayState();
}

class MomentAnimatedTrayState extends AnimatedTrayState<MomentAnimatedTray>
    with TickerProviderStateMixin {

  final double _width = 85;
  final double _height = 85;
  final double _radius = 50;
  final double _strokeWidth = 2;
  final double _gapSize = 3;
  final _defaultBorderColors = [
    const Color(0xaf405de6),
    const Color(0xaf5851db),
    const Color(0xaf833ab4),
    const Color(0xafc13584),
    const Color(0xafe1306c),
    const Color(0xaffd1d1d),
    const Color(0xaf405de6),
  ];
  late final List<Color> _selectedColors = _defaultBorderColors;

  // Create a controller for the tray animation and define properties.
  // Use curves, tweens etc. if you want.
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
    reverseDuration: const Duration(milliseconds: 1000),
    value: 1,
    lowerBound: 1,
    upperBound: 1.1,
  );

  // This function called every time the tray is tapped.
  //
  // When you return a class that extends AnimatedTray from tray builder,
  // AdvStory knows that it should prepare story and its content before it is
  // shown. On animated tray tap, AdvStory calls this function and starts
  // preparing the story, builds story, fetchs media file from internet and
  // initializes VideoController if content is a video.
  @override
  void startAnimation() {
    _controller.repeat(reverse: true);
  }

  // When story built and it's content ready to be shown, AdvStory calls this
  // function and opens story view.
  @override
  void stopAnimation() {
    _controller.reset();
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ScaleTransition(
            scale: _controller,
            child: AdvStoryTray(
              url: widget.profilePic,
              size: Size(_width, _height),
              shape: BoxShape.circle,
              borderRadius: _radius,
              borderGradientColors: _selectedColors,
              strokeWidth: _strokeWidth,
              gapSize: _gapSize,
              username: const Text(
                "Sergio",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 11,
                ),
              ),
            )));
  }
}
