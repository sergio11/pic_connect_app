import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/features/core/widgets/common_dialog_box.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

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

showErrorSnackBar({ required BuildContext context, required String message }) {
  showSnackBar(
      context: context,
      title: "Oh Hey!!",
      message: message,
      contentType: ContentType.failure);
}

showSnackBar(
    {required BuildContext context,
    required String title,
    required String message,
    required ContentType contentType}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
          title: title,
          message: message,
          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: contentType,),
    ));
}

showAlertDialog(
    {required BuildContext context,
    required String title,
    required String description,
    Function()? onAcceptPressed}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonDialogBox(
          title: title,
          descriptions: description,
          acceptText: "Accept",
          img: Image.asset("assets/welcome_camera.png"),
          onAccepted: onAcceptPressed,
        );
      });
}

showConfirmDialog(
    {required BuildContext context,
    required String title,
    required String description,
    Function()? onAcceptPressed,
    Function()? onCancelPressed}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonDialogBox(
          title: title,
          descriptions: description,
          acceptText: "Accept",
          cancelledText: "Cancel",
          img: Image.asset("assets/welcome_camera.png"),
          onAccepted: onAcceptPressed,
          onCancelled: onCancelPressed,
        );
      });
}
