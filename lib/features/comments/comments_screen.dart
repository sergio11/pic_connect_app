import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/comments/comments_bloc.dart';
import 'package:pic_connect/features/core/widgets/comment_card.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/empty_state_widget.dart';
import 'package:pic_connect/utils/colors.dart';

class CommentsScreen extends StatefulWidget {
  final VoidCallback onBackPressed;
  final Function(String userUid) onShowUserProfile;

  const CommentsScreen(
      {Key? key, required this.onBackPressed, required this.onShowUserProfile})
      : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController commentEditingController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    commentEditingController.dispose();
  }

  void onRefresh(CommentsState state) async {
    context.read<CommentsBloc>().add(OnRefreshCommentsEvent(state.postId));
  }

  void onPublishComment(CommentsState state) async {
    context.read<CommentsBloc>().add(
        OnPublishCommentEvent(state.postId, commentEditingController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentsBloc, CommentsState>(
        listener: (context, state) {
      if (!state.isPublishingComment) {
        commentEditingController.clear();
      }
    }, builder: (context, state) {
      return _buildScreenContent(state);
    });
  }

  Widget _buildScreenContent(CommentsState state) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarBackgroundColor,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: accentColor,
              onPressed: () => widget.onBackPressed()),
          title: Text('Comments',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: accentColor)),
          centerTitle: false,
        ),
        body: state.isLoading
            ? _buildProgressIndicator()
            : _buildCommentsListView(state),
        bottomNavigationBar: _buildTextInput(state));
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildCommentsListView(CommentsState state) {
    return RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 1),
            () => onRefresh(state),
          );
        },
        child: state.commentsByPost.isNotEmpty
            ? ListView.separated(
                padding: const EdgeInsets.only(top: 8),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.commentsByPost.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () => widget.onShowUserProfile(
                      state.commentsByPost[index].author.uid),
                  child: CommentCard(
                    commentBO: state.commentsByPost[index],
                  ),
                ),
              )
            : EmptyStateWidget(
                message: "No comments found",
                iconData: Icons.mood_bad,
                onRetry: () => onRefresh(state),
              ));
  }

  Widget _buildTextInput(CommentsState state) {
    return SafeArea(
      child: Container(
        height: kToolbarHeight,
        decoration: const BoxDecoration(
          color: primaryColor,
          boxShadow: [
            BoxShadow(
                color: blackColor, blurRadius: 20, blurStyle: BlurStyle.outer),
          ],
        ),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(state.authUserImageUrl),
              radius: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: TextField(
                    controller: commentEditingController,
                    decoration: InputDecoration(
                      hintText: 'Comment as ',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: accentColor),
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: accentColor)),
              ),
            ),
            InkWell(
              onTap: () => {
                if (!state.isPublishingComment &&
                    commentEditingController.text.isNotEmpty)
                  {onPublishComment(state)}
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  'Post',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: secondaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
