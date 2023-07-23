import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/features/core/widgets/common_dialog_box.dart';

// for picking up image from gallery
pickImageAsBytes(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
}

Future<XFile?> pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  return await imagePicker.pickImage(source: source);
}

// for displaying snackbars
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

showAlertDialog({
  required BuildContext context,
  required String title,
  required String description,
  Function()? onAcceptPressed
}) {
  showDialog(context: context,
      builder: (BuildContext context){
        return CommonDialogBox(
          title: title,
          descriptions: description,
          acceptText: "Accept",
          img: Image.asset("assets/app_icon.png"),
          onAccepted: onAcceptPressed,
        );
      }
  );
}


showConfirmDialog({
  required BuildContext context,
  required String title,
  required String description,
  Function()? onAcceptPressed,
  Function()? onCancelPressed
}) {
  showDialog(context: context,
      builder: (BuildContext context){
        return CommonDialogBox(
          title: title,
          descriptions: description,
          acceptText: "Accept",
          cancelledText: "Cancel",
          img: Image.asset("assets/app_icon.png"),
          onAccepted: onAcceptPressed,
          onCancelled: onCancelPressed,
        );
      }
  );
}
