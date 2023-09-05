class SavePostCommentDTO {
  final String postId;
  final String text;
  final String authorUid;

  SavePostCommentDTO({
    required this.postId,
    required this.text,
    required this.authorUid,
  });
}
