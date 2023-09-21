import 'package:pic_connect/data/datasource/dto/update_post_dto.dart';
import 'package:pic_connect/utils/mapper.dart';

class UpdatePostDtoMapper extends Mapper<UpdatePostDTO, Map<String, dynamic>> {
  @override
  Map<String, dynamic> call(UpdatePostDTO object) {
    return {
      'description': object.description,
      'tags': object.tags,
      'placeInfo': object.placeInfo,
    };
  }
}
