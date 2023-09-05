class SavePostDTO {
  final String authorUid;
  final String description;
  final String postUrl;
  final List<String> tags;
  final bool isReel;
  final String? placeInfo;

  SavePostDTO(
      {required this.authorUid,
      required this.description,
      required this.postUrl,
      required this.tags,
      required this.isReel,
      this.placeInfo});
}
