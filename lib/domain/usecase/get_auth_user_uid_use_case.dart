import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/respository/auth_repository.dart';
import 'base_use_case.dart';

class GetAuthUserUidUseCase extends BaseUseCase<String, DefaultParams>{

  final AuthRepository authRepository;

  GetAuthUserUidUseCase({required this.authRepository});

  @override
  Future<Either<Failure, String>> call(DefaultParams param) async {
    return await authRepository.getAuthUserUid();
  }

}