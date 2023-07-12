import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/respository/auth_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class GetUserDetailsUseCase extends BaseUseCase<UserBO, DefaultParams> {
  final AuthRepository authRepository;

  GetUserDetailsUseCase({ required this.authRepository });

  @override
  Future<Either<Failure, UserBO>> call(DefaultParams param) async {
    return await authRepository.getUserDetails();
  }
}
