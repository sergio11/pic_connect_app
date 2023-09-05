import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pic_connect/features/core/helpers.dart';
import 'package:pic_connect/utils/colors.dart';

class AvatarInputSelector extends StatelessWidget {
  final Uint8List? avatarImageData;
  final String? currentImageUrl;
  final VoidCallback onPickUpImageFromGallery;

  const AvatarInputSelector(
      {super.key,
      required this.onPickUpImageFromGallery,
      this.avatarImageData,
      this.currentImageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 2),
            shape: BoxShape.circle,
            color: secondaryColorMediumLight.withOpacity(0.5),
          ),
          alignment: Alignment.center,
          child: avatarImageData != null
              ? _buildUserPicture(avatarImageData!)
              : currentImageUrl != null
                  ? _buildCurrentUserPicture(currentImageUrl!)
                  : _buildDefaultAvatarImage()),
      Positioned(
        bottom: 0,
        left: 100,
        child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: secondaryColorMediumLight, width: 1),
              shape: BoxShape.circle,
              color: primaryColor,
            ),
            child: IconButton(
              onPressed: () => onPickUpImageFromGallery(),
              icon: const Icon(Icons.add_a_photo,
                  color: secondaryColorMediumLight),
            )),
      )
    ]);
  }

  Widget _buildUserPicture(Uint8List avatarImageData) {
    return CircleAvatar(
      radius: 100,
      backgroundImage: MemoryImage(avatarImageData),
      backgroundColor: primaryColor,
    );
  }

  Widget _buildCurrentUserPicture(String profilePictureUrl) {
    return buildCircleAvatar(imageUrl: profilePictureUrl, radius: 100);
  }

  Widget _buildDefaultAvatarImage() {
    return const Icon(
      Icons.person,
      color: primaryColor,
      size: 100,
    );
  }
}
