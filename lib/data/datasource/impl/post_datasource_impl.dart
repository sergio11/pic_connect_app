import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pic_connect/data/datasource/dto/comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/post_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_comment_dto.dart';
import 'package:pic_connect/data/datasource/dto/save_post_dto.dart';
import 'package:pic_connect/data/datasource/post_datasource.dart';
import 'package:pic_connect/utils/mapper.dart';

class PostDatasourceImpl extends PostDatasource {

  final FirebaseFirestore firestore;
  final Mapper<SavePostCommentDTO, Map<String, dynamic>> savePostCommentMapper;
  final Mapper<SavePostDTO, Map<String, dynamic>> savePostMapper;
  final Mapper<DocumentSnapshot, CommentDTO> commentMapper;
  final Mapper<DocumentSnapshot, PostDTO> postMapper;

  PostDatasourceImpl({
    required this.firestore,
    required this.savePostCommentMapper,
    required this.savePostMapper,
    required this.commentMapper,
    required this.postMapper
  });

  @override
  Future<void> deletePost(String postId) async {
    await firestore
        .collection('posts')
        .doc(postId)
        .delete();
  }

  @override
  Future<void> likePost({
    required String postId,
    required String uid
  }) async {
    final DocumentSnapshot snap = await firestore.collection('posts').doc(postId).get();
    List likes = (snap.data()! as dynamic)['likes'];
    if (likes.contains(uid)) {
      // if the likes list contains the user uid, we need to remove it
      firestore.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayRemove([uid])
      });
    } else {
      // else we need to add uid to the likes array
      firestore.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayUnion([uid])
      });
    }
  }

  @override
  Future<void> uploadPost(SavePostDTO post) async {
    final postData = savePostMapper(post);
    await firestore.collection('posts')
        .doc(postData['postId'])
        .set(postData);
  }

  @override
  Future<void> postComment(SavePostCommentDTO commentDTO) async {
    final commentData = savePostCommentMapper(commentDTO);
    await firestore
        .collection('posts')
        .doc(commentDTO.postId)
        .collection('comments')
        .doc(commentData['commentId'])
        .set(commentData);
  }

  @override
  Future<List<CommentDTO>> findAllCommentsByPostId(String postId) async {
    final comments = await firestore
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .get();
    return comments.docs
        .map((doc) => commentMapper(doc))
        .toList();
  }

  @override
  Future<PostDTO> findById(String id) async {
    final docSnap = await firestore
        .collection('posts')
        .doc(id)
        .get();
    return postMapper(docSnap);
  }

  @override
  Future<List<PostDTO>> findAllByUserUid(String userUi) async {
    final postByUser = await firestore
        .collection('posts')
        .where('authorUid', isEqualTo: userUi)
        .get();
    return postByUser.docs
        .map((doc) => postMapper(doc))
        .toList();
  }

  @override
  Future<List<PostDTO>> findAllOrderByDatePublished() async {
    final posts = await firestore
        .collection('posts')
        .orderBy('datePublished')
        .get();
    return posts.docs
        .map((doc) => postMapper(doc))
        .toList();
  }
}