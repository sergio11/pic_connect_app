import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';

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
