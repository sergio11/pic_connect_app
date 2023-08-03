import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FindFavoritesPostsByUserUseCase extends BaseUseCase<List<PostBO>, FindFavoritesPostsByUserParams> {

  final PostRepository postRepository;

  FindFavoritesPostsByUserUseCase({ required this.postRepository });

  @override
  Future<Either<Failure, List<PostBO>>> call(FindFavoritesPostsByUserParams param) async {
    return await postRepository.findAllFavoritesByUserUidOrderByDatePublished(param.uid);
  }
}

class FindFavoritesPostsByUserParams extends Equatable {

  final String uid;

  const FindFavoritesPostsByUserParams(this.uid);

  @override
  List<Object> get props => [uid];
}