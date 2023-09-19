import 'package:flutter/material.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/utils/colors.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final IconData iconData;
  final VoidCallback? onRetry;

  const EmptyStateWidget({
    Key? key,
    required this.message,
    required this.iconData,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 120.0,
            color: accentColor,
          ),
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: accentColor),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null)
            CommonButton(
              text: "Retry",
              backgroundColor: secondaryColor,
              textColor: primaryColor,
              borderColor: secondaryColor,
              onPressed: onRetry,
              sizeType: CommonButtonSizeType.small,
            ),
        ],
      ),
    );
  }
}
