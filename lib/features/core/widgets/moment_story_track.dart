import 'package:advstory/advstory.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/domain/models/moment_story_data.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/features/core/helpers.dart';
import 'package:pic_connect/features/core/widgets/tags_row.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/date_formatter.dart';
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
                final storyContentHeader =
                    _buildStoryContentHeader(context, moment);
                final storyContentFooter =
                    _buildStoryContentFooter(context, moment);
                return moment.postType == PostTypeEnum.picture
                    ? _buildImageStoryContent(
                        moment.postUrl, storyContentHeader, storyContentFooter)
                    : _buildVideoStoryContent(
                        moment.postUrl, storyContentHeader, storyContentFooter);
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

  ImageContent _buildImageStoryContent(String storyContentUrl,
      Widget storyContentHeader, Widget storyContentFooter) {
    return ImageContent(
      url: storyContentUrl,
      duration: const Duration(seconds: 10),
      header: storyContentHeader,
      footer: storyContentFooter,
      timeout: const Duration(seconds: 5),
      errorBuilder: () => const Center(
        child: Text("An error occurred!"),
      )
    );
  }

  VideoContent _buildVideoStoryContent(String storyContentUrl,
      Widget storyContentHeader, Widget storyContentFooter) {
    return VideoContent(
      url: storyContentUrl,
      header: storyContentHeader,
      footer: storyContentFooter,
      timeout: const Duration(seconds: 15),
      errorBuilder: () => const Center(
        child: Text("An error occurred!"),
      ),
    );
  }

  Widget _buildStoryContentHeader(BuildContext context, PostBO moment) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 60,
            width: 60,
            child: buildCircleAvatar(
                imageUrl: moment.profImage,
                radius: 22,
                showBackgroundColor: false),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  moment.username,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                Text(
                  moment.placeInfo ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: primaryColor, fontWeight: FontWeight.w400),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryContentFooter(BuildContext context, PostBO moment) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: const TextStyle(color: primaryColor),
              children: [
                TextSpan(
                  text: moment.username,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: ' ${moment.description}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: primaryColor)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              DateFormatter.getTimeAgo(moment.datePublished),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: primaryColor),
            ),
          ),
          TagsRow(
            tags: moment.tags,
          )
        ],
      ),
    );
  }
}
