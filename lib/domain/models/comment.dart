
import 'package:pic_connect/domain/models/user.dart';

class CommentBO {

  final String commentId;
  final String postId;
  final DateTime datePublished;
  final String text;
  final UserBO author;

  CommentBO({
    required this.commentId,
    required this.postId,
    required this.datePublished,
    required this.text,
    required this.author
  });



}