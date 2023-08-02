import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/core/widgets/like_animation.dart';
import 'package:pic_connect/features/core/widgets/tags_row.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';

import 'post_card_bloc.dart';

class PostCard extends StatefulWidget {
  final Function(String postId) onShowCommentsByPost;
  final Function() onPostDeleted;

  const PostCard(
      {Key? key,
      required this.onShowCommentsByPost,
      required this.onPostDeleted})
      : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;

  void onDeletePost(String postId) async {
    context.read<PostCardBloc>().add(OnDeletePostEvent(postId));
  }

  void onLikePost(String postId) async {
    context.read<PostCardBloc>().add(OnLikePostEvent(postId));
  }

  void onPostDeleted() async {
    showAlertDialog(
        context: context,
        title: "Post was deleted!",
        description: "The post was deleted successfully",
        onAcceptPressed: widget.onPostDeleted);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCardBloc, PostCardState>(
        listener: (context, state) {
      if (state.isPostDeleted) {
        onPostDeleted();
      }
    }, builder: (context, state) {
      return _buildContent(state);
    });
  }

  Widget _buildContent(PostCardState state) {
    return Container(
        color: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(children: [
          _buildPostHeaderSection(state),
          _buildPostBodySection(state),
          _buildPostActionsSection(state),
          _buildPostBottomSection(state)
        ]));
  }

  Widget _buildPostHeaderSection(PostCardState state) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ).copyWith(right: 0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
              state.authorImageUrl,
            ),
          ),
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
                    state.username,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: accentColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          state.isPostOwner
              ? IconButton(
                  onPressed: () {
                    showConfirmDialog(
                        context: context,
                        title: "Remove this post?",
                        description: "Are you sure to remove this post?",
                        onAcceptPressed: () => onDeletePost(state.postId));
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: accentColor,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildPostBodySection(PostCardState state) {
    return GestureDetector(
      onDoubleTap: () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Image border
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Image.network(
                  state.postImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onDoubleTap: () => onLikePost(state.postId),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isLikeAnimating ? 1 : 0,
            child: LikeAnimation(
              isAnimating: isLikeAnimating,
              duration: const Duration(
                milliseconds: 400,
              ),
              onEnd: () {
                setState(() {
                  isLikeAnimating = false;
                });
              },
              child: const Icon(
                Icons.favorite,
                color: accentColor,
                size: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostActionsSection(PostCardState state) {
    return Row(
      children: <Widget>[
        LikeAnimation(
          isAnimating: state.isLikedByAuthUser,
          smallLike: true,
          child: IconButton(
            icon: state.isLikedByAuthUser
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: accentColor,
                  ),
            onPressed: () => onLikePost(state.postId),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.comment_outlined, color: accentColor),
          onPressed: () => widget.onShowCommentsByPost(state.postId),
        ),
        IconButton(
            icon: const Icon(Icons.send, color: accentColor), onPressed: () {}),
        Expanded(
            child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
              icon: const Icon(Icons.bookmark_border, color: accentColor),
              onPressed: () {}),
        ))
      ],
    );
  }

  Widget _buildPostBottomSection(PostCardState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TagsRow(
            tags: state.tags,
            scrollController: ScrollController(),
            margin: const EdgeInsets.only(bottom: 15.0, right: 5.0),
          ),
          DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w800),
              child: Text(
                '${state.likes} likes',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: accentColor, fontWeight: FontWeight.bold),
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
                    text: state.username,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: accentColor, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text: ' ${state.description}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: accentColor)),
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'View all ${state.commentCount} comments',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: accentColor, fontWeight: FontWeight.w600),
              ),
            ),
            onTap: () => widget.onShowCommentsByPost(state.postId),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              state.datePublished,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
