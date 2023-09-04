import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/empty_state_widget.dart';
import 'package:pic_connect/features/reels/reels_bloc.dart';
import 'package:pic_connect/features/reels/widgets/reels_viewer_widget.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';

class ReelsViewerScreen extends StatefulWidget {
  final Function(String postId) onGoToCommentsByPost;
  final Function(String userUid) onShowUserProfile;

  const ReelsViewerScreen(
      {Key? key,
      required this.onGoToCommentsByPost,
      required this.onShowUserProfile})
      : super(key: key);

  @override
  State<ReelsViewerScreen> createState() => _ReelsViewerScreenState();
}

class _ReelsViewerScreenState extends State<ReelsViewerScreen> {
  void _refresh() {
    context.read<ReelsBloc>().add(const OnLoadTopReels());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReelsBloc, ReelsState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showErrorSnackBar(context: context, message: state.errorMessage!);
          }
        },
        builder: (context, state) => _buildScreenContent(state));
  }

  Widget _buildScreenContent(ReelsState state) {
    return Scaffold(
        backgroundColor: mobileBackgroundColor,
        body: state.isLoading
            ? _buildProgressIndicator()
            : state.topReels.isNotEmpty
                ? _buildReelsViewer(state)
                : _buildNoDataFound());
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildReelsViewer(ReelsState state) {
    return ReelsViewer(
      reelsList: state.topReels,
      onGoToCommentsByPost: widget.onGoToCommentsByPost,
      onShareContent: (String postId) {},
      onShowUserProfile: widget.onShowUserProfile,
      onLikePost: (String postId) {},
    );
  }

  Widget _buildNoDataFound() {
    return EmptyStateWidget(
        message: "No Reels was found, please try again later",
        iconData: Icons.mood_bad,
        onRetry: _refresh);
  }
}
