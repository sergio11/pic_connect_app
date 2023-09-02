import 'package:card_swiper/card_swiper.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/domain/models/reel.dart';
import 'package:pic_connect/features/core/widgets/lifecycle_watcher_state.dart';
import 'package:pic_connect/features/reels/widgets/like_icon.dart';
import 'package:pic_connect/features/reels/widgets/screen_options.dart';
import 'package:video_player/video_player.dart';
import '../../../utils/url_checker.dart';
import '../../core/widgets/common_screen_progress_indicator.dart';

class ReelsPage extends StatefulWidget {

  final ReelBO item;
  final bool showVerifiedTick;
  final Function(String)? onShare;
  final Function(String)? onLike;
  final Function(String)? onComment;
  final Function()? onClickMoreBtn;
  final Function()? onFollow;
  final SwiperController swiperController;
  final bool showProgressIndicator;

  const ReelsPage({
    Key? key,
    required this.item,
    this.showVerifiedTick = true,
    this.onClickMoreBtn,
    this.onComment,
    this.onFollow,
    this.onLike,
    this.onShare,
    this.showProgressIndicator = true,
    required this.swiperController,
  }) : super(key: key);

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends LifecycleWatcherState<ReelsPage> {

  late VideoPlayerController _videoPlayerController;

  ChewieController? _chewieController;

  bool _liked = false;

  @override
  void initState() {
    if (!UrlChecker.isImageUrl(widget.item.url) &&
        UrlChecker.isValid(widget.item.url)) {
      initializePlayer();
    }
    super.initState();
  }

  @override
  void onResumed() {
    if (!UrlChecker.isImageUrl(widget.item.url) &&
        UrlChecker.isValid(widget.item.url)) {
      initializePlayer();
    }
  }

  @override
  void onPaused() {
    _closePlayer();
  }

  @override
  void dispose() {
    _closePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getVideoView();
  }

  Widget getVideoView() {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
            ? FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              onDoubleTap: () {
                if (!widget.item.isLiked) {
                  _liked = true;
                  if (widget.onLike != null) {
                    widget.onLike!(widget.item.url);
                  }
                  setState(() {});
                }
              },
              child: Chewie(
                controller: _chewieController!,
              ),
            ),
          ),
        )
            : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: CommonScreenProgressIndicator())
          ],
        ),
        if (_liked)
          const Center(
            child: LikeIcon(),
          ),
        if (widget.showProgressIndicator)
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: VideoProgressIndicator(
              _videoPlayerController,
              allowScrubbing: false,
              colors: const VideoProgressColors(
                backgroundColor: Colors.blueGrey,
                bufferedColor: Colors.blueGrey,
                playedColor: Colors.blueAccent,
              ),
            ),
          ),
        ScreenOptions(
          onClickMoreBtn: widget.onClickMoreBtn,
          onComment: widget.onComment,
          onFollow: widget.onFollow,
          onLike: widget.onLike,
          onShare: widget.onShare,
          showVerifiedTick: widget.showVerifiedTick,
          item: widget.item,
        )
      ],
    );
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.item.url);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: false,
    );
    setState(() {});
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        widget.swiperController.next();
      }
    });
  }

  void _closePlayer() {
    _videoPlayerController.dispose();
    if (_chewieController != null) {
      _chewieController!.dispose();
    }
  }
}