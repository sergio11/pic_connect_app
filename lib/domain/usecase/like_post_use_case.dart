import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'base_use_case.dart';

class LikePostUseCase extends BaseUseCase<bool, LikePostParams> {

  final AuthRepository authRepository;
  final PostRepository postRepository;

  LikePostUseCase({
    required this.authRepository,
    required this.postRepository
  });

  @override
  Future<Either<Failure, bool>> call(LikePostParams param) async {
    return authRepository.getAuthUserUid().asStream()
        .asyncMap((authUserUid) async => await postRepository.likePost(postId: param.postId, userUid: authUserUid.getOrElse(() => throw Exception("Auth failed"))))
        .last;
  }
}

class LikePostParams extends Equatable {

  final String postId;

  const LikePostParams(this.postId);

  @override
  List<Object> get props => [postId];
}