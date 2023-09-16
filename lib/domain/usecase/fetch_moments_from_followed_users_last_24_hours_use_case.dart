import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/moments_by_user.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/repository/post_repository.dart';
import 'package:pic_connect/domain/repository/user_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FetchMomentsFromFollowedUsersLast24HoursUseCase
    extends BaseUseCase<List<MomentsByUserBO>, DefaultParams> {
  final AuthRepository authRepository;
  final PostRepository postRepository;
  final UserRepository userRepository;

  FetchMomentsFromFollowedUsersLast24HoursUseCase(
      {required this.authRepository,
      required this.postRepository,
      required this.userRepository});

  @override
  Future<Either<Failure, List<MomentsByUserBO>>> call(
      DefaultParams param) async {
    return authRepository
        .getAuthUserUid()
        .asStream()
        .asyncMap((authUserUid) async => await userRepository.findAllFollowedBy(
            authUserUid.getOrElse(() => throw Exception("Auth failed"))))
        .asyncMap((users) async => findMomentsGroupByUser(users.getOrElse(() =>
            throw Exception("An error occurred when trying to fetch users"))))
        .last;
  }

  Future<Either<Failure, List<MomentsByUserBO>>> findMomentsGroupByUser(
      List<UserBO> users) async {
    return users.isNotEmpty
        ? await postRepository
            .findMomentsPublishedLast24HoursByUserUuids(
                users.map((e) => e.uid).toList())
            .then((response) => response.map((moments) {
                  debugPrint("moments -> ${moments.length}");
                  final Map<UserBO, List<PostBO>> momentsMap = {};
                  for (var moment in moments) {
                    debugPrint(
                        "moment -> ${moment.username} / ${moment.postId}");
                    final momentAuthorUid = moment.postAuthorUid;
                    final UserBO user = users.firstWhere(
                        (user) => user.uid == momentAuthorUid,
                        orElse: () => UserBO.unknownUser);
                    if (user != UserBO.unknownUser) {
                      if (!momentsMap.containsKey(user)) {
                        momentsMap[user] = [];
                      }
                      momentsMap[user]!.add(moment);
                    }
                  }
                  return momentsMap.entries
                      .map((entry) => MomentsByUserBO(
                          user: entry.key, moments: entry.value))
                      .toList();
                }))
        : const Right([]);
  }
}
