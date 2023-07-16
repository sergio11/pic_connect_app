import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/comment.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FindAllCommentsByPostUseCase extends BaseUseCase<List<CommentBO>, FindAllCommentsByPostParams> {

  final PostRepository postRepository;

  FindAllCommentsByPostUseCase({ required this.postRepository });

  @override
  Future<Either<Failure, List<CommentBO>>> call(FindAllCommentsByPostParams param) async {
    return await postRepository.findAllCommentsByPostId(param.postId);
  }

}

class FindAllCommentsByPostParams extends Equatable {

  final String postId;

  const FindAllCommentsByPostParams(this.postId);

  @override
  List<Object> get props => [postId];
}