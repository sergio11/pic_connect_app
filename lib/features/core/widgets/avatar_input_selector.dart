import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pic_connect/utils/colors.dart';

class AvatarInputSelector extends StatelessWidget {

  final Uint8List? avatarImageData;
  final VoidCallback onPickUpImageFromGallery;

  const AvatarInputSelector({
    super.key,
    required this.onPickUpImageFromGallery,
    this.avatarImageData
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      avatarImageData != null
          ? _buildUserPicture(avatarImageData!)
          : _buildDefaultAvatarImage(),
      Positioned(
        bottom: -12,
        left: 100,
        child: IconButton(
          onPressed: () => onPickUpImageFromGallery(),
          icon: const Icon(Icons.add_a_photo, color: primaryColor),
        ),
      )
    ]);
  }

  Widget _buildUserPicture(Uint8List avatarImageData) {
    return CircleAvatar(
      radius: 64,
      backgroundImage: MemoryImage(avatarImageData),
      backgroundColor: primaryColor,
    );
  }

  Widget _buildDefaultAvatarImage() {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 2),
        shape: BoxShape.circle,
        color: secondaryColorMediumLight.withOpacity(0.5),
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.person,
        color: primaryColor,
        size: 100,
      ),
    );
  }
}
