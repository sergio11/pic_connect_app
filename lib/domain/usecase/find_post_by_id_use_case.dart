import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FindPostByIdUseCase extends BaseUseCase<PostBO, FindPostByIdParams> {
  final PostRepository postRepository;

  FindPostByIdUseCase({required this.postRepository});

  @override
  Future<Either<Failure, PostBO>> call(FindPostByIdParams param) async {
    return await postRepository.findPostById(param.postUuid);
  }
}

class FindPostByIdParams extends Equatable {
  final String postUuid;

  const FindPostByIdParams(this.postUuid);

  @override
  List<Object> get props => [postUuid];
}
