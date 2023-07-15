
class PostBO {
  final String description;
  final String uid;
  final String username;
  final List<String> likes;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;

  const PostBO({
    required this.description,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });
}
