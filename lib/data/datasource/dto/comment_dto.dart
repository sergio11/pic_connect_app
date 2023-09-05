class CommentDTO {
  final String commentId;
  final String postId;
  final String text;
  final String authorUid;
  final DateTime datePublished;

  CommentDTO(
      {required this.commentId,
      required this.postId,
      required this.text,
      required this.authorUid,
      required this.datePublished});
}
