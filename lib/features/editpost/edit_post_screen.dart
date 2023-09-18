import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/edit_post_form.dart';
import 'package:pic_connect/features/editpost/edit_post_bloc.dart';
import 'package:pic_connect/provider/event_controller.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:textfield_tags/textfield_tags.dart';

class EditPostScreen extends StatefulWidget {
  const EditPostScreen({Key? key}) : super(key: key);

  @override
  State<EditPostScreen> createState() => EditPostScreenState();
}

class EditPostScreenState extends State<EditPostScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _placeInfoController = TextEditingController();
  final TextfieldTagsController _textFieldTagsController =
      TextfieldTagsController();
  late AppLocalizations _l10n;
  late EventController _eventController;

  void _onUpdatePostClicked() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context);
    _eventController = context.read<EventController>();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _eventController.launchEvent(HideBottomBarEvent());
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _eventController.launchEvent(ShowBottomBarEvent());
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditPostBloc, EditPostState>(
        listener: (context, state) {
      if (context.mounted) {
        if (state.errorMessage != null) {
          showErrorSnackBar(context: context, message: state.errorMessage!);
        }
      }
    }, builder: (context, state) {
      return _buildScreenContent(state);
    });
  }

  PreferredSizeWidget? _buildAppBar(EditPostState state) {
    return AppBar(
      backgroundColor: appBarBackgroundColor,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: accentColor,
          onPressed: () {}),
      title: Text(_l10n.editPostMainTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: accentColor)),
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.save_outlined,
            color: accentColor,
          ),
          onPressed: () => _onUpdatePostClicked(),
        )
      ],
    );
  }

  Widget _buildScreenContent(EditPostState state) {
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
  }

  Widget _buildFillPostData(EditPostState state) {
    return Scaffold(
        appBar: _buildAppBar(state),
        body: EditPostForm(
          descriptionController: _descriptionController,
          placeInfoController: _placeInfoController,
          textFieldTagsController: _textFieldTagsController,
          postUrl: state.postUrl,
          isStoryMoment: state.isStoryMoment,
          isReel: state.isReel,
        ));
  }
}
