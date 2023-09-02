import 'package:advstory/advstory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/mock_story_data.dart';
import 'moment_animated_tray.dart';
import 'moment_story_content.dart';

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
          buildStoryOnTrayScroll: true,
          preloadContent: true,
          preloadStory: true,
          style: const AdvStoryStyle(
            trayListStyle: TrayListStyle(
              direction: Axis.horizontal,
            ),
            hideBars: false
          ),
          storyCount: userNames.length,
          storyBuilder: (index) {
            return Story(
              contentCount: 3,
              contentBuilder: (contentIndex) {
                return MomentStoryContent(contentIndex: contentIndex);
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