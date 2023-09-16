
import 'package:pic_connect/domain/models/post.dart';

abstract class MomentStoryDataBO {
  String getTrayImageUrl();
  String getTrayTitle();
  List<PostBO> getMoments();
  int countMoments();
}