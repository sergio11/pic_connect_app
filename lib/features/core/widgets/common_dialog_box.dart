import 'package:flutter/material.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/constants.dart';

class CommonDialogBox extends StatefulWidget {
  final String title, descriptions, acceptText;
  final Image img;
  final String? cancelledText;
  final Function()? onAccepted;
  final Function()? onCancelled;

  const CommonDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.acceptText,
      required this.img,
      this.cancelledText,
      this.onAccepted,
      this.onCancelled})
      : super(key: key);

  @override
  CommonDialogBoxState createState() => CommonDialogBoxState();
}

class CommonDialogBoxState extends State<CommonDialogBox> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: scaleAnimation,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.padding),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: contentBox(context),
        ));
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: accentColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: accentColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildDialogButtons(),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryColor,
                  width: 4.0,
                ),
                boxShadow: const [
                  BoxShadow(
                      color: primaryColor,
                      offset: Offset(0, 10),
                      blurRadius: 20),
                ]),
            child: CircleAvatar(
              backgroundColor: secondaryColor,
              radius: Constants.avatarRadius,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(Constants.avatarRadius)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: widget.img,
                  )),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDialogButtons() {
    final List<Widget> buttons = [];
    if (widget.cancelledText != null && widget.cancelledText!.isNotEmpty) {
      buttons.add(Flexible(
          child: CommonButton(
        text: widget.cancelledText!,
        backgroundColor: accentColor,
        textColor: primaryColor,
        borderColor: accentColor,
        reverseStyle: true,
        sizeType: CommonButtonSizeType.small,
        onPressed: () {
          widget.onCancelled?.call();
          Navigator.pop(context);
        },
      )));
    }
    buttons.add(Flexible(
      child: CommonButton(
        text: widget.acceptText,
        backgroundColor: secondaryColor,
        textColor: primaryColor,
        borderColor: secondaryColor,
        sizeType: CommonButtonSizeType.small,
        onPressed: () {
          widget.onAccepted?.call();
          Navigator.pop(context);
        },
      ),
    ));
    return buttons;
  }
}
