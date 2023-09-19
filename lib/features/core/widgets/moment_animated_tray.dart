import 'package:advstory/advstory.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/utils/colors.dart';

class MomentAnimatedTray extends AnimatedTray {
  static const double DEFAULT_WIDTH = 85;
  static const double DEFAULT_HEIGHT = 85;
  static const double DEFAULT_RADIUS = 50;
  static const double DEFAULT_STROKE_WIDTH = 2;
  static const double DEFAULT_GAP_SIZE = 3;
  static const List<Color> DEFAULT_BORDER_COLORS = [
    Color(0xaf405de6),
    Color(0xaf5851db),
    Color(0xaf833ab4),
    Color(0xafc13584),
    Color(0xafe1306c),
    Color(0xaffd1d1d),
    Color(0xaf405de6),
  ];

  final String imageUrl;
  final String label;
  final double width;
  final double height;
  final double radius;
  final double strokeWidth;
  final double gapSize;
  final List<Color> selectedColors;

  const MomentAnimatedTray(
      {Key? key,
      required this.imageUrl,
      required this.label,
      this.width = DEFAULT_WIDTH,
      this.height = DEFAULT_HEIGHT,
      this.radius = DEFAULT_RADIUS,
      this.strokeWidth = DEFAULT_STROKE_WIDTH,
      this.gapSize = DEFAULT_GAP_SIZE,
      this.selectedColors = DEFAULT_BORDER_COLORS})
      : super(key: key);

  @override
  AnimatedTrayState<AnimatedTray> createState() => MomentAnimatedTrayState();
}

class MomentAnimatedTrayState extends AnimatedTrayState<MomentAnimatedTray>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
    reverseDuration: const Duration(milliseconds: 1000),
    value: 1,
    lowerBound: 1,
    upperBound: 1.1,
  );

  // This function called every time the tray is tapped.
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
        url: widget.imageUrl,
        size: Size(widget.width, widget.height),
        shape: BoxShape.circle,
        borderRadius: widget.radius,
        borderGradientColors: widget.selectedColors,
        strokeWidth: widget.strokeWidth,
        gapSize: widget.gapSize,
        username: Text(widget.label,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: accentColor, fontWeight: FontWeight.bold)),
      ),
    ));
  }
}
