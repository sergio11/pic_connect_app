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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void onLoginClicked() async {
    context
        .read<SignInBloc>()
        .add(OnDoSignInEvent(_emailController.text, _passwordController.text));
  }

  void onLoginSuccess() async {
    context.read<AppBloc>().add(const OnVerifySession());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
          children: _buildScreenStack(state, l10n),
        ),
      );
    });
  }

  List<Widget> _buildScreenStack(SignInState state, AppLocalizations l10n) {
    final screenStack = [
      _buildScreenBackground(),
      _buildScreenContent(state, l10n)
    ];
    if (state.isLoading) {
      screenStack.add(CommonScreenProgressIndicator(
        backgroundColor: blackColor.withOpacity(0.5),
        spinnerColor: primaryColor,
      ));
    }
    return screenStack;
  }

  Widget _buildScreenContent(SignInState state, AppLocalizations l10n) {
    return CommonOnBoardingContainer(
      children: [
        SvgPicture.asset(
          'assets/pic_connect_logo.svg',
          color: primaryColor,
          height: 74,
        ),
        _buildTitleScreen(l10n),
        _buildSignInForm(state, l10n),
        _buildSignUpRow(state, l10n),
      ],
    );
  }

  Widget _buildTitleScreen(AppLocalizations l10n) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(l10n.signInMainTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: whiteColor, fontWeight: FontWeight.w300)),
      ],
    );
  }

  Widget _buildEmailTextInput(SignInState state, AppLocalizations l10n) {
    return TextFieldInput(
      hintText: l10n.signInEmailTextInput,
      icon: const Icon(
        Icons.mail,
        size: 16,
      ),
      textInputType: TextInputType.emailAddress,
      textEditingController: _emailController,
    );
  }

  Widget _buildPasswordTextInput(SignInState state, AppLocalizations l10n) {
    return TextFieldInput(
      hintText: l10n.signInPasswordTextInput,
      icon: const Icon(
        Icons.password,
        size: 16,
      ),
      textInputType: TextInputType.text,
      textEditingController: _passwordController,
      isPass: true,
    );
  }

  Widget _buildSignInButton(SignInState state, AppLocalizations l10n) {
    return CommonButton(
      text: l10n.signInButtonText,
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: onLoginClicked,
      sizeType: CommonButtonSizeType.large,
    );
  }

  Widget _buildSignUpRow(SignInState state, AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(l10n.signInNotHaveAccount,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: whiteColor)),
        GestureDetector(
          onTap: widget.onSignUpPressed,
          child: Text(
            l10n.signInNotHaveAccountSignUpButtonText,
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

  Widget _buildSignInForm(SignInState state, AppLocalizations l10n) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildEmailTextInput(state, l10n),
        _buildPasswordTextInput(state, l10n),
        const SizedBox(
          height: 25,
        ),
        _buildSignInButton(state, l10n)
      ],
    );
  }
}
