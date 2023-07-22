import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/comment.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class PublishCommentUseCase extends BaseUseCase<CommentBO, PublishCommentParams> {

  final AuthRepository authRepository;
  final PostRepository postRepository;

  PublishCommentUseCase({
    required this.authRepository,
    required this.postRepository
  });

  @override
  Future<Either<Failure, CommentBO>> call(PublishCommentParams param) async {
    return await authRepository.getAuthUserUid().asStream()
        .asyncMap((authUserUid) async => await postRepository.postComment(postId: param.postId, text: param.text, authorUid: authUserUid.getOrElse(() => throw Exception("Auth failed"))))
        .last;
  }
}


class PublishCommentParams extends Equatable {

  final String postId;
  final String text;

  const PublishCommentParams(this.postId, this.text);

  @override
  List<Object> get props => [postId, text];
}