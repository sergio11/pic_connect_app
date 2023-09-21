class CreatePostDTO {
  final String authorUid;
  final String description;
  final String postUrl;
  final List<String> tags;
  final bool isStoryMoment;
  final String type;
  final String? placeInfo;

  CreatePostDTO(
      {required this.authorUid,
      required this.description,
      required this.postUrl,
      required this.tags,
      required this.isStoryMoment,
      required this.type,
      this.placeInfo});
}
