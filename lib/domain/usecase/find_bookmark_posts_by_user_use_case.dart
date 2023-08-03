import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FindBookmarkPostsByUserUseCase extends BaseUseCase<List<PostBO>, FindBookmarkPostsByUserParams> {

  final PostRepository postRepository;

  FindBookmarkPostsByUserUseCase({ required this.postRepository });

  @override
  Future<Either<Failure, List<PostBO>>> call(FindBookmarkPostsByUserParams param) async {
    return await postRepository.findAllBookmarkByUserUidOrderByDatePublished(param.uid);
  }
}

class FindBookmarkPostsByUserParams extends Equatable {

  final String uid;

  const FindBookmarkPostsByUserParams(this.uid);

  @override
  List<Object> get props => [uid];
}