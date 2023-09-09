import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FetchMomentsByUserUseCase
    extends BaseUseCase<Map<DateTime, List<PostBO>>, DefaultParams> {
  static const int MAX_DAYS_LIMIT = 7;

  final AuthRepository authRepository;
  final PostRepository postRepository;

  FetchMomentsByUserUseCase(
      {required this.authRepository, required this.postRepository});

  @override
  Future<Either<Failure, Map<DateTime, List<PostBO>>>> call(
      DefaultParams param) async {
    return authRepository
        .getAuthUserUid()
        .asStream()
        .asyncMap((authUserUuid) async => findMomentsByUserGroupByDate(
            authUserUuid.getOrElse(() => throw Exception("Auth failed"))))
        .last;
  }

  Future<Either<Failure, Map<DateTime, List<PostBO>>>>
      findMomentsByUserGroupByDate(String authUserUuid) async {
    return await postRepository
        .findMomentsByUser(authUserUuid, MAX_DAYS_LIMIT)
        .then((response) => response.map((moments) {
              final Map<DateTime, List<PostBO>> momentsMap = {};
              for (final moment in moments) {
                final momentDate = moment.datePublished.toLocal();
                final dateKey =
                    DateTime(momentDate.year, momentDate.month, momentDate.day);
                if (!momentsMap.containsKey(dateKey)) {
                  momentsMap[dateKey] = [];
                }
                momentsMap[dateKey]!.add(moment);
              }
              return momentsMap;
            }));
  }
}
