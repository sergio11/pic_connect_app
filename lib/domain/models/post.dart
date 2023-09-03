
class PostBO {
  final String description;
  final String username;
  final List<String> likes;
  final List<String> bookmarks;
  final String postId;
  final String postAuthorUid;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;
  final int commentCount;
  final List<String> tags;
  final bool isReel;
  final String? placeInfo;

  const PostBO({
    required this.description,
    required this.username,
    required this.likes,
    required this.bookmarks,
    required this.postId,
    required this.postAuthorUid,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.commentCount,
    required this.tags,
    required this.isReel,
    this.placeInfo
  });
}
