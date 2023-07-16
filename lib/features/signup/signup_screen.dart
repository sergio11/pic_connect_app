import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/core/widgets/text_field_input.dart';
import 'package:pic_connect/features/signup/signup_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:video_player/video_player.dart';

class SignupScreen extends StatefulWidget {

  final VoidCallback onSignInPressed;

  const SignupScreen({Key? key, required this.onSignInPressed}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.asset("assets/pic_connect_signup_video.mp4")
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
    _usernameController.dispose();
    _videoController.dispose();
  }

  void onSignUpUser() async {
    context.read<SignUpBloc>().add(OnDoSignUpEvent(
        _emailController.text,
        _passwordController.text,
        _usernameController.text,
        _bioController.text
    ));
  }

  void onSignUpSuccess() async {
    context.read<AppBloc>()
        .add(const OnVerifySession());
  }

  void onPickUpImageFromGallery(BuildContext context) async {
    context.read<SignUpBloc>().add(const OnPickUpImageEvent(ImageSource.gallery));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if(context.mounted) {
            if(state.isSignUpSuccess) {
              onSignUpSuccess();
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

  Widget _buildVideoBackground(BuildContext context, SignUpState state) {
    return SizedBox.expand(
        child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _videoController.value.size.width ?? 0,
              height: _videoController.value.size.height ?? 0,
              child: VideoPlayer(_videoController),
            )));
  }

  Widget _buildScreenContent(BuildContext context, SignUpState state) {
    return Container(
      decoration: BoxDecoration(color: primaryColor.withOpacity(0.4)),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(flex: 2, child: Container()),
          SvgPicture.asset(
            'assets/pic_connect_logo.svg',
            color: secondaryColor,
            height: 64,
          ),
          const SizedBox(
            height: 64,
          ),
          _buildAvatarInput(context, state),
          const SizedBox(height: 24),
          _buildUsernameTextInput(context, state),
          const SizedBox(height: 24),
          _buildEmailTextInput(context, state),
          const SizedBox(height: 24),
          _buildPasswordTextInput(context, state),
          const SizedBox(height: 24),
          _buildBioTextInput(context, state),
          const SizedBox(height: 24),
          __buildSignUpButton(context, state),
          const SizedBox(height: 12),
          Flexible(flex: 2, child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text('Already have an account?',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: whiteColor)),
              ),
              GestureDetector(
                onTap: () => {
                  widget.onSignInPressed()
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    ' Login.',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: secondaryColor),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarInput(BuildContext context, SignUpState state) {
    return Stack(
      children: [
        state.image != null
            ? CircleAvatar(
                radius: 64,
                backgroundImage: MemoryImage(state.image!),
                backgroundColor: secondaryColor,
              )
            : const CircleAvatar(
                radius: 64,
                backgroundImage:
                    NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
                backgroundColor: secondaryColor,
              ),
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

  Widget _buildUsernameTextInput(BuildContext context, SignUpState state) {
    return TextFieldInput(
        hintText: 'Enter your username',
        icon: const Icon(Icons.person, size: 16),
        textInputType: TextInputType.text,
        textEditingController: _usernameController);
  }

  Widget _buildEmailTextInput(BuildContext context, SignUpState state) {
    return TextFieldInput(
      hintText: 'Enter your email',
      icon: const Icon(Icons.mail, size: 16),
      textInputType: TextInputType.emailAddress,
      textEditingController: _emailController,
    );
  }

  Widget _buildPasswordTextInput(BuildContext context, SignUpState state) {
    return TextFieldInput(
      hintText: 'Enter your password',
      icon: const Icon(Icons.password, size: 16),
      textInputType: TextInputType.text,
      textEditingController: _passwordController,
      isPass: true,
    );
  }

  Widget _buildBioTextInput(BuildContext context, SignUpState state) {
    return TextFieldInput(
      hintText: 'Enter your bio',
      icon: const Icon(Icons.info, size: 16),
      textInputType: TextInputType.text,
      textEditingController: _bioController,
    );
  }

  Widget __buildSignUpButton(BuildContext context, SignUpState state) {
    return InkWell(
      onTap: () => onSignUpUser(),
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
        child: !state.isLoading
            ? Text('Sign up',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: primaryColor))
            : const CircularProgressIndicator(color: primaryColor),
      ),
    );
  }
}
