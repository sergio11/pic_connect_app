import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pic_connect/di/service_locator.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/empty_state_widget.dart';
import 'package:pic_connect/features/feed/feed_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/postcard/post_card.dart';
import 'package:pic_connect/features/postcard/post_card_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import '../moments/moment_story_track.dart';

class FeedScreen extends StatefulWidget {
  final Function() onShowFavoritePosts;
  final Function(String postId) onShowCommentsByPost;
  final Function(String userUid) onShowUserProfile;

  const FeedScreen(
      {Key? key,
      required this.onShowUserProfile,
      required this.onShowCommentsByPost,
      required this.onShowFavoritePosts})
      : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  void onRefresh(FeedState state) async {
    context.read<FeedBloc>().add(OnLoadHomePostsEvent(state.authUserUid));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedBloc, FeedState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildScreenContent(state);
        });
  }

  Widget _buildScreenContent(FeedState state) {
    return Scaffold(
        backgroundColor: mobileBackgroundColor,
        appBar: _buildAppBar(),
        body: state.isLoading
            ? _buildProgressIndicator()
            : RefreshIndicator(
                backgroundColor: secondaryColor,
                color: accentColor,
                onRefresh: () => Future.delayed(
                      const Duration(seconds: 1),
                      () => onRefresh(state),
                    ),
                child: Column(
                  children: [_buildStoryTrack(), _buildPostsList(state)],
                )));
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: appBarBackgroundColor,
      centerTitle: false,
      title: SvgPicture.asset(
        'assets/pic_connect_logo.svg',
        color: accentColor,
        height: 32,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.favorite_border,
            color: accentColor,
          ),
          onPressed: widget.onShowFavoritePosts,
        ),
        IconButton(
          icon: const Icon(
            Icons.send,
            color: accentColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildStoryTrack() {
    return const MomentStoryTrack();
  }

  Widget _buildPostsList(FeedState state) {
    return Expanded(
      child: state.posts.isNotEmpty
          ? ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: state.posts.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 4,
              ),
              itemBuilder: (ctx, index) => Container(
                margin: const EdgeInsets.all(0),
                child: BlocProvider(
                    create: (context) => serviceLocator<PostCardBloc>()
                      ..add(OnShowPostEvent(
                          state.posts[index], state.authUserUid)),
                    child: PostCard(
                      onShowCommentsByPost: (String postId) =>
                          widget.onShowCommentsByPost(postId),
                      onPostDeleted: () => onRefresh(state),
                      onShowUserProfile: (String userUid) =>
                          widget.onShowUserProfile(userUid),
                    )),
              ),
            )
          : EmptyStateWidget(
              message: 'No publications found',
              iconData: Icons.mood_bad,
              onRetry: () => onRefresh(state),
            ),
    );
  }
}
