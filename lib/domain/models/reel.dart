import 'package:pic_connect/domain/models/comment.dart';

class ReelBO {
  final String id;
  final String url;
  final bool isLiked;
  final int likeCount;
  final String userName;
  final String profileUrl;
  final String description;
  final String musicName;
  final List<CommentBO>? commentList;

  ReelBO(
      {required this.id,
      required this.url,
      required this.isLiked,
      required this.likeCount,
      required this.userName,
      required this.profileUrl,
      required this.description,
      required this.musicName,
      required this.commentList});
}
