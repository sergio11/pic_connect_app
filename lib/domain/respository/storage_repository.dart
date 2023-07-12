import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/failure.dart';

abstract class StorageRepository {
  Future<Either<Failure, String>> uploadImageToStorage(
      String childName, Uint8List file, bool isPost);
}
