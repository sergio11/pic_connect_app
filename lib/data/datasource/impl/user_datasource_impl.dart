import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pic_connect/data/datasource/dto/save_user_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/data/datasource/user_datasource.dart';
import 'package:pic_connect/utils/mapper.dart';

class UserDatasourceImpl extends UserDatasource {

  final FirebaseFirestore firestore;
  final Mapper<DocumentSnapshot, UserDTO> userDtoMapper;
  final Mapper<SaveUserDTO, Map<String, dynamic>> saveUserDtoMapper;

  UserDatasourceImpl({
    required this.firestore,
    required this.userDtoMapper,
    required this.saveUserDtoMapper
  });

  @override
  Future<UserDTO> findByUid(String uid) async {
    final docSnap = await firestore
        .collection('users')
        .doc(uid)
        .get();
    return userDtoMapper(docSnap);
  }

  @override
  Future<void> followUser(String uid, String followId) async {
    DocumentSnapshot snap =
        await firestore.collection('users').doc(uid).get();
    List following = (snap.data()! as dynamic)['following'];

    if (following.contains(followId)) {
      await firestore.collection('users').doc(followId).update({
        'followers': FieldValue.arrayRemove([uid])
      });

      await firestore.collection('users').doc(uid).update({
        'following': FieldValue.arrayRemove([followId])
      });
    } else {
      await firestore.collection('users').doc(followId).update({
        'followers': FieldValue.arrayUnion([uid])
      });

      await firestore.collection('users').doc(uid).update({
        'following': FieldValue.arrayUnion([followId])
      });
    }
  }

  @override
  Future<void> save(SaveUserDTO user) async {
    await firestore
        .collection("users")
        .doc(user.uid)
        .set(saveUserDtoMapper(user));
  }
}