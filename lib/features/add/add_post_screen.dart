import 'dart:async';
import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/features/add/add_post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/tags_row.dart';
import 'package:pic_connect/features/core/widgets/text_field_input.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  late StreamSubscription<bool> _keyboardSubscription;
  VideoPlayerController? _videoController;
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
  void initState() {
    var keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        if (_videoController?.value.isPlaying == true) {
          _videoController?.pause();
        }
      } else {
        if (_videoController != null &&
            _videoController?.value.isPlaying == false) {
          _videoController?.play();
        }
      }
    });
    super.initState();
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
      } else if (state.isPostUploading) {
        _videoController?.pause();
      }
    }, builder: (context, state) {
      return _buildScreenContent(state);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _keyboardSubscription.cancel();
    _descriptionController.dispose();
    _textFieldTagsController.dispose();
    _placeInfoController.dispose();
    _videoController?.dispose();
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
      saveConfig: state.postType == PostTypeEnum.picture ? SaveConfig.photo() : SaveConfig.video(),
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
            title: Text('Post to',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                child: state.imageData != null
                    ? _buildImagePreview(state.imageData!)
                    : _buildVideoPreview(state.videoFilePath!)),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: _buildPlaceInfoTextInput(state),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: _buildPostTagsTextInput(state),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: _buildPostDescriptionTextInput(state),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceInfoTextInput(AddPostState state) {
    if (_placeInfoController.text.isEmpty) {
      _placeInfoController.text = state.placeInfo ?? "";
    }
    return TextFieldInput(
      hintText: _l10n.postAddPlaceInfoInputTextHint,
      textInputType: TextInputType.text,
      icon: const Icon(Icons.location_on),
      textEditingController: _placeInfoController,
      maxLines: 1,
    );
  }

  Widget _buildPostDescriptionTextInput(AddPostState state) {
    return TextFieldInput(
      hintText: _l10n.postAddDescriptionInputTextHint,
      textInputType: TextInputType.multiline,
      textEditingController: _descriptionController,
      maxLines: 5,
    );
  }

  Widget _buildPostTagsTextInput(AddPostState state) {
    return TextFieldTags(
        textfieldTagsController: _textFieldTagsController,
        textSeparators: const [' ', ','],
        letterCase: LetterCase.normal,
        validator: (String tag) {
          if (_textFieldTagsController.getTags?.contains(tag) == true) {
            return _l10n.postTagAlreadyAdded;
          }
          return null;
        },
        inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
          return ((context, sc, tags, onTagDelete) {
            return TextFieldInput(
                textEditingController: tec,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
                hintText:
                    _textFieldTagsController.hasTags ? '' : _l10n.postAddTopicsInputTextHint,
                helperText: _l10n.postAddTopicsInputTextHelper,
                focusNode: fn,
                errorText: error,
                prefixIconConstraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.74),
                icon: tags.isNotEmpty
                    ? TagsRow(
                        tags: tags,
                        scrollController: sc,
                        onTagDeleted: onTagDelete)
                    : null);
          });
        });
  }

  Widget _buildVideoPreview(String videoPath) {
    if (_videoController == null) {
      _videoController = VideoPlayerController.file(File(videoPath));
      _videoController?.initialize();
      _videoController?.play();
      _videoController?.setVolume(1);
      _videoController?.setLooping(true);
    }
    return VideoPlayer(_videoController!);
  }

  Widget _buildImagePreview(Uint8List imageData) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
            image: MemoryImage(imageData)),
      ),
    );
  }
}
