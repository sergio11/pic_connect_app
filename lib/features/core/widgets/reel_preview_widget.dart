import 'package:card_swiper/card_swiper.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/features/core/helpers.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/icon_action_animation.dart';
import 'package:pic_connect/features/core/widgets/lifecycle_watcher_state.dart';
import 'package:pic_connect/features/core/widgets/tags_row.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/date_formatter.dart';
import 'package:pic_connect/utils/url_checker.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReelsPreview extends StatefulWidget {
  final PostBO reelPost;

  final Function(String userUid) onShowUserProfile;
  final Function(String postId) onLikePost;
  final Function(String postId) onShowCommentsByPost;
  final Function(String postId) onShareContentClicked;
  final Function(String postId) onSaveBookmark;
  final SwiperController swiperController;
  final bool showProgressIndicator;
  final bool isLikedByAuthUser;
  final bool isBookmarkedByAuthUser;

  const ReelsPreview({
    Key? key,
    required this.reelPost,
    required this.onShowUserProfile,
    required this.onLikePost,
    required this.onShowCommentsByPost,
    required this.onShareContentClicked,
    required this.onSaveBookmark,
    this.showProgressIndicator = true,
    this.isLikedByAuthUser = false,
    this.isBookmarkedByAuthUser = false,
    required this.swiperController,
  }) : super(key: key);

  @override
  State<ReelsPreview> createState() => _ReelsPreviewState();
}

class _ReelsPreviewState extends LifecycleWatcherState<ReelsPreview> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool isHeaderVisible = false;
  late AppLocalizations _l10n;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context);
  }

  @override
  void initState() {
    if (!UrlChecker.isImageUrl(widget.reelPost.postUrl) &&
        UrlChecker.isValid(widget.reelPost.postUrl)) {
      initializePlayer();
    }
    super.initState();
  }

  @override
  void dispose() {
    debugPrint("ReelsPreview - dispose CALLED!");
    _closePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getVideoView();
  }

  Widget getVideoView() {
    return Stack(
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? _buildVideoViewer()
            : _buildLoadingView(),
        _buildPostHeaderSection(),
        _buildPostActionsSection(),
        _buildPostBottomSection(),
        if (widget.showProgressIndicator) _buildVideoPlayerProgressIndicator(),
      ],
    );
  }

  Future initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.reelPost.postUrl));
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      showControls: false,
      looping: true,
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
    return VisibilityDetector(
        key: Key(widget.reelPost.postUrl),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction == 1) {
            _chewieController?.play();
          } else {
            _chewieController?.pause();
          }
        },
        child: Transform.scale(
          scale: 1.2,
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Chewie(
                controller: _chewieController!,
              ),
            ),
          ),
        ));
  }

  Widget _buildPostHeaderSection() {
    return VisibilityDetector(
        key: Key(const Uuid().v1()),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction == 1 && !isHeaderVisible) {
            setState(() {
              isHeaderVisible = true;
            });
          }
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 1000),
          opacity: isHeaderVisible ? 1.0 : 0.0,
          child: Container(
            padding: const EdgeInsets.only(top: 65, left: 10),
            child: Row(
              children: <Widget>[
                GestureDetector(
                    onTap: () =>
                        widget.onShowUserProfile(widget.reelPost.postAuthorUid),
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: buildCircleAvatar(
                          imageUrl: widget.reelPost.profImage,
                          radius: 22,
                          showBackgroundColor: false),
                    )),
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
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.reelPost.placeInfo ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w400),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
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
              isAnimating: widget.isLikedByAuthUser,
              smallAction: true,
              child: IconButton(
                icon: widget.isLikedByAuthUser
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
              onPressed: () =>
                  widget.onShowCommentsByPost(widget.reelPost.postId),
            ),
            IconButton(
                icon: const Icon(Icons.share, color: primaryColor),
                onPressed: () =>
                    widget.onShareContentClicked(widget.reelPost.postId)),
            IconButton(
                icon: widget.isBookmarkedByAuthUser
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
                _l10n.postLikesCount
                    .replaceAll("%s", widget.reelPost.likes.length.toString()),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: primaryColor, fontWeight: FontWeight.bold),
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
                _l10n.postViewAllComments
                    .replaceAll("%s", widget.reelPost.commentCount.toString()),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: primaryColor, fontWeight: FontWeight.w600),
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
          ),
        ],
      ),
    );
  }
}
