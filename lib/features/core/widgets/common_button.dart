import 'package:flutter/material.dart';
import 'package:pic_connect/utils/colors.dart';

enum CommonButtonSizeType { small, medium, large }

class CommonButton extends StatelessWidget {
  static const double defaultSmallButtonWidth = 150;
  static const double defaultSmallButtonHeight = 40;
  static const double defaultMediumButtonWidth = 240;
  static const double defaultMediumButtonHeight = 50;
  static const double defaultLargeButtonWidth = 250;
  static const double defaultLargeButtonHeight = 50;

  final Function()? onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  final CommonButtonSizeType sizeType;
  final bool reverseStyle;

  const CommonButton({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.text,
    required this.textColor,
    this.sizeType = CommonButtonSizeType.medium,
    this.reverseStyle = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            height: switch (sizeType) {
              CommonButtonSizeType.small => defaultSmallButtonHeight,
              CommonButtonSizeType.medium => defaultMediumButtonHeight,
              CommonButtonSizeType.large => defaultLargeButtonHeight
            },
            width: switch (sizeType) {
              CommonButtonSizeType.small => defaultSmallButtonWidth,
              CommonButtonSizeType.medium => defaultMediumButtonWidth,
              CommonButtonSizeType.large => defaultLargeButtonWidth
            },
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 5.0)
              ],
              border: Border.all(color: primaryColor, width: 3),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 1.0],
                colors: !reverseStyle
                    ? [secondaryColor, secondaryColorExtraLight]
                    : [accentColor, primaryColor],
              ),
              color: secondaryColorExtraLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                      defaultSmallButtonWidth, defaultSmallButtonHeight),
                  maximumSize: const Size(
                      defaultLargeButtonWidth, defaultLargeButtonHeight),
                  padding: const EdgeInsets.all(0),
                  foregroundColor: textColor,
                  fixedSize: switch (sizeType) {
                    CommonButtonSizeType.small => const Size(
                        defaultSmallButtonWidth, defaultSmallButtonHeight),
                    CommonButtonSizeType.medium => const Size(
                        defaultMediumButtonWidth, defaultMediumButtonHeight),
                    CommonButtonSizeType.large => const Size(
                        defaultLargeButtonWidth, defaultLargeButtonHeight)
                  },
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  textStyle: getTextStyle(context, sizeType)),
              child: Text(
                text,
              ),
            )));
  }

  TextStyle? getTextStyle(BuildContext context, CommonButtonSizeType sizeType) {
    final textTheme = Theme.of(context).textTheme;
    final style = switch (sizeType) {
      CommonButtonSizeType.small => textTheme.labelSmall,
      CommonButtonSizeType.medium => textTheme.labelMedium,
      CommonButtonSizeType.large => textTheme.labelLarge
    };
    return style?.copyWith(color: textColor, fontWeight: FontWeight.bold);
  }
}