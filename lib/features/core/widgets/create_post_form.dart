import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/features/core/widgets/abstract_post_form.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CreatePostForm extends AbstractPostForm {
  final Uint8List? imageData;
  final String? videoFilePath;

  const CreatePostForm({
    Key? key,
    required TextEditingController descriptionController,
    required TextEditingController placeInfoController,
    required TextfieldTagsController textFieldTagsController,
    required bool isStoryMoment,
    required ValueChanged<bool> onIsStoryMomentSwitchChanged,
    this.imageData,
    this.videoFilePath,
  }) : super(
            key: key,
            descriptionController: descriptionController,
            placeInfoController: placeInfoController,
            textFieldTagsController: textFieldTagsController,
            isStoryMoment: isStoryMoment,
            onIsStoryMomentSwitchChanged: onIsStoryMomentSwitchChanged);

  @override
  CreatePostFormState createState() => CreatePostFormState();
}

class CreatePostFormState extends AbstractPostFormState<CreatePostForm> {
  @override
  Widget onBuildPostPreview() {
    return widget.imageData != null
        ? _buildImagePreview(widget.imageData!)
        : widget.videoFilePath != null
            ? buildVideoPreview(widget.videoFilePath!)
            : Container();
  }

  Widget _buildImagePreview(Uint8List imageData) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            alignment: Alignment.center,
            image: MemoryImage(imageData)),
      ),
    );
  }
}
