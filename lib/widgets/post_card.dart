import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/providers/user_provider.dart';
import 'package:pic_connect/resources/firestore_methods.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/global_variable.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:pic_connect/widgets/like_animation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class PostCard extends StatefulWidget {
  final snap;

  const PostCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int commentLen = 0;
  bool isLikeAnimating = false;

  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }

  fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
      commentLen = snap.docs.length;
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
    setState(() {});
  }

  deletePost(String postId) async {
    try {
      await FireStoreMethods().deletePost(postId);
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      shadowColor: accentColor,
      child: Container(
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
        child: Column(
          children: [
            // HEADER SECTION OF THE POST
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 16,
              ).copyWith(right: 0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                      widget.snap['profImage'].toString(),
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
                            widget.snap['username'].toString(),
                            style: Theme.of(context)
                                .primaryTextTheme
                                .titleMedium
                                ?.copyWith(color: accentColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  widget.snap['uid'].toString() == user.uid
                      ? IconButton(
                    onPressed: () {
                      showDialog(
                        useRootNavigator: false,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: ListView(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16),
                                shrinkWrap: true,
                                children: [
                                  'Delete',
                                ]
                                    .map(
                                      (e) => InkWell(
                                      child: Container(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            vertical: 12,
                                            horizontal: 16),
                                        child: Text(e),
                                      ),
                                      onTap: () {
                                        deletePost(
                                          widget.snap['postId']
                                              .toString(),
                                        );
                                        // remove the dialog box
                                        Navigator.of(context).pop();
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
            ),
            // IMAGE SECTION OF THE POST
            GestureDetector(
              onDoubleTap: () {
                FireStoreMethods().likePost(
                  widget.snap['postId'].toString(),
                  user.uid,
                  widget.snap['likes'],
                );
                setState(() {
                  isLikeAnimating = true;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: Image.network(
                      widget.snap['postUrl'].toString(),
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
                        color: secondaryColor,
                        size: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // LIKE, COMMENT SECTION OF THE POST
            Row(
              children: <Widget>[
                LikeAnimation(
                  isAnimating: widget.snap['likes'].contains(user.uid),
                  smallLike: true,
                  child: IconButton(
                    icon: widget.snap['likes'].contains(user.uid)
                        ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                        : const Icon(Icons.favorite_border, color: secondaryColor),
                    onPressed: () => FireStoreMethods().likePost(
                      widget.snap['postId'].toString(),
                      user.uid,
                      widget.snap['likes'],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.comment_outlined, color: secondaryColor),
                  onPressed: () => {},
                ),
                IconButton(
                    icon: const Icon(Icons.send, color: secondaryColor),
                    onPressed: () {}),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                          icon: const Icon(Icons.bookmark_border, color: secondaryColor),
                          onPressed: () {}),
                    ))
              ],
            ),
            //DESCRIPTION AND NUMBER OF COMMENTS
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DefaultTextStyle(
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w800, color: accentColor),
                      child: Text(
                        '${widget.snap['likes'].length} likes',
                        style: Theme.of(context).textTheme.bodyMedium,
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
                            text: widget.snap['username'].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: accentColor),
                          ),
                          TextSpan(
                              text: ' ${widget.snap['description']}',
                              style: const TextStyle(color: accentColor)
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        'View all $commentLen comments',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: accentColor),
                      ),
                    ),
                    onTap: () => {},
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      DateFormat.yMMMd()
                          .format(widget.snap['datePublished'].toDate()),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: accentColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
