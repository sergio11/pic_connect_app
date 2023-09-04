import 'package:card_swiper/card_swiper.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/domain/models/reel.dart';
import 'package:pic_connect/features/core/helpers.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/icon_action_animation.dart';
import 'package:pic_connect/features/core/widgets/lifecycle_watcher_state.dart';
import 'package:pic_connect/features/core/widgets/tags_row.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/url_checker.dart';
import 'package:video_player/video_player.dart';

class ReelsPage extends StatefulWidget {
  final ReelBO item;

  final Function(String userUid) onShowUserProfile;
  final Function(String postId) onLikePost;
  final Function(String postId) onShowCommentsByPost;
  final Function(String postId) onShareContentClicked;
  final Function(String postId) onSaveBookmark;
  final SwiperController swiperController;
  final bool showProgressIndicator;

  const ReelsPage({
    Key? key,
    required this.item,
    required this.onShowUserProfile,
    required this.onLikePost,
    required this.onShowCommentsByPost,
    required this.onShareContentClicked,
    required this.onSaveBookmark,
    this.showProgressIndicator = true,
    required this.swiperController,
  }) : super(key: key);

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends LifecycleWatcherState<ReelsPage> {

  late VideoPlayerController _videoPlayerController;
  final double _videoContainerRatio = 0.49;
  ChewieController? _chewieController;

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
    debugPrint("ReelsPage - onResumed CALLED!");
    if (!UrlChecker.isImageUrl(widget.item.url) &&
        UrlChecker.isValid(widget.item.url)) {
      initializePlayer();
    }
  }

  @override
  void onPaused() {
    debugPrint("ReelsPage - onPaused CALLED!");
    _closePlayer();
  }

  @override
  void dispose() {
    debugPrint("ReelsPage - dispose CALLED!");
    _closePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getVideoView();
  }

  Widget getVideoView() {
    return Container(
        color: primaryColor,
        child: Stack(
          children: [
            _chewieController != null &&
                    _chewieController!.videoPlayerController.value.isInitialized
                ? _buildVideoViewer()
                : _buildLoadingView(),
            _buildPostHeaderSection(),
            _buildPostActionsSection(),
            _buildPostBottomSection(),
            if (widget.showProgressIndicator)
              _buildVideoPlayerProgressIndicator(),
          ],
        ));
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

  Widget _buildVideoPlayerProgressIndicator() {
    return Positioned(
      bottom: 65,
      width: MediaQuery.of(context).size.width,
      child: VideoProgressIndicator(
        _videoPlayerController,
        allowScrubbing: false,
        colors: const VideoProgressColors(
          backgroundColor: primaryColor,
          bufferedColor: secondaryColorLight,
          playedColor: secondaryColor,
        ),
      ),
    );
  }

  Widget _buildLoadingView() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Expanded(child: CommonScreenProgressIndicator())],
    );
  }

  Widget _buildVideoViewer() {
    return AspectRatio(
        aspectRatio: _videoContainerRatio,
        child: Stack(children: <Widget>[
          Transform.scale(
            scale: _getScale(),
            child: AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: Chewie(
                controller: _chewieController!,
              ),
            ),
          ),
        ]));
  }

  Widget _buildPostHeaderSection() {
    return Container(
      padding: const EdgeInsets.only(top: 65, left: 10),
      child: Row(
        children: <Widget>[
          GestureDetector(
              onTap: () => widget.onShowUserProfile(widget.item.id),
              child: buildCircleAvatar(
                  imageUrl: widget.item.profileUrl, radius: 22)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sergio Sánchez",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Madrid, Spain",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: primaryColor, fontWeight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostActionsSection() {
    return Container(
        padding: const EdgeInsets.only(right: 10),
        alignment: Alignment.bottomRight,
        height: MediaQuery.of(context).size.height * 0.60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconActionAnimation(
              isAnimating: true,
              smallAction: true,
              child: IconButton(
                icon: true
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: primaryColor,
                      ),
                onPressed: () => widget.onLikePost(widget.item.id),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.comment_outlined, color: primaryColor),
              onPressed: () => widget.onShowCommentsByPost(widget.item.id),
            ),
            IconButton(
                icon: const Icon(Icons.share, color: primaryColor),
                onPressed: () =>
                    widget.onShareContentClicked(widget.item.id)),
            IconButton(
                icon: true
                    ? const Icon(
                        Icons.bookmark,
                        color: primaryColor,
                      )
                    : const Icon(
                        Icons.bookmark_border,
                        color: primaryColor,
                      ),
                onPressed: () => widget.onSaveBookmark(widget.item.id))
          ],
        ));
  }

  Widget _buildPostBottomSection() {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w800),
              child: Text(
                '10 likes',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
              )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: primaryColor),
                children: [
                  TextSpan(
                    text: "Sergio Sánchez",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text: ' ${widget.item.description}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: primaryColor)),
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'View all 11 comments',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: primaryColor, fontWeight: FontWeight.w600),
              ),
            ),
            onTap: () => widget.onShowCommentsByPost(widget.item.id),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "15m ago",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: primaryColor),
            ),
          ),
          TagsRow(
            tags: ["test", "flutter", "hola", "android"],
            scrollController: ScrollController(),
            margin: const EdgeInsets.only(top: 10.0, bottom: 15.0, right: 5.0),
          ),
        ],
      ),
    );
  }

  double _getScale() {
    double videoRatio = _videoPlayerController.value.aspectRatio;
    if (videoRatio < _videoContainerRatio) {
      ///for tall videos, we just return the inverse of the controller aspect ratio
      return _videoContainerRatio / videoRatio;
    } else {
      ///for wide videos, divide the video AR by the fixed container AR
      ///so that the video does not over scale
      return videoRatio / _videoContainerRatio;
    }
  }
}
