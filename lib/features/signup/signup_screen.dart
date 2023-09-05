import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/core/widgets/avatar_input_selector.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/features/core/widgets/common_onboarding_container.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/text_field_input.dart';
import 'package:pic_connect/features/signup/signup_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/textfield_validation.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  late AppLocalizations _l10n;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _repeatPasswordController.dispose();
  }

  void onSignUpUser() async {
    if (_formKey.currentState?.validate() == true) {
      hideKeyboard(context);
      context.read<SignUpBloc>().add(OnDoSignUpEvent(
          _emailController.text,
          _passwordController.text,
          _usernameController.text,
          _repeatPasswordController.text));
    } else {
      showErrorSnackBar(context: context, message: _l10n.signUpDataNotValid);
    }
  }

  void onSignUpSuccess() async {
    showConfirmDialog(
        context: context,
        title: _l10n.signUpCompletedSuccessTitle,
        description: _l10n.signUpCompletedSuccessDescription,
        onAcceptPressed: () =>
            context.read<AppBloc>().add(const OnVerifySession()));
  }

  void onPickUpImageFromGallery() async {
    context
        .read<SignUpBloc>()
        .add(const OnPickUpImageEvent(ImageSource.gallery));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
      if (context.mounted) {
        if (state.isSignUpSuccess) {
          onSignUpSuccess();
        } else if (state.errorMessage != null) {
          showErrorSnackBar(context: context, message: state.errorMessage!);
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Stack(
          children: _buildScreenStack(state),
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

  List<Widget> _buildScreenStack(SignUpState state) {
    final screenStack = [
      _buildScreenBackground(),
      _buildScreenContent(state)
    ];
    if (state.isLoading) {
      screenStack.add(CommonScreenProgressIndicator(
        backgroundColor: blackColor.withOpacity(0.5),
        spinnerColor: primaryColor,
      ));
    }
    return screenStack;
  }

  Widget _buildScreenContent(SignUpState state) {
    return CommonOnBoardingContainer(
      children: [
        SvgPicture.asset(
          'assets/pic_connect_logo.svg',
          color: primaryColor,
          height: 74,
        ),
        _buildAvatarInput(state),
        _buildSignUpForm(state),
        _buildNotAccountRow()
      ],
    );
  }

  Widget _buildAvatarInput(SignUpState state) {
    return AvatarInputSelector(
      onPickUpImageFromGallery: () => onPickUpImageFromGallery(),
      avatarImageData: state.image,
    );
  }

  Widget _buildSignUpForm(SignUpState state) {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildUsernameTextInput(state),
            _buildEmailTextInput(state),
            _buildPasswordTextInput(state),
            _buildRepeatPasswordTextInput(state),
            const SizedBox(height: 24),
            _buildSignUpButton(state),
          ],
        ));
  }

  Widget _buildUsernameTextInput(SignUpState state) {
    return TextFieldInput(
        hintText: _l10n.signUpUsernameTextInput,
        icon: const Icon(Icons.person, size: 16),
        textInputType: TextInputType.text,
        onValidate: (value) =>
            value != null && value.isNotEmpty && value.isValidName(),
        errorText: _l10n.signUpUsernameNotValid,
        textEditingController: _usernameController);
  }

  Widget _buildEmailTextInput(SignUpState state) {
    return TextFieldInput(
      hintText: _l10n.signUpEmailTextInput,
      icon: const Icon(Icons.mail, size: 16),
      textInputType: TextInputType.emailAddress,
      textEditingController: _emailController,
      onValidate: (value) =>
          value != null && value.isNotEmpty && value.isValidEmail(),
      errorText: _l10n.signUpEmailNotValid,
    );
  }

  Widget _buildPasswordTextInput(SignUpState state) {
    return TextFieldInput(
      hintText: _l10n.signUpPasswordTextInput,
      icon: const Icon(Icons.password, size: 16),
      textInputType: TextInputType.text,
      textEditingController: _passwordController,
      onValidate: (value) =>
          value != null && value.isNotEmpty && value.isValidPassword(),
      errorText: _l10n.signUpPasswordNotValid,
      isPass: true,
    );
  }

  Widget _buildRepeatPasswordTextInput(
      SignUpState state) {
    return TextFieldInput(
      hintText: _l10n.signUpRepeatPasswordTextInput,
      icon: const Icon(Icons.password, size: 16),
      textInputType: TextInputType.text,
      textEditingController: _repeatPasswordController,
      onValidate: (value) =>
        value != null && value.isNotEmpty && _passwordController.value.text == value,
      errorText: _l10n.signUpPasswordNotMatch,
      isPass: true,
    );
  }

  Widget _buildSignUpButton(SignUpState state) {
    return CommonButton(
      text: _l10n.signUpButtonText,
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: onSignUpUser,
      sizeType: CommonButtonSizeType.large,
    );
  }

  Widget _buildNotAccountRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_l10n.signUpHaveAccountText,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: whiteColor)),
        GestureDetector(
          onTap: widget.onSignInPressed,
          child: Text(
            _l10n.signUpHaveAccountButtonText,
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
