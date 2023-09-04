import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/domain/models/reel.dart';
import 'package:pic_connect/features/reels/widgets/reel_page_widget.dart';

import '../../../utils/colors.dart';

class ReelsViewer extends StatefulWidget {

  final List<ReelBO> reelsList;
  final Function(String postId) onGoToCommentsByPost;
  final Function(String postId) onShareContent;
  final Function(String userUid) onShowUserProfile;
  final Function(String)? onLike;
  final Function(int)? onIndexChanged;
  final Function()? onClickMoreBtn;
  final Function()? onFollow;
  final bool showProgressIndicator;
  final Function()? onClickBackArrow;

  const ReelsViewer({
    Key? key,
    required this.reelsList,
    this.onClickMoreBtn,
    required this.onGoToCommentsByPost,
    required this.onShowUserProfile,
    this.onFollow,
    this.onLike,
    required this.onShareContent,
    this.onClickBackArrow,
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
        return ReelsPage(
          item: widget.reelsList[index],
          swiperController: controller,
          onShowUserProfile: widget.onShowUserProfile,
          showProgressIndicator: widget.showProgressIndicator,
          onLikePost: (String postId) {  },
          onShowCommentsByPost: (String postId) {  },
          onShareContentClicked: (String postId) {  },
          onSaveBookmark: (String postId) {  },
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