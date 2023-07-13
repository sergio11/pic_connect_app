import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pic_connect/features/core/widgets/text_field_input.dart';
import 'package:pic_connect/features/signin/signin_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/signin/signin_event.dart';
import 'package:pic_connect/features/signin/signin_state.dart';
import 'package:pic_connect/routes/app_router.dart';
import 'package:pic_connect/routes/route_utils.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/global_variable.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {

  final VoidCallback onSigInSuccess;
  final VoidCallback onSignUpPressed;

  const LoginScreen({Key? key, required this.onSigInSuccess, required this.onSignUpPressed}) : super(key: key);

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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
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

  void onLoginClicked(BuildContext context) async {
    context
        .read<SignInBloc>()
        .add(OnDoSignInEvent(_emailController.text, _passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if(context.mounted) {
            if(state.errorMessage != null) {
              showSnackBar(context, state.errorMessage!);
            } else if (state.isLoggedIn) {
              widget.onSigInSuccess();
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    _buildVideoBackground(context, state),
                    _buildScreenContent(context, state)
                  ],
                ),
              ),
            ),
          );
        });
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

  Widget _buildSignInButton(BuildContext context, SignInState state) {
    return InkWell(
      onTap: () => {onLoginClicked(context)},
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            color: secondaryColor,
          ),
          child: state.isLoading
              ? const CircularProgressIndicator(color: whiteColor)
              : Text(
                  'Log in',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: primaryColor),
                )),
    );
  }

  Widget _buildSignUpRow(BuildContext context, SignInState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 50),
          child: Text('Dont have an account?',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: whiteColor)),
        ),
        GestureDetector(
          onTap: () => {
            widget.onSignUpPressed()
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 50),
            child: Text(
              ' Signup.',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: secondaryColor),
            ),
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

  Widget _buildScreenContent(BuildContext context, SignInState state) {
    return Container(
      decoration: BoxDecoration(color: primaryColor.withOpacity(0.4)),
      child: Padding(
        padding: MediaQuery.of(context).size.width > webScreenSize
            ? EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3)
            : const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(flex: 2, child: Container()),
            SvgPicture.asset(
              'assets/pic_connect_logo.svg',
              color: secondaryColor,
              height: 64,
            ),
            const SizedBox(height: 64),
            _buildEmailTextInput(context, state),
            const SizedBox(height: 24),
            _buildPasswordTextInput(context, state),
            const SizedBox(
              height: 24,
            ),
            _buildSignInButton(context, state),
            const SizedBox(
              height: 12,
            ),
            Flexible(flex: 2, child: Container()),
            _buildSignUpRow(context, state),
          ],
        ),
      ),
    );
  }
}
