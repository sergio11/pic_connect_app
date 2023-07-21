

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';

import 'base_use_case.dart';

class DeletePostUseCase extends BaseUseCase<bool, DeletePostParams> {

  final PostRepository postRepository;

  DeletePostUseCase({
    required this.postRepository
  });

  @override
  Future<Either<Failure, bool>> call(DeletePostParams param) async {
    return await postRepository.deletePost(param.postId);
  }
}

class DeletePostParams extends Equatable {

  final String postId;

  const DeletePostParams(this.postId);

  @override
  List<Object> get props => [postId];
}