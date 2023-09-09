import 'package:advstory/advstory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/utils/colors.dart';
import 'moment_animated_tray.dart';

class MomentStoryTrack extends StatelessWidget {
  final Map<UserBO, List<PostBO>> momentsByUser;

  const MomentStoryTrack({
    Key? key,
    required this.momentsByUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: const BoxDecoration(
        color: primaryColor,
      ),
      child: SizedBox(
        height: 110,
        width: MediaQuery.of(context).size.width,
        child: AdvStory(
          buildStoryOnTrayScroll: true,
          preloadContent: true,
          preloadStory: true,
          style: const AdvStoryStyle(
              trayListStyle: TrayListStyle(
                direction: Axis.horizontal,
              ),
              hideBars: false),
          storyCount: momentsByUser.length,
          storyBuilder: (index) {
            final moments = momentsByUser.entries.elementAtOrNull(index);
            return Story(
              contentCount: moments?.value.length ?? 0,
              contentBuilder: (contentIndex) {
                final moment = moments?.value.elementAtOrNull(contentIndex);
                return _buildImageStoryContent(moment);
              },
            );
          },
          trayBuilder: (index) => MomentAnimatedTray(
            user: momentsByUser.entries.elementAtOrNull(index)?.key,
          ),
        ),
      ),
    );
  }

  ImageContent _buildImageStoryContent(PostBO? moment) {
    return ImageContent(
      url: moment?.postUrl ?? "",
      duration: const Duration(seconds: 15),
      header: const Text(
        "Header",
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ),
      footer: const Text(
        "Footer",
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ),
      timeout: const Duration(seconds: 5),
      errorBuilder: () {
        /// You can create a timer here to skip next content using
        /// AdvStoryController.
        return const Center(
          child: Text("An error occured!"),
        );
      },
    );
  }

  VideoContent _buildVideoStoryContent(PostBO? moment) {
    return VideoContent(
      url: moment?.postUrl ?? "",
      header: const Text(
        "Header",
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ),
      footer: const Text(
        "Footer",
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ),
      timeout: const Duration(seconds: 15),
      errorBuilder: () {
        /// You can create a timer here to skip next content using
        /// AdvStoryController.
        return const Center(
          child: Text("An error occured!"),
        );
      },
    );
  }
}
