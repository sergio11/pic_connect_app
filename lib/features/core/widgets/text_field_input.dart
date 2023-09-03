import 'package:flutter/material.dart';
import 'package:pic_connect/utils/colors.dart';

class TextFieldInput extends StatefulWidget {
  static const int defaultMaxLines = 1;

  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final String? helperText;
  final TextInputType? textInputType;
  final Widget? icon;
  final int maxLines;
  final BoxConstraints? prefixIconConstraints;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool Function(String? newValue)? onValidate;
  final String? errorText;

  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      this.textInputType,
      this.icon,
      this.maxLines = defaultMaxLines,
      this.helperText,
      this.prefixIconConstraints,
      this.onChanged,
      this.onSubmitted,
      this.focusNode,
      this.errorText,
      this.onValidate})
      : super(key: key);

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  String? _validationError;

  @override
  Widget build(BuildContext context) {
    const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(7.0)),
      borderSide: BorderSide(color: Colors.redAccent),
    );
    const inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
        borderSide: BorderSide(color: accentColor, width: 1));
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (input) {
                final error = widget.onValidate?.call(input) ?? true;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    _validationError = error
                        ? null
                        : widget.errorText ?? "Value is not correct";
                  });
                });
                return null;
              },
              controller: widget.textEditingController,
              focusNode: widget.focusNode,
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: accentColor),
                helperText: _validationError == null ? widget.helperText: null,
                helperStyle: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: accentColor),
                prefixIconConstraints: widget.prefixIconConstraints,
                prefixIcon: widget.icon,
                border: _validationError != null ? errorBorder : inputBorder,
                prefixIconColor: accentColor,
                focusedBorder:
                    _validationError != null ? errorBorder : inputBorder,
                enabledBorder:
                    _validationError != null ? errorBorder : inputBorder,
                filled: true,
                fillColor: whiteColor.withOpacity(0.75),
                contentPadding: const EdgeInsets.all(8),
              ),
              keyboardType: widget.textInputType,
              obscureText: widget.isPass,
              maxLines: widget.maxLines,
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onSubmitted),
          if (_validationError != null)
            Container(
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                _validationError!,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
            )
          else
            const SizedBox(height: 15),
        ]);
  }
}
