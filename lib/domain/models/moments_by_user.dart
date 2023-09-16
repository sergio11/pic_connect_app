import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/domain/models/user.dart';

import 'moment_story_data.dart';

class MomentsByUserBO implements MomentStoryDataBO {
  final UserBO user;
  final List<PostBO> moments;

  MomentsByUserBO({required this.user, required this.moments});

  @override
  int countMoments() => moments.length;

  @override
  List<PostBO> getMoments() => moments;

  @override
  String getTrayImageUrl() => user.photoUrl;

  @override
  String getTrayTitle() => user.username;
}
