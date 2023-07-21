
class PostBO {
  final String description;
  final String username;
  final List<String> likes;
  final String postId;
  final String postAuthorUid;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;
  final int commentCount;

  const PostBO({
    required this.description,
    required this.username,
    required this.likes,
    required this.postId,
    required this.postAuthorUid,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.commentCount
  });
}
