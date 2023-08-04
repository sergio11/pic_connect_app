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

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: accentColor, //change your color here
          ),
          backgroundColor: appBarBackgroundColor,
          title: Text("Edit Profile",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: accentColor)),
          centerTitle: false,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildAvatarInputSelector(state),
                  _buildUsernameTextInput(state, l10n),
                  _buildEmailTextInput(state, l10n)
                ])));
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

  Widget _buildUsernameTextInput(
      EditProfileState state, AppLocalizations l10n) {
    return TextFieldInput(
        hintText: l10n.signUpUsernameTextInput,
        icon: const Icon(Icons.person, size: 16),
        textInputType: TextInputType.text,
        textEditingController: _usernameController);
  }

  Widget _buildEmailTextInput(EditProfileState state, AppLocalizations l10n) {
    return TextFieldInput(
      hintText: l10n.signUpEmailTextInput,
      icon: const Icon(Icons.mail, size: 16),
      textInputType: TextInputType.emailAddress,
      textEditingController: _emailController,
    );
  }
}
