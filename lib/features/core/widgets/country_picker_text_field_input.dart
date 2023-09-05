import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:pic_connect/features/core/widgets/text_field_input.dart';
import 'package:pic_connect/utils/colors.dart';

class CountryPickerTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String? helperText;
  final String? errorText;

  const CountryPickerTextField(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      this.helperText,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCountryPicker(context),
      child: AbsorbPointer(
          absorbing: true,
          child: TextFieldInput(
              textEditingController: textEditingController,
              hintText: hintText,
              helperText: helperText,
              errorText: errorText,
              icon: IconButton(
                icon: const Icon(
                  Icons.map,
                  color: accentColor,
                ),
                onPressed: () => _showCountryPicker(context),
              ))),
    );
  }

  void _showCountryPicker(BuildContext context) {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        textEditingController.text = "${country.displayName}:${country.flagEmoji}";
      },
    );
  }
}
