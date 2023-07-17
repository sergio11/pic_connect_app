import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/features/add/add_post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/core/widgets/camera_widget.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';

class AddPostScreen extends StatefulWidget {

  final VoidCallback onBackPressed;

  const AddPostScreen({
    Key? key,
    required this.onBackPressed
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostBloc, AddPostState>(listener: (context, state) {
      if (state.imageSource == ImageSource.gallery &&
          state.postFilePath == null) {
        _onPickImageFromGallery();
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
            onPressed: () => {},
            child: Text(
              "Post",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: secondaryColor),
            ),
          )
        ],
      ),
      // POST FORM
      body: state.postFilePath == null
          ?  state.imageSource == ImageSource.camera ? _buildTakePhotoFromCamera(state) : _buildProgressIndicator()
          : _buildFillPostDescription(state),
    );
  }

  Widget _buildProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
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
                backgroundImage: NetworkImage(""),
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
                          image: FileImage(File(state.postFilePath!)),
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
