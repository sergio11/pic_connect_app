import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  static const double defaultButtonWidth = 250;
  static const double defaultButtonHeight = 50;

  final Function()? onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;

  const CommonButton(
      {Key? key,
      required this.backgroundColor,
      required this.borderColor,
      required this.text,
      required this.textColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: textColor,
            fixedSize: const Size(defaultButtonWidth, defaultButtonHeight),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: textColor, width: 2)
            ),
            textStyle: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: textColor, fontWeight: FontWeight.bold)),
        child: Text(
          text,
        ),
      ),
    );
  }
}
