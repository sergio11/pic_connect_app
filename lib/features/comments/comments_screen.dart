import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/comments/comments_bloc.dart';
import 'package:pic_connect/features/core/widgets/comment_card.dart';
import 'package:pic_connect/utils/colors.dart';

class CommentsScreen extends StatefulWidget {
  final VoidCallback onBackPressed;

  const CommentsScreen({Key? key, required this.onBackPressed})
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
        },
        builder: (context, state) {
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
              style: Theme
                  .of(context)
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
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildCommentsListView(CommentsState state) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.commentsByPost.length,
      separatorBuilder: (context, index) =>
      const SizedBox(
        height: 8,
      ),
      itemBuilder: (ctx, index) =>
          CommentCard(
            commentBO: state.commentsByPost[index],
          ),
    );
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
        EdgeInsets.only(bottom: MediaQuery
            .of(context)
            .viewInsets
            .bottom),
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
                      hintStyle: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: accentColor),
                      border: InputBorder.none,
                    ),
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: accentColor)),
              ),
            ),
            InkWell(
              onTap: () =>
              {
                if(!state.isPublishingComment && commentEditingController.text.isNotEmpty) {
                  onPublishComment(state)
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  'Post',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(
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
