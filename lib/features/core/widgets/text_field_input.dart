import 'package:flutter/material.dart';
import 'package:pic_connect/utils/colors.dart';

class TextFieldInput extends StatelessWidget {
  static const int defaultMaxLines = 1;

  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final String helperText;
  final TextInputType? textInputType;
  final Widget? icon;
  final int maxLines;
  final BoxConstraints? prefixIconConstraints;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? errorText;

  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      this.textInputType,
      this.icon,
      this.maxLines = defaultMaxLines,
      this.helperText = "",
      this.prefixIconConstraints,
      this.onChanged,
      this.onSubmitted,
      this.focusNode,
      this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
        borderSide: BorderSide(color: accentColor, width: 1));
    return TextField(
        controller: textEditingController,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: accentColor),
          helperText: helperText,
          helperStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: accentColor),
          prefixIconConstraints: prefixIconConstraints,
          prefixIcon: icon,
          border: inputBorder,
          prefixIconColor: accentColor,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          errorText: errorText,
          filled: true,
          fillColor: whiteColor.withOpacity(0.75),
          contentPadding: const EdgeInsets.all(8),
        ),
        keyboardType: textInputType,
        obscureText: isPass,
        maxLines: maxLines,
        onChanged: onChanged,
        onSubmitted: onSubmitted);
  }
}
