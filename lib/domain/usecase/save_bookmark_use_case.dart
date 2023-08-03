import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class SaveBookmarkUseCase extends BaseUseCase<bool, SaveBookmarkParams> {
  final AuthRepository authRepository;
  final PostRepository postRepository;

  SaveBookmarkUseCase({
    required this.authRepository,
    required this.postRepository
  });

  @override
  Future<Either<Failure, bool>> call(SaveBookmarkParams param) async {
    return authRepository.getAuthUserUid().asStream()
        .asyncMap((event) async => await postRepository.saveBookmark(postId: param.postId, userUid: event.getOrElse(() => throw Exception("Auth failed"))))
        .last;
  }

}

class SaveBookmarkParams extends Equatable {

  final String postId;

  const SaveBookmarkParams(this.postId);

  @override
  List<Object> get props => [postId];
}