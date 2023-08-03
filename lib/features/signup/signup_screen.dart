import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/core/widgets/animate_gradient_widget.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/features/core/widgets/loading_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/text_field_input.dart';
import 'package:pic_connect/features/signup/signup_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback onSignInPressed;

  const SignupScreen({Key? key, required this.onSignInPressed})
      : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
  }

  void onSignUpUser() async {
    context.read<SignUpBloc>().add(OnDoSignUpEvent(
        _emailController.text,
        _passwordController.text,
        _usernameController.text,
        _bioController.text));
  }

  void onSignUpSuccess() async {
    context.read<AppBloc>().add(const OnVerifySession());
  }

  void onPickUpImageFromGallery(BuildContext context) async {
    context
        .read<SignUpBloc>()
        .add(const OnPickUpImageEvent(ImageSource.gallery));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
      if (context.mounted) {
        if (state.isSignUpSuccess) {
          onSignUpSuccess();
        } else if (state.errorMessage != null) {
          showErrorSnackBar(context: context, message: state.errorMessage!);
        }
        if (state.isLoading) {
          LoadingProgressIndicator.start(context);
        } else {
          LoadingProgressIndicator.stop();
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [_buildScreenBackground(), _buildScreenContent(state, l10n)],
        ),
      );
    });
  }

  Widget _buildScreenBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/sign_up_background_picture.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildScreenContent(SignUpState state, AppLocalizations l10n) {
    return AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: [
          secondaryColorMediumLight.withOpacity(0.8),
          accentColorShadow.withOpacity(0.8)
        ],
        secondaryColors: [
          secondaryColorLight.withOpacity(0.8),
          accentColorShadow.withOpacity(0.8)
        ],
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/pic_connect_logo.svg',
                    color: primaryColor,
                    height: 74,
                  ),
                  _buildAvatarInput(state),
                  _buildSignUpForm(state, l10n),
                  _buildNotAccountRow(l10n)
                ])));
  }

  Widget _buildAvatarInput(SignUpState state) {
    return Stack(
      children: [
        state.image != null
            ? _buildUserPicture(state)
            : _buildDefaultAvatarImage(),
        Positioned(
          bottom: -10,
          left: 80,
          child: IconButton(
            onPressed: () => onPickUpImageFromGallery(context),
            icon: const Icon(Icons.add_a_photo, color: secondaryColor),
          ),
        )
      ],
    );
  }

  Widget _buildSignUpForm(SignUpState state, AppLocalizations l10n) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildUsernameTextInput(state, l10n),
        const SizedBox(height: 24),
        _buildEmailTextInput(state, l10n),
        const SizedBox(height: 24),
        _buildPasswordTextInput(state, l10n),
        const SizedBox(height: 24),
        _buildBioTextInput(state, l10n),
        const SizedBox(height: 24),
        _buildSignUpButton(state, l10n),
      ],
    );
  }

  Widget _buildUsernameTextInput(SignUpState state, AppLocalizations l10n) {
    return TextFieldInput(
        hintText: l10n.signUpUsernameTextInput,
        icon: const Icon(Icons.person, size: 16),
        textInputType: TextInputType.text,
        textEditingController: _usernameController);
  }

  Widget _buildEmailTextInput(SignUpState state, AppLocalizations l10n) {
    return TextFieldInput(
      hintText: l10n.signUpEmailTextInput,
      icon: const Icon(Icons.mail, size: 16),
      textInputType: TextInputType.emailAddress,
      textEditingController: _emailController,
    );
  }

  Widget _buildPasswordTextInput(SignUpState state, AppLocalizations l10n) {
    return TextFieldInput(
      hintText: l10n.signUpPasswordTextInput,
      icon: const Icon(Icons.password, size: 16),
      textInputType: TextInputType.text,
      textEditingController: _passwordController,
      isPass: true,
    );
  }

  Widget _buildBioTextInput(SignUpState state, AppLocalizations l10n) {
    return TextFieldInput(
      hintText: l10n.signUpBioTextInput,
      icon: const Icon(Icons.info, size: 16),
      textInputType: TextInputType.text,
      textEditingController: _bioController,
    );
  }

  Widget _buildSignUpButton(SignUpState state, AppLocalizations l10n) {
    return CommonButton(
      text: l10n.signUpButtonText,
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: onSignUpUser,
      sizeType: CommonButtonSizeType.large,
    );
  }

  Widget _buildDefaultAvatarImage() {
    return CircleAvatar(
      radius: 64,
      backgroundImage: const AssetImage("assets/user_default_icon.png"),
      backgroundColor: primaryColor.withOpacity(0.5),
    );
  }

  Widget _buildUserPicture(SignUpState state) {
    return CircleAvatar(
      radius: 64,
      backgroundImage: MemoryImage(state.image!),
      backgroundColor: primaryColor,
    );
  }

  Widget _buildNotAccountRow(AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(l10n.signUpHaveAccountText,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: whiteColor)),
        GestureDetector(
          onTap: widget.onSignInPressed,
          child: Text(
            l10n.signUpHaveAccountButtonText,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: secondaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
