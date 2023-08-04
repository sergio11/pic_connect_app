import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/features/core/widgets/animate_gradient_widget.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/utils/colors.dart';

Widget buildNetworkImage(String imageUrl) {
  return imageUrl.isEmpty
      ? const CommonScreenProgressIndicator()
      : CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const CommonScreenProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
}

AnimateGradient wrapIntoAnimateGradient({ required Widget child }) {
  return AnimateGradient(
      primaryBegin: Alignment.topLeft,
      primaryEnd: Alignment.bottomLeft,
      secondaryBegin: Alignment.bottomLeft,
      secondaryEnd: Alignment.topRight,
      primaryColors: [
        secondaryColorMediumLight.withOpacity(0.8),
        accentColorShadow.withOpacity(0.8)
      ],
      secondaryColors: [
        secondaryColorLight.withOpacity(0.8),
        accentColorShadow.withOpacity(0.8)
      ],
      child: child);
}
