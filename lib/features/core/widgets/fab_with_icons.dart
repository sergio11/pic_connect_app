import 'package:flutter/material.dart';
import 'package:pic_connect/utils/colors.dart';

class FabWithIcons extends StatefulWidget {
  final List<IconData> icons;
  final ValueChanged<int> onIconTapped;

  const FabWithIcons(
      {super.key, required this.icons, required this.onIconTapped});

  @override
  State createState() => FabWithIconsState();
}

class FabWithIconsState extends State<FabWithIcons>
    with TickerProviderStateMixin {

  late AnimationController _controller;
  bool isCollapsed = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.icons.length, (int index) {
        return _buildChild(index);
      }).toList()
        ..add(
          _buildFab(),
        ),
    );
  }

  Widget _buildChild(int index) {
    Color backgroundColor = secondaryColor;
    Color foregroundColor = accentColor;
    return Container(
      height: 70.0,
      width: 56.0,
      alignment: FractionalOffset.topCenter,
      child: ScaleTransition(
        scale: CurvedAnimation(
          parent: _controller,
          curve: Interval(0.0, 1.0 - index / widget.icons.length / 2.0,
              curve: Curves.easeOut),
        ),
        child: FloatingActionButton(
          backgroundColor: backgroundColor,
          mini: true,
          child: Icon(widget.icons[index], color: foregroundColor),
          onPressed: () => _onTapped(index),
        ),
      ),
    );
  }

  Widget _buildFab() {
    return FloatingActionButton(
      onPressed: () {
        if (_controller.isDismissed) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
        setState(() {
          isCollapsed = !isCollapsed;
        });
      },
      shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2,color: primaryColor),
          borderRadius: BorderRadius.circular(100)
      ),
      tooltip: 'Add Post',
      elevation: 5.0,
      foregroundColor: primaryColor,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 1.0],
              colors: isCollapsed ?
                [secondaryColor, secondaryColorExtraLight] :
              [accentColor, primaryColor],
            )
        ),
        child: isCollapsed ?
          const Icon(Icons.add) : const Icon(Icons.close),
      ),
    );
  }

  void _onTapped(int index) {
    _controller.reverse();
    setState(() {
      isCollapsed = true;
    });
    widget.onIconTapped(index);
  }
}
