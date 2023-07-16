
class PostDTO {

  final String postId;
  final String description;
  final String authorUid;
  final DateTime datePublished;
  final String postUrl;
  final List<String> likes;

  PostDTO({
    required this.postId,
    required this.description,
    required this.authorUid,
    required this.datePublished,
    required this.postUrl,
    required this.likes
  });
}