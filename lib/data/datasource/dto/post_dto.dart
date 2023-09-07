class PostDTO {
  final String postId;
  final String description;
  final String authorUid;
  final DateTime datePublished;
  final String postUrl;
  final String type;
  final List<String> likes;
  final List<String> bookmarks;
  final int commentCount;
  final List<String> tags;
  final String? placeInfo;

  PostDTO(
      {required this.postId,
      required this.description,
      required this.authorUid,
      required this.datePublished,
      required this.postUrl,
      required this.type,
      required this.likes,
      required this.bookmarks,
      required this.commentCount,
      required this.tags,
      this.placeInfo});
}
