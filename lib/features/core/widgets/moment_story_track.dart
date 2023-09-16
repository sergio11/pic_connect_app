import 'package:advstory/advstory.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/domain/models/moment_story_data.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'moment_animated_tray.dart';

class MomentStoryTrack extends StatelessWidget {

  final Color backgroundColor;
  final List<MomentStoryDataBO> momentStoryDataList;
  final EdgeInsets margin;

  const MomentStoryTrack({
    Key? key,
    required this.backgroundColor,
    required this.momentStoryDataList,
    this.margin = const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
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
          storyCount: momentStoryDataList.length,
          storyBuilder: (index) {
            final moments = momentStoryDataList.elementAt(index).getMoments();
            return Story(
              contentCount: moments.length,
              contentBuilder: (contentIndex) {
                final moment = moments.elementAt(contentIndex);
                return moment.postType == PostTypeEnum.picture
                    ? _buildImageStoryContent(moment)
                    : _buildVideoStoryContent(moment);
              },
            );
          },
          trayBuilder: (index) {
            final momentStoryData = momentStoryDataList.elementAt(index);
            return MomentAnimatedTray(
              imageUrl: momentStoryData.getTrayImageUrl(),
              label: momentStoryData.getTrayTitle(),
            );
          },
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
