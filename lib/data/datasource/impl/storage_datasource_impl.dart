import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:pic_connect/data/datasource/storage_datasource.dart';

class StorageDatasourceImpl extends StorageDatasource {
  final FirebaseStorage storage;

  StorageDatasourceImpl({required this.storage});

  @override
  Future<String> uploadFileToStorage(
      {required String folderName,
      required String id,
      required Uint8List file}) async {
    Reference ref = storage.ref().child(folderName).child(id);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }
}
