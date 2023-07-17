import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pic_connect/features/core/widgets/like_animation.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/global_variable.dart';

import 'post_card_bloc.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  bool isLikeAnimating = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCardBloc, PostCardState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildContent(state);
        });
  }

  Widget _buildContent(PostCardState state) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        // boundary needed for web
        decoration: BoxDecoration(
          border: Border.all(
            color: width > webScreenSize ? secondaryColor : mobileBackgroundColor,
          ),
          color: mobileBackgroundColor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
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
              state.postBO?.profImage ?? 'https://i.stack.imgur.com/l60Hf.png',
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
                    state.postBO?.username ?? "Empty",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          true
              ? IconButton(
                  onPressed: () {
                    showDialog(
                      useRootNavigator: false,
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: ListView(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shrinkWrap: true,
                              children: [
                                'Delete',
                              ]
                                  .map(
                                    (e) => InkWell(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 16),
                                          child: Text(e),
                                        ),
                                        onTap: () {
                                          // Delete Post
                                        }),
                                  )
                                  .toList()),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.more_vert),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
              state.postBO?.postUrl ?? 'https://i.stack.imgur.com/l60Hf.png',
              fit: BoxFit.cover,
            ),
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
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostActionsSection(PostCardState state) {
    final isLikedByAuthUser = state.postBO?.likes.contains(state.authUserUid ?? "") ?? false;
    return Row(
      children: <Widget>[
        LikeAnimation(
          isAnimating: isLikedByAuthUser,
          smallLike: true,
          child: IconButton(
            icon: isLikedByAuthUser
                ? const Icon(
              Icons.favorite,
              color: Colors.red,
            )
                : const Icon(
              Icons.favorite_border,
            ),
            onPressed: () => {},
          ),
        ),
        IconButton(
          icon: const Icon(Icons.comment_outlined,),
          onPressed: () => {},
        ),
        IconButton(
            icon: const Icon(Icons.send,),
            onPressed: () {}),
        Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  icon: const Icon(Icons.bookmark_border), onPressed: () {}),
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
          DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w800),
              child: Text(
                '${state.postBO?.likes.length ?? 0} likes',
                style: Theme.of(context).textTheme.bodyMedium,
              )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8,),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: primaryColor),
                children: [
                  TextSpan(
                    text: state.postBO?.username ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' ${state.postBO?.description ?? ""}',
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'View all ${0} comments',
                style: const TextStyle(
                  fontSize: 16,
                  color: secondaryColor,
                ),
              ),
            ),
            onTap: () => {},
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
               state.postBO?.datePublished != null ?
               DateFormat.yMMMd()
                   .format(state.postBO!.datePublished) : "",
              style: const TextStyle(
                color: secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
