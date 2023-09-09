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

  PostDatasourceImpl(
      {required this.firestore,
      required this.savePostCommentMapper,
      required this.savePostMapper,
      required this.commentMapper,
      required this.postMapper});

  @override
  Future<void> deletePost(String postId) async {
    await firestore.collection('posts').doc(postId).delete();
  }

  @override
  Future<bool> likePost(
      {required String postId, required String userUuid}) async {
    final DocumentReference postRef = firestore.collection('posts').doc(postId);
    final DocumentSnapshot snap = await postRef.get();
    Map<String, dynamic> postData = snap.data() as Map<String, dynamic>;
    List<String> likes = List<String>.from(postData['likes'] ?? []);
    final bool isLikedByUser;
    if (likes.contains(userUuid)) {
      likes.remove(userUuid);
      await postRef.update({
        'likes': likes,
        'likesCount': FieldValue.increment(-1),
      });
      isLikedByUser = false;
    } else {
      likes.add(userUuid);
      await postRef.update({
        'likes': likes,
        'likesCount': FieldValue.increment(1),
      });
      isLikedByUser = true;
    }
    return isLikedByUser;
  }

  @override
  Future<void> uploadPost(SavePostDTO post) async {
    final postData = savePostMapper(post);
    await firestore.collection('posts').doc(postData['postId']).set(postData);
  }

  @override
  Future<CommentDTO> postComment(SavePostCommentDTO commentDTO) async {
    final commentData = savePostCommentMapper(commentDTO);
    final postRef = firestore.collection('posts').doc(commentDTO.postId);
    await postRef
        .collection('comments')
        .doc(commentData['commentId'])
        .set(commentData);
    await postRef.update({'commentsCount': FieldValue.increment(1)});
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
    return comments.docs.map((doc) => commentMapper(doc)).toList();
  }

  @override
  Future<PostDTO> findById(String id) async {
    final docSnap = await firestore.collection('posts').doc(id).get();
    return postMapper(docSnap);
  }

  @override
  Future<List<PostDTO>> findAllByUserUidOrderByDatePublished(
      String userUuid) async {
    final postByUser = await firestore
        .collection('posts')
        .where('authorUid', isEqualTo: userUuid)
        .orderBy('datePublished', descending: true)
        .get();
    return postByUser.docs.map((doc) => postMapper(doc)).toList();
  }

  @override
  Future<List<PostDTO>> findPicturesByUserUidOrderByDatePublished(
      String userUuid) async {
    final posts = await firestore
        .collection('posts')
        .where('authorUid', isEqualTo: userUuid)
        .where("type", isEqualTo: "picture")
        .orderBy('datePublished', descending: true)
        .get();
    return posts.docs.map((doc) => postMapper(doc)).toList();
  }

  @override
  Future<List<PostDTO>> findReelsByUserUidOrderByDatePublished(
      String userUuid) async {
    final posts = await firestore
        .collection('posts')
        .where('authorUid', isEqualTo: userUuid)
        .where("type", isEqualTo: "reel")
        .orderBy('datePublished', descending: true)
        .get();
    return posts.docs.map((doc) => postMapper(doc)).toList();
  }

  @override
  Future<List<PostDTO>> findAllOrderByDatePublished() async {
    final posts = await firestore
        .collection('posts')
        .orderBy('datePublished', descending: true)
        .get();
    return posts.docs.map((doc) => postMapper(doc)).toList();
  }

  @override
  Future<List<PostDTO>> findAllByUserUidListOrderByDatePublished(
      List<String> userUuidList) async {
    final postByUser = await firestore
        .collection('posts')
        .where('authorUid', whereIn: userUuidList)
        .orderBy('datePublished', descending: true)
        .get();
    return postByUser.docs.map((doc) => postMapper(doc)).toList();
  }

  @override
  Future<List<PostDTO>> findAllFavoritesByUserUidOrderByDatePublished(
      String userUuid) async {
    final favoritePostsByUser = await firestore
        .collection('posts')
        .where('likes', arrayContains: userUuid)
        .orderBy('datePublished', descending: true)
        .get();
    return favoritePostsByUser.docs.map((doc) => postMapper(doc)).toList();
  }

  @override
  Future<bool> saveBookmark(
      {required String postId, required String userUuid}) async {
    final DocumentSnapshot snap =
        await firestore.collection('posts').doc(postId).get();
    var data = snap.data() as Map<String, dynamic>;
    List bookmarks = data['bookmarks'] is List
        ? List<String>.from(data['bookmarks'] as List)
        : [];
    final bool isBookmarkedByUser;
    if (bookmarks.contains(userUuid)) {
      firestore.collection('posts').doc(postId).update({
        'bookmarks': FieldValue.arrayRemove([userUuid])
      });
      isBookmarkedByUser = false;
    } else {
      firestore.collection('posts').doc(postId).update({
        'bookmarks': FieldValue.arrayUnion([userUuid])
      });
      isBookmarkedByUser = true;
    }
    return isBookmarkedByUser;
  }

  @override
  Future<List<PostDTO>> findAllBookmarkByUserUidOrderByDatePublished(
      String userUuid) async {
    final bookmarkPostsByUser = await firestore
        .collection('posts')
        .where('bookmarks', arrayContains: userUuid)
        .orderBy('datePublished', descending: true)
        .get();
    return bookmarkPostsByUser.docs.map((doc) => postMapper(doc)).toList();
  }

  @override
  Future<List<PostDTO>> getReelsWithMostLikes(int limit) async {
    final reelsWithMostLikes = await firestore
        .collection('posts')
        .where("type", isEqualTo: "reel")
        .orderBy('likesCount', descending: true)
        .limit(limit)
        .get();
    return reelsWithMostLikes.docs.map((doc) => postMapper(doc)).toList();
  }

  @override
  Future<List<PostDTO>> findMomentsByUser(String userUid, int maxDays) async {
    final momentUUIDs = await _getRecentMomentUUIDs(userUid, maxDays);
    final List<PostDTO> moments = [];
    for (final momentUUID in momentUUIDs) {
      final momentDocument =
          await firestore.collection('posts').doc(momentUUID).get();
      if (momentDocument.exists) {
        final moment = postMapper(momentDocument);
        moments.add(moment);
      }
    }
    return moments;
  }

  @override
  Future<List<PostDTO>> findMomentsPublishedLast24HoursByUserUuids(
      List<String> userUuids) async {
    final now = DateTime.now();
    final twentyFourHoursAgo = now.subtract(const Duration(hours: 24));
    final QuerySnapshot querySnapshot = await firestore
        .collection('posts')
        .where('authorUid', whereIn: userUuids)
        .where('type', isEqualTo: 'moment')
        .where('datePublished', isGreaterThanOrEqualTo: twentyFourHoursAgo)
        .orderBy('datePublished', descending: true)
        .get();
    // Convert the query results into a list of PostDTO objects
    final List<PostDTO> moments = querySnapshot.docs
        .map((QueryDocumentSnapshot doc) => postMapper(doc))
        .toList();
    return moments;
  }

  Future<List<String>> _getRecentMomentUUIDs(
      String userUid, int maxDays) async {
    final CollectionReference momentsCollection =
        firestore.collection('moments').doc(userUid).collection('days');
    final QuerySnapshot querySnapshot = await momentsCollection
        .orderBy('date', descending: true)
        .limit(maxDays)
        .get();
    final List<String> momentUUIDs = [];
    for (final QueryDocumentSnapshot daySnapshot in querySnapshot.docs) {
      final List<dynamic> uuids = daySnapshot['postUUIDs'];
      momentUUIDs.addAll(uuids.cast<String>());
    }
    return momentUUIDs;
  }
}
