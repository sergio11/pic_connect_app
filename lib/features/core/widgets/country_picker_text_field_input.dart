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
    const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(7.0)),
      borderSide: BorderSide(color: Colors.redAccent),
    );
    const inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
        borderSide: BorderSide(color: accentColor, width: 1));
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
          inputDecoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: accentColor),
            helperText: errorText == null ? helperText : null,
            helperStyle: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: accentColor),
            prefixIcon: const Icon(Icons.search),
            border: errorText != null ? errorBorder : inputBorder,
            prefixIconColor: accentColor,
            focusedBorder: errorText != null ? errorBorder : inputBorder,
            enabledBorder: errorText != null ? errorBorder : inputBorder,
            filled: true,
            fillColor: whiteColor.withOpacity(0.75),
            contentPadding: const EdgeInsets.all(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          backgroundColor: primaryColor,
          textStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: accentColor, fontWeight: FontWeight.w400),
          searchTextStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: accentColor, fontWeight: FontWeight.bold)),
      useSafeArea: true,
      onSelect: (Country country) {
        textEditingController.text = "${country.flagEmoji} ${country.name}";
      },
    );
  }
}
