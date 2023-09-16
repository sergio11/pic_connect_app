import 'package:card_swiper/card_swiper.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/features/core/widgets/common_dialog_box.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:pic_connect/features/core/widgets/reel_preview_widget.dart';
import 'package:pic_connect/provider/event_controller.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:provider/provider.dart';

showImage(BuildContext context, String imageUrl) async {
  final eventController = context.read<EventController>();
  eventController.launchEvent(HideBottomBarEvent());
  await showImageViewer(context, NetworkImage(imageUrl),
      immersive: false,
      useSafeArea: true,
      doubleTapZoomable: true,
      backgroundColor: primaryColor,
      closeButtonColor: accentColor);
  eventController.launchEvent(ShowBottomBarEvent());
}

disableSystemUI() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

enableSystemUI() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor /*Android=23*/,
    statusBarBrightness: Brightness.light /*iOS*/,
    statusBarIconBrightness: Brightness.dark /*Android=23*/,
    systemStatusBarContrastEnforced: false /*Android=29*/,
    systemNavigationBarColor: primaryColor /*Android=27*/,
    systemNavigationBarDividerColor: primaryColor /*Android=28 */,
    systemNavigationBarIconBrightness: Brightness.dark /*Android=27*/,
    systemNavigationBarContrastEnforced: false /*Android=29*/,
  ));
}

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

hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

showErrorSnackBar({required BuildContext context, required String message}) {
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
        contentType: contentType,
      ),
    ));
}

showAlertDialog(
    {required BuildContext context,
    required String title,
    required String description,
    Function()? onAcceptPressed}) {
  showDialog(
      barrierColor: Colors.black.withOpacity(0.5),
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

Future<void> showReelPreviewDialog(
    BuildContext context, PostBO reelPost) async {
  final eventController = context.read<EventController>();
  eventController.launchEvent(HideBottomBarEvent());
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ReelsPreview(
              reelPost: reelPost,
              onShowUserProfile: (userUid) {},
              onLikePost: (postId) {},
              onShowCommentsByPost: (postId) {},
              onShareContentClicked: (postId) {},
              onSaveBookmark: (postId) {},
              swiperController: SwiperController(),
              showProgressIndicator: true,
              isLikedByAuthUser: false,
              isBookmarkedByAuthUser: false,
              looping: true,
            )),
      );
    },
  );
  eventController.launchEvent(ShowBottomBarEvent());
}
