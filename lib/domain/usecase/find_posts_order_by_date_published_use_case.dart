import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FindPostsOrderByDatePublishedUseCase extends BaseUseCase<List<PostBO>, DefaultParams> {

  final PostRepository postRepository;

  FindPostsOrderByDatePublishedUseCase({ required this.postRepository });

  @override
  Future<Either<Failure, List<PostBO>>> call(DefaultParams param) async {
    return await postRepository.findAllOrderByDatePublished();
  }
}