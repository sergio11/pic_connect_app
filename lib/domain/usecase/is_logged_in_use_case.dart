import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/respository/auth_repository.dart';
import 'base_use_case.dart';

class IsLoggedInUseCase extends BaseUseCase<bool, DefaultParams>{

  final AuthRepository authRepository;

  IsLoggedInUseCase({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(DefaultParams param) async {
    return await authRepository.isLoggedIn();
  }

}