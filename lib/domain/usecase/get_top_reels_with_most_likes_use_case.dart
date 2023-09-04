import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class GetTopReelsWithMostLikesUseCase
    extends BaseUseCase<List<PostBO>, GetTopReelsWithMostLikesParams> {
  final PostRepository postRepository;

  GetTopReelsWithMostLikesUseCase({
    required this.postRepository,
  });

  @override
  Future<Either<Failure, List<PostBO>>> call(
      GetTopReelsWithMostLikesParams param) async {
    return await postRepository.getReelsWithMostLikes(param.limit);
  }
}

class GetTopReelsWithMostLikesParams extends Equatable {
  final int limit;

  const GetTopReelsWithMostLikesParams(this.limit);

  @override
  List<Object> get props => [limit];
}
