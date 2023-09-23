class RoomBO {
  final String uid;
  final String? name;
  final String? subtitle;
  final String type;
  final String? imageUrl;
  final int? updatedAt;
  final int? createAt;

  RoomBO(
      {required this.uid,
      required this.name,
      required this.subtitle,
      required this.type,
      required this.imageUrl,
      required this.updatedAt,
      required this.createAt});
}
