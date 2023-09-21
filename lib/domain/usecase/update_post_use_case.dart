import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'base_use_case.dart';

class UpdatePostUseCase extends BaseUseCase<bool, UpdatePostUseParams> {
  final AuthRepository authRepository;
  final PostRepository postRepository;

  UpdatePostUseCase(
      {required this.authRepository, required this.postRepository});

  @override
  Future<Either<Failure, bool>> call(UpdatePostUseParams param) async {
    return await postRepository.updatePost(
        postUuid: param.postUuid,
        description: param.description,
        tags: param.tags,
        placeInfo: param.placeInfo);
  }
}

class UpdatePostUseParams extends Equatable {
  final String postUuid;
  final String description;
  final List<String> tags;
  final String? placeInfo;

  const UpdatePostUseParams(
      {required this.postUuid,
      required this.description,
      required this.tags,
      required this.placeInfo});

  @override
  List<Object> get props => [postUuid, description, tags];
}
