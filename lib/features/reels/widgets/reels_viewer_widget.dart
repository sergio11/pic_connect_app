import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/models/reel.dart';
import 'package:pic_connect/features/core/widgets/reel_preview_widget.dart';

import '../../../utils/colors.dart';

class ReelsViewer extends StatefulWidget {

  final List<PostBO> reelsList;
  final Function(String postId) onGoToCommentsByPost;
  final Function(String postId) onShareContent;
  final Function(String userUid) onShowUserProfile;
  final Function(String postId) onLikePost;
  final Function(String postId) onSaveBookmark;
  final Function(int)? onIndexChanged;
  final bool showProgressIndicator;

  const ReelsViewer({
    Key? key,
    required this.reelsList,
    required this.onGoToCommentsByPost,
    required this.onShowUserProfile,
    required this.onLikePost,
    required this.onShareContent,
    required this.onSaveBookmark,
    this.onIndexChanged,
    this.showProgressIndicator =true,
  }) : super(key: key);

  @override
  State<ReelsViewer> createState() => _ReelsViewerState();
}

class _ReelsViewerState extends State<ReelsViewer> {
  SwiperController controller = SwiperController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ReelsPreview(
          reelPost: widget.reelsList[index],
          swiperController: controller,
          onShowUserProfile: widget.onShowUserProfile,
          showProgressIndicator: widget.showProgressIndicator,
          onLikePost: (String postId) => widget.onLikePost(postId),
          onShowCommentsByPost: (String postId) => widget.onGoToCommentsByPost(postId),
          onShareContentClicked: (String postId) => widget.onShareContent(postId),
          onSaveBookmark: (String postId) => widget.onSaveBookmark(postId),
        );
      },
      indicatorLayout: PageIndicatorLayout.SCALE,
      itemCount: widget.reelsList.length,
      loop: true,
      controller: controller,
      scrollDirection: Axis.vertical,
      onIndexChanged: widget.onIndexChanged,
    );
  }
}