import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/domain/models/reel.dart';
import 'package:pic_connect/features/reels/widgets/reel_page_widget.dart';

import '../../../utils/colors.dart';

class ReelsViewer extends StatefulWidget {

  final List<ReelBO> reelsList;
  final bool showVerifiedTick;
  final Function(String)? onShare;
  final Function(String)? onLike;
  final Function(String)? onComment;
  final Function(int)? onIndexChanged;
  final Function()? onClickMoreBtn;
  final Function()? onFollow;
  final bool showProgressIndicator;
  final Function()? onClickBackArrow;

  const ReelsViewer({
    Key? key,
    required this.reelsList,
    this.showVerifiedTick = true,
    this.onClickMoreBtn,
    this.onComment,
    this.onFollow,
    this.onLike,
    this.onShare,
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
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            //We need swiper for every content
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ReelsPage(
                  item: widget.reelsList[index],
                  onClickMoreBtn: widget.onClickMoreBtn,
                  onComment: widget.onComment,
                  onFollow: widget.onFollow,
                  onLike: widget.onLike,
                  onShare: widget.onShare,
                  showVerifiedTick: widget.showVerifiedTick,
                  swiperController: controller,
                  showProgressIndicator: widget.showProgressIndicator,
                );
              },
              controller: controller,
              itemCount: widget.reelsList.length,
              scrollDirection: Axis.vertical,
              onIndexChanged: widget.onIndexChanged,
            ),
          ],
        ),
      ),
    );
  }
}