import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pic_connect/resources/auth_methods.dart';
import 'package:pic_connect/responsive/mobile_screen_layout.dart';
import 'package:pic_connect/responsive/responsive_layout.dart';
import 'package:pic_connect/responsive/web_screen_layout.dart';
import 'package:pic_connect/screens/signup_screen.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/global_variable.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:pic_connect/widgets/text_field_input.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late VideoPlayerController _videoController;
  bool _isLoading = false;

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

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenLayout(),
              ),
            ),
            (route) => false);
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      if (context.mounted) {
        showSnackBar(context, res);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox.expand(
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _videoController.value.size.width ?? 0,
                        height: _videoController.value.size.height ?? 0,
                        child: VideoPlayer(_videoController),
                      ))),
              Container(
                decoration: BoxDecoration(color: primaryColor.withOpacity(0.4)),
                child: Padding(
                  padding: MediaQuery.of(context).size.width > webScreenSize
                      ? EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 3)
                      : const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(),
                      ),
                      SvgPicture.asset(
                        'assets/pic_connect_logo.svg',
                        color: secondaryColor,
                        height: 64,
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      TextFieldInput(
                        hintText: 'Enter your email',
                        icon: const Icon(
                          Icons.mail,
                          size: 16,
                        ),
                        textInputType: TextInputType.emailAddress,
                        textEditingController: _emailController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFieldInput(
                        hintText: 'Enter your password',
                        icon: const Icon(
                          Icons.password,
                          size: 16,
                        ),
                        textInputType: TextInputType.text,
                        textEditingController: _passwordController,
                        isPass: true,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      InkWell(
                        onTap: loginUser,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                            color: secondaryColor,
                          ),
                          child: !_isLoading
                              ? Text(
                                  'Log in',
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(color: primaryColor),
                                )
                              : const CircularProgressIndicator(
                                  color: whiteColor,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(),
                      ),
                      Row(
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
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            ),
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
