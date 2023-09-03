import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/features/core/widgets/animate_gradient_widget.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/utils/colors.dart';

Widget buildCircleAvatar(String imageUrl) {
  return imageUrl.isEmpty
      ? const CommonScreenProgressIndicator()
      : _buildCachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundColor: accentColor,
                backgroundImage: imageProvider,
                radius: 40,
              ));
}

Widget buildNetworkImage(String imageUrl) {
  return imageUrl.isEmpty
      ? const CommonScreenProgressIndicator()
      : _buildCachedNetworkImage(imageUrl: imageUrl);
}

CachedNetworkImage _buildCachedNetworkImage(
    {required String imageUrl, ImageWidgetBuilder? imageBuilder}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    fit: BoxFit.cover,
    imageBuilder: imageBuilder,
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        const CommonScreenProgressIndicator(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

AnimateGradient wrapIntoAnimateGradient({required Widget child}) {
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
