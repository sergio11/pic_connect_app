import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/repository/user_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FetchUserHomeFeedUseCase
    extends BaseUseCase<List<PostBO>, DefaultParams> {
  final AuthRepository authRepository;
  final PostRepository postRepository;
  final UserRepository userRepository;

  FetchUserHomeFeedUseCase(
      {required this.authRepository,
      required this.postRepository,
      required this.userRepository});

  @override
  Future<Either<Failure, List<PostBO>>> call(DefaultParams param) async {
    return authRepository
        .getAuthUserUid()
        .asStream()
        .asyncMap((authUserUid) async {
          final userUuid =
              authUserUid.getOrElse(() => throw Exception("Auth failed"));
          final usersResponse =
              await userRepository.findAllFollowedBy(userUuid);
          final users = usersResponse.getOrElse(() =>
              throw Exception("An error occurred when trying to fetch users"));
          return users.map((e) => e.uid).toList()..add(userUuid);
        })
        .asyncMap((users) async => findPostsByUsers(users))
        .last;
  }

  Future<Either<Failure, List<PostBO>>> findPostsByUsers(
      List<String> users) async {
    return users.isNotEmpty
        ? await postRepository.findAllByUserUidListOrderByDatePublished(users)
        : await postRepository.findAllOrderByDatePublished();
  }
}
