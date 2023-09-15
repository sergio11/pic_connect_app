import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pic_connect/di/service_locator.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/empty_state_widget.dart';
import 'package:pic_connect/features/feed/feed_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/moments/moment_story_track.dart';
import 'package:pic_connect/features/postcard/post_card.dart';
import 'package:pic_connect/features/postcard/post_card_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FeedScreen extends StatefulWidget {
  final Function() onShowFavoritePosts;
  final Function(String postId) onShowCommentsByPost;
  final Function(String userUid) onShowUserProfile;
  final Function() onGoToMessages;

  const FeedScreen(
      {Key? key,
      required this.onShowUserProfile,
      required this.onShowCommentsByPost,
      required this.onShowFavoritePosts,
      required this.onGoToMessages})
      : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late AppLocalizations _l10n;

  void onRefresh(FeedState state) async {
    context.read<FeedBloc>().add(OnLoadHomePostsEvent(state.authUserUid));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedBloc, FeedState>(listener: (context, state) {
      if (context.mounted) {
        if (state.errorMessage != null) {
          showErrorSnackBar(context: context, message: state.errorMessage!);
        }
      }
    }, builder: (context, state) {
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
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  if(state.momentsByFollowedUsers.isNotEmpty)
                    _buildMomentsStoryAppBar(state),
                  _buildPostsList(state),
                ],
              )),
    );
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildMomentsStoryAppBar(FeedState state) {
    return SliverAppBar(
      expandedHeight: 140,
      backgroundColor: primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: MomentStoryTrack(
          momentsByUser: state.momentsByFollowedUsers,
        ),
      ),
    );
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
          onPressed: widget.onGoToMessages,
        ),
      ],
    );
  }

  Widget _buildPostsList(FeedState state) {
    return state.posts.isNotEmpty
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              margin: const EdgeInsets.all(0),
              child: BlocProvider(
                create: (context) => serviceLocator<PostCardBloc>()
                  ..add(
                    OnShowPostEvent(state.posts[index], state.authUserUid),
                  ),
                child: PostCard(
                  onShowCommentsByPost: (String postId) =>
                      widget.onShowCommentsByPost(postId),
                  onPostDeleted: () => onRefresh(state),
                  onShowUserProfile: (String userUid) =>
                      widget.onShowUserProfile(userUid),
                ),
              ),
            ),
            childCount: state.posts.length,
          ))
        : SliverFillRemaining(
            hasScrollBody: false,
            child: EmptyStateWidget(
              message: _l10n.noPublicationsFound,
              iconData: Icons.mood_bad,
              onRetry: () => onRefresh(state),
            ),
          );
  }
}
