import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pic_connect/data/datasource/dto/post_dto.dart';
import 'package:pic_connect/utils/mapper.dart';

class PostDtoMapper extends Mapper<DocumentSnapshot, PostDTO> {
  @override
  PostDTO call(DocumentSnapshot<Object?> object) {
    var snapshot = object.data() as Map<String, dynamic>;
    return PostDTO(
        postId: snapshot['postId'],
        description: snapshot['description'],
        authorUid: snapshot['authorUid'],
        datePublished: (snapshot['datePublished'] as Timestamp).toDate(),
        postUrl: snapshot['postUrl'],
        likes: List<String>.from(snapshot['likes'] as List),
        bookmarks: snapshot['bookmarks'] is List ? List<String>.from(snapshot['bookmarks'] as List) : [],
        commentCount: snapshot['commentsCount'] is int ? snapshot['commentsCount'] : 0,
        tags: snapshot['tags'] is List ? List<String>.from(snapshot['tags'] as List) : []
    );
  }
}