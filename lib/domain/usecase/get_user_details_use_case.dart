import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/respository/auth_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class GetUserDetailsUseCase extends BaseUseCase<UserBO, GetUserDetailsParams> {
  final AuthRepository authRepository;

  GetUserDetailsUseCase({ required this.authRepository });

  @override
  Future<Either<Failure, UserBO>> call(GetUserDetailsParams param) async {
    return await authRepository.getUserDetails(userUid: param.uid);
  }
}

class GetUserDetailsParams extends Equatable {

  final String uid;

  const GetUserDetailsParams(this.uid);

  @override
  List<Object> get props => [uid];
}
