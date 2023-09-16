import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/moments_by_date.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FetchMomentsByUserUseCase
    extends BaseUseCase<List<MomentsByDateBO>, FetchMomentsByUserParams> {
  static const int MAX_DAYS_LIMIT = 7;

  final PostRepository postRepository;

  FetchMomentsByUserUseCase(
      {required this.postRepository});

  @override
  Future<Either<Failure, List<MomentsByDateBO>>> call(
      FetchMomentsByUserParams param) async {
    return await findMomentsByUserGroupByDate(param.userUuid);
  }

  Future<Either<Failure, List<MomentsByDateBO>>> findMomentsByUserGroupByDate(
      String authUserUuid) async {
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
              return momentsMap.entries
                  .map((entry) => MomentsByDateBO(
                      dateTime: entry.key, moments: entry.value))
                  .toList();
            }));
  }
}

class FetchMomentsByUserParams extends Equatable {

  final String userUuid;


  const FetchMomentsByUserParams(this.userUuid);

  @override
  List<Object> get props => [userUuid];
}
