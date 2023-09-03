import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/core/widgets/avatar_input_selector.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/text_field_input.dart';
import 'package:pic_connect/features/editprofile/edit_profile_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State<EditProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.isLoading
              ? _buildProgressIndicator()
              : _buildScreenContent(state);
        });
  }

  Widget _buildScreenContent(EditProfileState state) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: accentColor, //change your color here
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.save_outlined,
                color: accentColor,
              ),
              onPressed: () {},
            )
          ],
          backgroundColor: appBarBackgroundColor,
          title: Text("Edit Profile",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: accentColor)),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(35),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildAvatarInputSelector(state),
                      const SizedBox(
                        height: 50,
                      ),
                      _buildUsernameTextInput(state, l10n),
                      _buildEmailTextInput(state, l10n),
                      _buildBioTextInput(state, l10n)
                    ]))));
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildAvatarInputSelector(EditProfileState state) {
    return AvatarInputSelector(
      onPickUpImageFromGallery: () {},
      avatarImageData: state.image,
    );
  }

  Widget _buildEmailTextInput(EditProfileState state, AppLocalizations l10n) {
    return TextFieldInput(
      hintText: l10n.signUpEmailTextInput,
      icon: const Icon(Icons.mail, size: 16),
      textInputType: TextInputType.emailAddress,
      textEditingController: _emailController,
    );
  }

  Widget _buildUsernameTextInput(
      EditProfileState state, AppLocalizations l10n) {
    return TextFieldInput(
        hintText: l10n.signUpUsernameTextInput,
        icon: const Icon(Icons.person, size: 16),
        textInputType: TextInputType.text,
        textEditingController: _usernameController);
  }

  Widget _buildBioTextInput(EditProfileState state, AppLocalizations l10n) {
    return TextFieldInput(
      hintText:  "",
      textInputType: TextInputType.multiline,
      maxLines: 5,
      textEditingController: _bioController,
    );
  }
}
