import 'dart:io';
import 'package:advstory/advstory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/mock_story_data.dart';
import '../core/widgets/common_screen_progress_indicator.dart';


class MomentStoryContent extends StoryContent {
  const MomentStoryContent({
    required this.contentIndex,
    Key? key,
  }) : super(key: key);

  final int contentIndex;

  @override
  StoryContentState<MomentStoryContent> createState() =>
      MomentStoryContentState();
}

class MomentStoryContentState extends StoryContentState<MomentStoryContent> {
  File? _myImage;

  Future<void> fetchMomentAsync() async {
    /// Fetch and cache your file.
    final myImageFile = await loadFile(
      url: imageUrls[position.content % imageUrls.length],
    );

    setState(() {
      _myImage = myImageFile;
    });

    // Send story duration parameter to the markReady. AdvStory will use this
    // duration to start skip countdown.
    markReady(duration: const Duration(seconds: 15));
  }

  /// If you wonder why using initContent is better, see implementation of
  /// this method in [StoryContent].
  @override
  void initContent() {
    fetchMomentAsync();
    // Set a time limit to load this content.
    setTimeout(const Duration(seconds: 10));
  }

  @override
  void onTimeout() {
    // Show a message to user if content couldn't be displayed in desired time.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Content couldn't be displayed in time."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_myImage == null) {
      return const CommonScreenProgressIndicator();
    }
    return SizedBox.expand(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(_myImage!),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.deepOrange.withOpacity(.6),
              child: Text(
                "My story content for ${position.toString()}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onPause() {

  }
}