import 'package:pic_connect/domain/models/moment_story_data.dart';
import 'package:pic_connect/domain/models/post.dart';

class MomentsByMonthAndYearBO implements MomentStoryDataBO {
  final String monthAndYear;
  final List<PostBO> moments;

  MomentsByMonthAndYearBO({required this.monthAndYear, required this.moments});

  @override
  int countMoments() => moments.length;

  @override
  List<PostBO> getMoments() => moments;

  @override
  String getTrayImageUrl() => moments.first.postUrl;

  @override
  String getTrayTitle() => monthAndYear;
}
