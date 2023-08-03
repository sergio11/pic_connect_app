import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserListTile extends StatelessWidget {
  final UserBO userBO;
  final bool isFollowedByAuthUser;
  final bool isAuthUser;
  final VoidCallback onFollowPressed;
  final VoidCallback onUnFollowPressed;

  const UserListTile(
      {super.key,
      required this.userBO,
      required this.onFollowPressed,
      required this.onUnFollowPressed,
      required this.isFollowedByAuthUser,
      required this.isAuthUser});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            userBO.photoUrl,
          ),
          radius: 16,
        ),
      ),
      title: Text(
        userBO.username,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: accentColor, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(userBO.bio,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: accentColor)),
      trailing: isAuthUser
          ? CommonButton(
              text: isFollowedByAuthUser
                  ? l10n.unFollowButtonText
                  : l10n.followButtonText,
              backgroundColor:
                  isFollowedByAuthUser ? accentColor : secondaryColor,
              textColor: primaryColor,
              borderColor: isFollowedByAuthUser ? accentColor : secondaryColor,
              onPressed: () {
                if (isFollowedByAuthUser) {
                  onUnFollowPressed();
                } else {
                  onFollowPressed();
                }
              },
              sizeType: CommonButtonSizeType.small,
            )
          : null,
    );
  }
}
