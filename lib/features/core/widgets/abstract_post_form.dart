import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:pic_connect/features/core/widgets/common_switch.dart';
import 'package:pic_connect/features/core/widgets/tags_row.dart';
import 'package:pic_connect/features/core/widgets/text_field_input.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class AbstractPostForm extends StatefulWidget {
  final TextEditingController descriptionController;
  final TextEditingController placeInfoController;
  final TextfieldTagsController textFieldTagsController;
  final bool isStoryMoment;
  final ValueChanged<bool>? onIsStoryMomentSwitchChanged;

  const AbstractPostForm({
    Key? key,
    required this.descriptionController,
    required this.placeInfoController,
    required this.textFieldTagsController,
    this.onIsStoryMomentSwitchChanged,
    this.isStoryMoment = false,
  }) : super(key: key);
}

abstract class AbstractPostFormState<T extends AbstractPostForm>
    extends State<T> {
  late StreamSubscription<bool> _keyboardSubscription;
  VideoPlayerController? _videoController;
  late AppLocalizations _l10n;

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
  void dispose() {
    super.dispose();
    _keyboardSubscription.cancel();
    _videoController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: MediaQuery.of(context).size.height * 0.5,
          floating: false,
          pinned: false,
          flexibleSpace: Stack(
            children: [
              FlexibleSpaceBar(
                background: onBuildPostPreview(),
              ),
              Positioned(
                bottom: -20,
                left: 0,
                right: 0,
                child: Container(
                  height: 65,
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 1),
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: _buildPlaceInfoTextInput(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: _buildPostTagsTextInput(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: _buildPostDescriptionTextInput(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonSwitch(
                        initialValue: widget.isStoryMoment,
                        onChanged: widget.onIsStoryMomentSwitchChanged,
                        description: _l10n.postPublishAsMomentSwitchDescription,
                        label: _l10n.postPublishAsMomentSwitchLabel,
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget onBuildPostPreview();

  Widget _buildPlaceInfoTextInput() {
    return TextFieldInput(
      hintText: _l10n.postAddPlaceInfoInputTextHint,
      textInputType: TextInputType.text,
      icon: const Icon(Icons.location_on),
      textEditingController: widget.placeInfoController,
      maxLines: 1,
    );
  }

  Widget _buildPostDescriptionTextInput() {
    return TextFieldInput(
      hintText: _l10n.postAddDescriptionInputTextHint,
      textInputType: TextInputType.multiline,
      textEditingController: widget.descriptionController,
      maxLines: 5,
    );
  }

  Widget _buildPostTagsTextInput() {
    return TextFieldTags(
        textfieldTagsController: widget.textFieldTagsController,
        textSeparators: const [' ', ','],
        letterCase: LetterCase.normal,
        validator: (String tag) {
          if (widget.textFieldTagsController.getTags?.contains(tag) == true) {
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
                hintText: widget.textFieldTagsController.hasTags
                    ? ''
                    : _l10n.postAddTopicsInputTextHint,
                helperText: _l10n.postAddTopicsInputTextHelper,
                focusNode: fn,
                errorText: error,
                prefixIconConstraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.74),
                icon: tags.isNotEmpty
                    ? TagsRow(tags: tags, onTagDeleted: onTagDelete)
                    : null);
          });
        });
  }

  Widget buildVideoPreview(String videoPath) {
    if (_videoController == null) {
      _videoController = VideoPlayerController.file(File(videoPath));
      _videoController?.initialize();
      _videoController?.play();
      _videoController?.setVolume(1);
      _videoController?.setLooping(true);
    }
    return VideoPlayer(_videoController!);
  }
}
