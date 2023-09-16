import 'package:pic_connect/domain/models/moment_story_data.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/utils/format_month_year.dart';

class MomentsByDateBO implements MomentStoryDataBO {
  final DateTime dateTime;
  final List<PostBO> moments;

  MomentsByDateBO({required this.dateTime, required this.moments});

  @override
  int countMoments() => moments.length;

  @override
  List<PostBO> getMoments() => moments;

  @override
  String getTrayImageUrl() => moments.first.postUrl;

  @override
  String getTrayTitle() => dateTime.formatMonthYear();
}
