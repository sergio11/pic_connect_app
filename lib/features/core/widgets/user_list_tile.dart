import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/features/core/helpers.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserListTile extends StatelessWidget {
  final UserBO userBO;
  final bool isFollowedByAuthUser;
  final bool isAuthUser;
  final VoidCallback? onFollowPressed;
  final VoidCallback? onUnFollowPressed;
  final bool isDisabled;

  const UserListTile(
      {super.key,
      required this.userBO,
      required this.isAuthUser,
      this.onFollowPressed,
      this.onUnFollowPressed,
      this.isFollowedByAuthUser = false,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListTile(
      leading: SizedBox(
        width: 40,
        height: 40,
        child: buildCircleAvatar(imageUrl: userBO.photoUrl, radius: 22),
      ),
      title: Text(
        userBO.username,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: accentColor, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
          userBO.bio != null && userBO.bio!.isNotEmpty
              ? userBO.bio!
              : "No user information provided",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: accentColor)),
      trailing: !isAuthUser &&
              onUnFollowPressed != null &&
              onFollowPressed != null
          ? CommonButton(
              text: isFollowedByAuthUser
                  ? l10n.unFollowButtonText
                  : l10n.followButtonText,
              textColor: primaryColor,
              borderColor: isFollowedByAuthUser ? accentColor : secondaryColor,
              isDisabled: isDisabled,
              onPressed: () {
                if (isFollowedByAuthUser) {
                  onUnFollowPressed?.call();
                } else {
                  onFollowPressed?.call();
                }
              },
              sizeType: CommonButtonSizeType.tiny,
            )
          : null,
    );
  }
}
