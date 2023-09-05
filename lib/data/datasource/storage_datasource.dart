import 'package:flutter/foundation.dart';

abstract class StorageDatasource {
  Future<String> uploadFileToStorage(
      {required String folderName,
      required String id,
      required Uint8List file});
}
