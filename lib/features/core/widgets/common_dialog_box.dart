import 'package:flutter/material.dart';
import 'package:pic_connect/features/core/widgets/follow_button.dart';
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

class CommonDialogBoxState extends State<CommonDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
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
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: _buildDialogButtons(),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(Constants.avatarRadius)),
                child: widget.img),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDialogButtons() {
    final List<Widget> buttons = [];
    if (widget.cancelledText != null &&
        widget.cancelledText!.isNotEmpty) {
      buttons.add(Flexible(
          child: FollowButton(
        text: widget.cancelledText!,
        backgroundColor: accentColor,
        textColor: secondaryColor,
        borderColor: accentColor,
        onPressed: () {
          widget.onCancelled?.call();
          Navigator.pop(context);
        },
      )));
    }
    buttons.add(Flexible(
      child: FollowButton(
        text: widget.acceptText,
        backgroundColor: secondaryColor,
        textColor: accentColor,
        borderColor: secondaryColor,
        onPressed: () {
          widget.onAccepted?.call();
          Navigator.pop(context);
        },
      ),
    ));
    return buttons;
  }
}
