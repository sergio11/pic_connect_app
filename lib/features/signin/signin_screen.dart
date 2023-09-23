import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/features/core/widgets/common_onboarding_container.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/text_field_input.dart';
import 'package:pic_connect/features/signin/signin_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/textfield_validation.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onSignUpPressed;

  const LoginScreen({Key? key, required this.onSignUpPressed})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
  }

  void onLoginClicked() async {
    if (_formKey.currentState?.validate() == true) {
      hideKeyboard(context);
      context.read<SignInBloc>().add(
          OnDoSignInEvent(_emailController.text, _passwordController.text));
    } else {
      showErrorSnackBar(
          context: context,
          message: _l10n.signInEmailAndPasswordNotValid);
    }
  }

  void onLoginSuccess() async {
    context.read<AppBloc>().add(const OnVerifySession());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
      if (context.mounted) {
        if (state.errorMessage != null) {
          showErrorSnackBar(context: context, message: state.errorMessage!);
        } else if (state.isLoginSuccess) {
          onLoginSuccess();
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

  List<Widget> _buildScreenStack(SignInState state) {
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

  Widget _buildScreenContent(SignInState state) {
    return CommonOnBoardingContainer(
      children: [
        SvgPicture.asset(
          'assets/pic_connect_logo.svg',
          color: primaryColor,
          height: 74,
        ),
        _buildTitleScreen(),
        _buildSignInForm(state),
        _buildSignUpRow(state),
      ],
    );
  }

  Widget _buildTitleScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_l10n.signInMainTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: whiteColor, fontWeight: FontWeight.w300)),
      ],
    );
  }

  Widget _buildEmailTextInput(SignInState state) {
    return TextFieldInput(
      hintText: _l10n.signInEmailTextInput,
      icon: const Icon(
        Icons.mail,
        size: 16,
      ),
      textInputType: TextInputType.emailAddress,
      textEditingController: _emailController,
      onValidate: (value) =>
          value != null && value.isNotEmpty && value.isValidEmail(),
      errorText: _l10n.signInEmailNotValid,
    );
  }

  Widget _buildPasswordTextInput(SignInState state) {
    return TextFieldInput(
      hintText: _l10n.signInPasswordTextInput,
      icon: const Icon(
        Icons.password,
        size: 16,
      ),
      textInputType: TextInputType.text,
      textEditingController: _passwordController,
      isPass: true,
      onValidate: (value) =>
          value != null && value.isNotEmpty && value.isValidPassword(),
      errorText: _l10n.signInPasswordNotValid,
    );
  }

  Widget _buildSignInButton(SignInState state) {
    return CommonButton(
      text: _l10n.signInButtonText,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: onLoginClicked,
      sizeType: CommonButtonSizeType.large,
    );
  }

  Widget _buildSignUpRow(SignInState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_l10n.signInNotHaveAccount,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: whiteColor)),
        GestureDetector(
          onTap: widget.onSignUpPressed,
          child: Text(
            _l10n.signInNotHaveAccountSignUpButtonText,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: secondaryColor),
          ),
        ),
      ],
    );
  }

  Widget _buildScreenBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/sign_in_background_picture.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSignInForm(SignInState state) {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildEmailTextInput(state),
            _buildPasswordTextInput(state),
            const SizedBox(
              height: 25,
            ),
            _buildSignInButton(state)
          ],
        ));
  }
}
