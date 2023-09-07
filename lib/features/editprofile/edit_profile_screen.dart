import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/features/core/widgets/avatar_input_selector.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/country_picker_text_field_input.dart';
import 'package:pic_connect/features/core/widgets/date_picker_text_field_input.dart';
import 'package:pic_connect/features/core/widgets/text_field_input.dart';
import 'package:pic_connect/features/editprofile/edit_profile_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pic_connect/utils/textfield_validation.dart';
import 'package:pic_connect/utils/utils.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  late AppLocalizations _l10n;

  void _onUpdateProfileClicked() {
    if (_formKey.currentState?.validate() == true) {
      hideKeyboard(context);
      context.read<EditProfileBloc>().add(OnUpdateProfileEvent(
          email: _emailController.text,
          username: _usernameController.text,
          bio: _bioController.text,
          birthDate: _birthDateController.text,
          country: _countryController.text));
    } else {
      showErrorSnackBar(
          context: context,
          message: _l10n.editProfileInformationProvidedNotValid);
    }
  }

  void _onPickUpImageFromGallery() async {
    context
        .read<EditProfileBloc>()
        .add(const OnUpdateProfileImageEvent(ImageSource.gallery));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    _birthDateController.dispose();
    _countryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
      if (context.mounted) {
        if (!state.isLoading) {
          _usernameController.text = state.username;
          _emailController.text = state.email;
          _bioController.text = state.bio;
          _birthDateController.text = state.birthDate;
          _countryController.text = state.country;
        }
        if (state.errorMessage != null) {
          showErrorSnackBar(context: context, message: state.errorMessage!);
        }
      }
    }, builder: (context, state) {
      return state.isLoading
          ? _buildProgressIndicator()
          : _buildScreenContent(state);
    });
  }

  Widget _buildScreenContent(EditProfileState state) {
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
              onPressed: () => _onUpdateProfileClicked(),
            )
          ],
          backgroundColor: appBarBackgroundColor,
          title: Text(_l10n.editProfileMainTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: accentColor)),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(35),
                child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildAvatarInputSelector(state),
                          const SizedBox(
                            height: 50,
                          ),
                          _buildUsernameTextInput(state),
                          _buildEmailTextInput(state),
                          _buildDatePickerTextField(state),
                          _buildCountryPickerTextField(state),
                          _buildBioTextInput(state)
                        ])))));
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildAvatarInputSelector(EditProfileState state) {
    return AvatarInputSelector(
      onPickUpImageFromGallery: () => _onPickUpImageFromGallery(),
      avatarImageData: state.image,
      currentImageUrl: state.photoUrl,
    );
  }

  Widget _buildEmailTextInput(EditProfileState state) {
    return TextFieldInput(
      hintText: _l10n.editProfileEmailTextInput,
      icon: const Icon(Icons.mail, size: 16),
      textInputType: TextInputType.emailAddress,
      textEditingController: _emailController,
    );
  }

  Widget _buildDatePickerTextField(EditProfileState state) {
    return DatePickerTextFieldInput(
      hintText: _l10n.editProfileDatePickerText,
      textEditingController: _birthDateController,
    );
  }

  Widget _buildCountryPickerTextField(EditProfileState state) {
    return CountryPickerTextField(
      hintText: _l10n.editProfileCountryPickerText,
      textEditingController: _countryController,
    );
  }

  Widget _buildUsernameTextInput(EditProfileState state) {
    return TextFieldInput(
        hintText: _l10n.editProfileUsernameTextInput,
        icon: const Icon(Icons.person, size: 16),
        textInputType: TextInputType.text,
        onValidate: (value) =>
            value != null && value.isNotEmpty && value.isValidName(),
        errorText: _l10n.editProfileUsernameNoValid,
        textEditingController: _usernameController);
  }

  Widget _buildBioTextInput(EditProfileState state) {
    return TextFieldInput(
      hintText: _l10n.editProfileBioTextInput,
      textInputType: TextInputType.multiline,
      maxLines: 5,
      textEditingController: _bioController,
    );
  }
}
