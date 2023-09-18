import 'dart:async';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/features/add/add_post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/abstract_post_form.dart';
import 'package:pic_connect/features/core/widgets/create_post_form.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddPostScreen extends StatefulWidget {
  final VoidCallback onPostUploaded;
  final VoidCallback onBackPressed;
  final Future<Uint8List?> Function(Uint8List imageData) onEditImageRequired;

  const AddPostScreen(
      {Key? key,
      required this.onPostUploaded,
      required this.onBackPressed,
      required this.onEditImageRequired})
      : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _placeInfoController = TextEditingController();
  final TextfieldTagsController _textFieldTagsController =
      TextfieldTagsController();
  late AppLocalizations _l10n;

  void _onPickImageFromGallery() async {
    final file = await pickImage(ImageSource.gallery);
    if (file != null && context.mounted) {
      context.read<AddPostBloc>().add(OnPhotoSelectedEvent(file.path));
    }
  }

  void _onUploadPost() {
    context.read<AddPostBloc>().add(OnUploadPostEvent(_placeInfoController.text,
        _descriptionController.text, _textFieldTagsController.getTags ?? []));
  }

  void _onEditImage(Uint8List imageData) async {
    final editedImage = await widget.onEditImageRequired(imageData);
    if (context.mounted) {
      if (editedImage != null) {
        context.read<AddPostBloc>().add(OnEditedImageEvent(editedImage));
      }
    }
  }

  void _onPostUploaded() {
    showAlertDialog(
        context: context,
        title: _l10n.postUploadedAlertTitle,
        description: _l10n.postUploadedAlertDescription,
        onAcceptPressed: widget.onPostUploaded);
  }

  void _onBackPressed() {
    showConfirmDialog(
        context: context,
        title: _l10n.cancelUploadPostAlertTitle,
        description: _l10n.cancelUploadPostAlertDescription,
        onAcceptPressed: widget.onBackPressed);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context);
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.clear();
    _placeInfoController.clear();
    _textFieldTagsController.clearTags();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostBloc, AddPostState>(listener: (context, state) {
      if (state.shouldPickContentFromGallery()) {
        _onPickImageFromGallery();
      } else if (state.isImageEditingRequired()) {
        _onEditImage(state.imageData!);
      } else if (state.isPostUploadedSuccessfully) {
        _onPostUploaded();
      } else if (state.errorMessage != null) {
        showErrorSnackBar(context: context, message: state.errorMessage!);
      } else {
        if(state.placeInfo != null && _placeInfoController.text.isEmpty) {
          _placeInfoController.text = state.placeInfo ?? '';
        }
      }
    }, builder: (context, state) {
      return WillPopScope(
        onWillPop: () async {
          _onBackPressed();
          return false;
        },
        child: _buildScreenContent(state),
      );
    });
  }

  Widget _buildScreenContent(AddPostState state) {
    if (state.shouldTakeContentFromCamera()) {
      return _buildTakeContentFromCamera(state);
    } else if (state.shouldFillPostData()) {
      if (state.isPostUploading) {
        return Stack(
          children: [
            _buildFillPostData(state),
            CommonScreenProgressIndicator(
              backgroundColor: blackColor.withOpacity(0.5),
              spinnerColor: primaryColor,
            )
          ],
        );
      } else {
        return _buildFillPostData(state);
      }
    } else {
      return const CommonScreenProgressIndicator();
    }
  }

  Widget _buildTakeContentFromCamera(AddPostState state) {
    return CameraAwesomeBuilder.awesome(
      saveConfig: state.postType == PostTypeEnum.picture
          ? SaveConfig.photo()
          : SaveConfig.video(),
      sensorConfig: SensorConfig.single(
        flashMode: FlashMode.auto,
        aspectRatio: CameraAspectRatios.ratio_16_9,
      ),
      theme: AwesomeTheme(
        bottomActionsBackgroundColor: secondaryColor.withOpacity(0.5),
        buttonTheme: AwesomeButtonTheme(
          backgroundColor: secondaryColor.withOpacity(0.5),
          // Size of the icon
          iconSize: 22,
          // Padding around the icon
          padding: const EdgeInsets.all(18),
          foregroundColor: accentColor,
          buttonBuilder: (child, onTap) {
            return ClipOval(
              child: Material(
                color: Colors.transparent,
                shape: const CircleBorder(),
                child: InkWell(
                  splashColor: secondaryColor,
                  highlightColor: secondaryColor.withOpacity(0.5),
                  onTap: onTap,
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
      onMediaTap: (mediaCapture) {
        final filePath = mediaCapture.captureRequest
            .when(single: (single) => single.file?.path);
        if (filePath != null) {
          if (mediaCapture.isPicture) {
            context.read<AddPostBloc>().add(OnPhotoSelectedEvent(filePath));
          } else {
            context.read<AddPostBloc>().add(OnVideoSelectedEvent(filePath));
          }
        }
      },
    );
  }

  PreferredSizeWidget? _buildAppBar(AddPostState state) {
    return state.shouldFillPostData()
        ? AppBar(
            backgroundColor: appBarBackgroundColor,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: accentColor,
                onPressed: _onBackPressed),
            title: Text(_l10n.addPostMainTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: accentColor)),
            centerTitle: false,
            actions: <Widget>[
              TextButton(
                onPressed: () => _onUploadPost(),
                child: Text(
                  _l10n.uploadPostButtonText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: secondaryColor),
                ),
              )
            ],
          )
        : null;
  }

  Widget _buildFillPostData(AddPostState state) {
    return Scaffold(
        appBar: _buildAppBar(state),
        body: CreatePostForm(
          descriptionController: _descriptionController,
          placeInfoController: _placeInfoController,
          textFieldTagsController: _textFieldTagsController,
          imageData: state.imageData,
          isStoryMoment: state.isStoryMoment,
          videoFilePath: state.videoFilePath,
          onIsStoryMomentSwitchChanged: (bool value) {
            context.read<AddPostBloc>().add(OnPublishAsStoryMomentEvent(value));
          },
        ));
  }
}
