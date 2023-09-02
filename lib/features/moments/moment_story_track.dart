import 'package:advstory/advstory.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/colors.dart';
import '../../utils/mock_story_data.dart';
import 'moment_animated_tray.dart';

class MomentStoryTrack extends StatelessWidget {

  const MomentStoryTrack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: const BoxDecoration(color: primaryColor,),
      child: SizedBox(
        height: 110,
        width: MediaQuery.of(context).size.width,
        child: AdvStory(
          // Disable story build on scroll to increasing animation
          // duration.
          buildStoryOnTrayScroll: false,
          style: const AdvStoryStyle(
            trayListStyle: TrayListStyle(
              direction: Axis.horizontal,
            ),
          ),
          storyCount: userNames.length,
          storyBuilder: (index) {
            return Story(
              contentCount: 3,
              contentBuilder: (contentIndex) {
                return contentIndex % 2 == 0
                    ? VideoContent(url: videoUrls[contentIndex])
                    : ImageContent(url: imageUrls[contentIndex]);
              },
            );
          },
          trayBuilder: (index) => MomentAnimatedTray(
            profilePic: profilePics[index],
          ),
        ),
      ),
    );
  }
}