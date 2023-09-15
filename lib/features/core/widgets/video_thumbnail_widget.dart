import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailWidget extends StatefulWidget {
  final String videoUrl;

  const VideoThumbnailWidget({super.key, required this.videoUrl});

  @override
  VideoThumbnailWidgetState createState() => VideoThumbnailWidgetState();
}

class VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  String? thumbnailFileName;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
  }

  Future<void> _generateThumbnail() async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: widget.videoUrl,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
    );

    if (mounted) {
      setState(() {
        thumbnailFileName = fileName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return thumbnailFileName != null
        ? FittedBox(
            fit: BoxFit.cover,
            child: Image(image: FileImage(File(thumbnailFileName!))),
          )
        : const CommonScreenProgressIndicator();
  }
}
