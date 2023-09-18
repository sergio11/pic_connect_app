import 'package:flutter/material.dart';
import 'package:pic_connect/features/core/helpers.dart';
import 'package:pic_connect/features/core/widgets/abstract_post_form.dart';
import 'package:textfield_tags/textfield_tags.dart';

class EditPostForm extends AbstractPostForm {
  final String postUrl;
  final bool isReel;

  const EditPostForm(
      {Key? key,
      required TextEditingController descriptionController,
      required TextEditingController placeInfoController,
      required TextfieldTagsController textFieldTagsController,
      required bool isStoryMoment,
      required this.postUrl,
      required this.isReel})
      : super(
            key: key,
            descriptionController: descriptionController,
            placeInfoController: placeInfoController,
            textFieldTagsController: textFieldTagsController,
            isStoryMoment: isStoryMoment);

  @override
  EditPostFormState createState() => EditPostFormState();
}

class EditPostFormState extends AbstractPostFormState<EditPostForm> {
  @override
  Widget onBuildPostPreview() {
    return widget.isReel
        ? buildVideoPreview(widget.postUrl)
        : _buildImagePreview(widget.postUrl);
  }

  Widget _buildImagePreview(String imageUrl) {
    return buildNetworkImage(imageUrl);
  }
}
