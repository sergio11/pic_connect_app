import 'package:card_swiper/card_swiper.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/models/reel.dart';
import 'package:pic_connect/features/core/helpers.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/icon_action_animation.dart';
import 'package:pic_connect/features/core/widgets/lifecycle_watcher_state.dart';
import 'package:pic_connect/features/core/widgets/tags_row.dart';
import 'package:pic_connect/features/reels/reels_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/date_formatter.dart';
import 'package:pic_connect/utils/url_checker.dart';
import 'package:video_player/video_player.dart';

class ReelsPage extends StatefulWidget {
  final PostBO reelPost;

  final Function(String userUid) onShowUserProfile;
  final Function(String postId) onLikePost;
  final Function(String postId) onShowCommentsByPost;
  final Function(String postId) onShareContentClicked;
  final Function(String postId) onSaveBookmark;
  final SwiperController swiperController;
  final bool showProgressIndicator;

  const ReelsPage({
    Key? key,
    required this.reelPost,
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
    if (!UrlChecker.isImageUrl(widget.reelPost.postUrl) &&
        UrlChecker.isValid(widget.reelPost.postUrl)) {
      initializePlayer();
    }
    super.initState();
  }

  @override
  void onResumed() {
    debugPrint("ReelsPage - onResumed CALLED!");
    if (!UrlChecker.isImageUrl(widget.reelPost.postUrl) &&
        UrlChecker.isValid(widget.reelPost.postUrl)) {
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
    _videoPlayerController = VideoPlayerController.network(widget.reelPost.postUrl);
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
              onTap: () => widget.onShowUserProfile(widget.reelPost.postAuthorUid),
              child: buildCircleAvatar(
                  imageUrl: widget.reelPost.profImage, radius: 22)),
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
                    widget.reelPost.username,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.reelPost.placeInfo ?? "",
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
                onPressed: () => widget.onLikePost(widget.reelPost.postId),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.comment_outlined, color: primaryColor),
              onPressed: () => widget.onShowCommentsByPost(widget.reelPost.postId),
            ),
            IconButton(
                icon: const Icon(Icons.share, color: primaryColor),
                onPressed: () =>
                    widget.onShareContentClicked(widget.reelPost.postId)),
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
                onPressed: () => widget.onSaveBookmark(widget.reelPost.postId))
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
                '${widget.reelPost.likes.length} likes',
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
                    text: widget.reelPost.username,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text: ' ${widget.reelPost.description}',
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
                'View all ${widget.reelPost.commentCount} comments',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: primaryColor, fontWeight: FontWeight.w600),
              ),
            ),
            onTap: () => widget.onShowCommentsByPost(widget.reelPost.postId),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              DateFormatter.getTimeAgo(widget.reelPost.datePublished),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: primaryColor),
            ),
          ),
          TagsRow(
            tags: widget.reelPost.tags,
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
