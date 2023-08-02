import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/features/add/add_post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/core/widgets/camera_widget.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';

class AddPostScreen extends StatefulWidget {

  final VoidCallback onPostUploaded;
  final VoidCallback onBackPressed;
  final Future<Uint8List?> Function(Uint8List imageData) onEditImageRequired;

  const AddPostScreen({
    Key? key,
    required this.onPostUploaded,
    required this.onBackPressed,
    required this.onEditImageRequired
  }) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _descriptionController = TextEditingController();

  void _onPickImageFromGallery() async {
    final file = await pickImage(ImageSource.gallery);
    if (file != null && context.mounted) {
      context.read<AddPostBloc>().add(OnFileSelectedEvent(file.path));
    }
  }

  void _onUploadPost() {
    context.read<AddPostBloc>().add(OnUploadPostEvent(_descriptionController.text));
  }

  void _onEditImage(Uint8List imageData) async {
    final editedImage = await widget.onEditImageRequired(imageData);
    if(context.mounted) {
      if(editedImage != null) {
        context.read<AddPostBloc>().add(OnEditedImageEvent(editedImage));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostBloc, AddPostState>(listener: (context, state) {
      if (state.imageSource == ImageSource.gallery &&
          state.postFileData == null) {
        _onPickImageFromGallery();
      } else if(state.postFileData != null && state.imageEditingRequired) {
        _onEditImage(state.postFileData!);
      }else if(state.isPostUploadedSuccessfully) {
        widget.onPostUploaded();
      }
    }, builder: (context, state) {
      return _buildScreenContent(state);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  Widget _buildScreenContent(AddPostState state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        leading: IconButton(icon: const Icon(Icons.arrow_back), color: accentColor, onPressed: () => widget.onBackPressed()),
        title: Text(
          'Post to',
           style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: accentColor)
        ),
        centerTitle: false,
        actions: <Widget>[
          TextButton(
            onPressed: () => _onUploadPost(),
            child: Text(
              "Post",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: secondaryColor),
            ),
          )
        ],
      ),
      // POST FORM
      body: state.postFileData == null
          ?  state.imageSource == ImageSource.camera ? _buildTakePhotoFromCamera(state) : _buildProgressIndicator()
          : _buildFillPostDescription(state),
    );
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildTakePhotoFromCamera(AddPostState state) {
    return CameraWidget(
      onTakePhotoPressed: (String filePath) {
        context.read<AddPostBloc>().add(OnFileSelectedEvent(filePath));
      },
      onRecordVideoPressed: (String filePath) {},
    );
  }

  Widget _buildFillPostDescription(AddPostState state) {
    return Container(
      color: primaryColor,
      child: Column(
        children: <Widget>[
          state.isPostUploading
              ? const LinearProgressIndicator()
              : const Padding(padding: EdgeInsets.only(top: 0.0)),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(state.authorPhotoUrl != null ? state.authorPhotoUrl! : 'https://i.stack.imgur.com/l60Hf.png'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                      hintText: "Write a caption...",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: accentColor),
                      border: InputBorder.none),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45.0,
                width: 45.0,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          alignment: FractionalOffset.topCenter,
                          image: MemoryImage(state.postFileData!),
                        )),
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
