import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pic_connect/data/datasource/dto/comment_dto.dart';
import 'package:pic_connect/utils/mapper.dart';

class CommentDtoMapper extends Mapper<DocumentSnapshot, CommentDTO> {
  @override
  CommentDTO call(DocumentSnapshot<Object?> object) {
    var snapshot = object.data() as Map<String, dynamic>;
    return CommentDTO(
        commentId: snapshot['commentId'],
        postId: snapshot['postId'],
        text: snapshot['text'],
        authorUid: snapshot['authorUid'],
        datePublished: (snapshot['datePublished'] as Timestamp).toDate());
  }
}
