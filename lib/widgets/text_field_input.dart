import 'package:flutter/material.dart';
import 'package:pic_connect/utils/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Widget? icon;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
        borderSide: BorderSide(color: accentColor, width: 1));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: accentColor),
        prefixIcon: icon,
        border: inputBorder,
        prefixIconColor: accentColor,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        fillColor: whiteColor.withOpacity(0.75),
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
