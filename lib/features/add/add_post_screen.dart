import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pic_connect/features/add/add_post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/core/widgets/camera_widget.dart';
import 'package:pic_connect/utils/colors.dart';

class AddPostScreen extends StatefulWidget {

  const AddPostScreen({
    Key? key
  }) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostBloc, AddPostState>(
        listener: (context, state) {

        },
        builder: (context, state) {
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
        backgroundColor: mobileBackgroundColor,
        leading: const Icon(Icons.arrow_back),
        title: const Text('Post to',),
        centerTitle: false,
        actions: <Widget>[
          TextButton(
            onPressed: () => {

            },
            child: const Text(
              "Post",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          )
        ],
      ),
      // POST FORM
      body: state.postFilePath == null ? _buildTakePhotoFromCamera(state)
          : _buildFillPostDescription(state),
    );
  }

  Widget _buildTakePhotoFromCamera(AddPostState state) {
      return CameraWidget(
        onTakePhotoPressed: (String filePath) {
          context.read<AddPostBloc>()
              .add(OnTakePhotoEvent(filePath));
        },
        onRecordVideoPressed: (String filePath) {
        },
      );
  }

  Widget _buildFillPostDescription(AddPostState state) {
    return Column(
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
                decoration: const InputDecoration(
                    hintText: "Write a caption...",
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
    );
  }

}
