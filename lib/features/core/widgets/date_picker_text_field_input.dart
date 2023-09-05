import 'package:flutter/material.dart';
import 'package:pic_connect/features/core/widgets/text_field_input.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:intl/intl.dart';

class DatePickerTextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String? helperText;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  const DatePickerTextFieldInput({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.helperText,
    this.onChanged,
    this.errorText,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      textEditingController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        absorbing: true,
        child: TextFieldInput(
          textEditingController: textEditingController,
          hintText: hintText,
          helperText: helperText,
          onChanged: onChanged,
          errorText: errorText,
          icon: IconButton(
            icon: const Icon(
              Icons.calendar_today,
              color: accentColor,
            ),
            onPressed: () => _selectDate(context),
          ),
        ),
      ),
    );
  }
}
