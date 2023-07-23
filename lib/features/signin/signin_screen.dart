import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/core/widgets/animate_gradient_widget.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/features/core/widgets/text_field_input.dart';
import 'package:pic_connect/features/signin/signin_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:video_player/video_player.dart';

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
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.asset("assets/pic_connect_login_video.mp4")
          ..initialize().then((_) {
            // Once the video has been loaded we play the video and set looping to true.
            _videoController.play();
            _videoController.setLooping(true);
            // Ensure the first frame is shown after the video is initialized.
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _videoController.dispose();
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
    return BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
      if (context.mounted) {
        if (state.errorMessage != null) {
          showSnackBar(context, state.errorMessage!);
        } else if (state.isLoginSuccess) {
          onLoginSuccess();
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            _buildVideoBackground(context, state),
            _buildScreenContent(context, state)
          ],
        ),
      );
    });
  }

  Widget _buildScreenContent(BuildContext context, SignInState state) {
    return AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: [
          accentColor.withOpacity(0.7),
          secondaryColor.withOpacity(0.7)
        ],
        secondaryColors: [
          secondaryColor.withOpacity(0.7),
          accentColor.withOpacity(0.7),
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
              _buildSignInForm(state),
              _buildSignUpRow(state),
            ],
          ),
        ));
  }

  Widget _buildEmailTextInput(BuildContext context, SignInState state) {
    return TextFieldInput(
      hintText: 'Enter your email',
      icon: const Icon(
        Icons.mail,
        size: 16,
      ),
      textInputType: TextInputType.emailAddress,
      textEditingController: _emailController,
    );
  }

  Widget _buildPasswordTextInput(BuildContext context, SignInState state) {
    return TextFieldInput(
      hintText: 'Enter your password',
      icon: const Icon(
        Icons.password,
        size: 16,
      ),
      textInputType: TextInputType.text,
      textEditingController: _passwordController,
      isPass: true,
    );
  }

  Widget _buildSignInButton(SignInState state) {
    return CommonButton(
      text: "Sign In",
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: onLoginClicked,
    );
  }

  Widget _buildSignUpRow(SignInState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Dont have an account?',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: whiteColor)),
        GestureDetector(
          onTap: widget.onSignUpPressed,
          child: Text(
            ' Signup.',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: secondaryColor),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoBackground(BuildContext context, SignInState state) {
    return SizedBox.expand(
        child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _videoController.value.size.width ?? 0,
              height: _videoController.value.size.height ?? 0,
              child: VideoPlayer(_videoController),
            )));
  }

  Widget _buildSignInForm(SignInState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildEmailTextInput(context, state),
        const SizedBox(height: 15,),
        _buildPasswordTextInput(context, state),
        const SizedBox(height: 25,),
        _buildSignInButton(state)
      ],
    );
  }
}
