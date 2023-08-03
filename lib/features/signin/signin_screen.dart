import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/core/widgets/animate_gradient_widget.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/features/core/widgets/loading_progress_indicator.dart';
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
          children: [
            _buildScreenBackground(),
            _buildScreenContent(state, l10n)
          ],
        ),
      );
    });
  }

  Widget _buildScreenContent(SignInState state, AppLocalizations l10n) {
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
              _buildSignInForm(state, l10n),
              _buildSignUpRow(state, l10n),
            ],
          ),
        ));
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
        const SizedBox(
          height: 15,
        ),
        _buildPasswordTextInput(state, l10n),
        const SizedBox(
          height: 25,
        ),
        _buildSignInButton(state, l10n)
      ],
    );
  }
}
