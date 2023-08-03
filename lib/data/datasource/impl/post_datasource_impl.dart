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
  Future<bool> likePost({
    required String postId,
    required String uid
  }) async {
    final DocumentSnapshot snap = await firestore.collection('posts').doc(postId).get();
    List likes = (snap.data()! as dynamic)['likes'];
    final bool isLikedByUser;
    if (likes.contains(uid)) {
      // if the likes list contains the user uid, we need to remove it
      firestore.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayRemove([uid])
      });
      isLikedByUser = false;
    } else {
      // else we need to add uid to the likes array
      firestore.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayUnion([uid])
      });
      isLikedByUser = true;
    }
    return isLikedByUser;
  }

  @override
  Future<void> uploadPost(SavePostDTO post) async {
    final postData = savePostMapper(post);
    await firestore.collection('posts')
        .doc(postData['postId'])
        .set(postData);
  }

  @override
  Future<CommentDTO> postComment(SavePostCommentDTO commentDTO) async {
    final commentData = savePostCommentMapper(commentDTO);
    final postRef = firestore.collection('posts').doc(commentDTO.postId);
    await postRef
        .collection('comments')
        .doc(commentData['commentId'])
        .set(commentData);
    await postRef.update({ 'commentsCount': FieldValue.increment(1) });
    final commentSnap = await postRef
        .collection('comments')
        .doc(commentData['commentId'])
        .get();
    return commentMapper(commentSnap);
  }

  @override
  Future<List<CommentDTO>> findAllCommentsByPostId(String postId) async {
    final comments = await firestore
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .orderBy('datePublished', descending: true)
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
        .orderBy('datePublished', descending: true)
        .get();
    return posts.docs
        .map((doc) => postMapper(doc))
        .toList();
  }

  @override
  Future<List<PostDTO>> findAllByUserUidListOrderByDatePublished(List<String> userUidList) async {
    final postByUser = await firestore
        .collection('posts')
        .where('authorUid', whereIn: userUidList)
        .orderBy('datePublished', descending: true)
        .get();
    return postByUser.docs
        .map((doc) => postMapper(doc))
        .toList();
  }

  @override
  Future<List<PostDTO>> findAllFavoritesByUserUidOrderByDatePublished(String userUi) async {
    final favoritePostsByUser = await firestore
        .collection('posts')
        .where('likes', arrayContains: userUi)
        .orderBy('datePublished', descending: true)
        .get();
    return favoritePostsByUser.docs
        .map((doc) => postMapper(doc))
        .toList();
  }

  @override
  Future<bool> saveBookmark({required String postId, required String uid}) async {
    final DocumentSnapshot snap = await firestore.collection('posts').doc(postId).get();
    var data = snap.data() as Map<String, dynamic>;
    List bookmarks = data['bookmarks'] is List ? List<String>.from(data['bookmarks'] as List) : [];
    final bool isBookmarkedByUser;
    if (bookmarks.contains(uid)) {
      firestore.collection('posts').doc(postId).update({
        'bookmarks': FieldValue.arrayRemove([uid])
      });
      isBookmarkedByUser = false;
    } else {
      firestore.collection('posts').doc(postId).update({
        'bookmarks': FieldValue.arrayUnion([uid])
      });
      isBookmarkedByUser = true;
    }
    return isBookmarkedByUser;
  }

  @override
  Future<List<PostDTO>> findAllBookmarkByUserUidOrderByDatePublished(String userUi) async {
    final bookmarkPostsByUser = await firestore
        .collection('posts')
        .where('bookmarks', arrayContains: userUi)
        .orderBy('datePublished', descending: true)
        .get();
    return bookmarkPostsByUser.docs
        .map((doc) => postMapper(doc))
        .toList();
  }
}