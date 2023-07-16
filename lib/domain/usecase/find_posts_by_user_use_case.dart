
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FindPostsByUserUseCase extends BaseUseCase<List<PostBO>, FindPostsByUserParams> {
  final PostRepository postRepository;

  FindPostsByUserUseCase({
    required this.postRepository
  });

  @override
  Future<Either<Failure, List<PostBO>>> call(FindPostsByUserParams param) async {
    return await postRepository.findAllByUserUid(param.uid);
  }
}


class FindPostsByUserParams extends Equatable {

  final String uid;

  const FindPostsByUserParams(this.uid);

  @override
  List<Object> get props => [uid];
}