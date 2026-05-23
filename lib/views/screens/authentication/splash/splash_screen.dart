import 'package:flutter/material.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/screens/authentication/onboarding/onboarding_screen.dart';
import 'package:watheer_demo/views/widgets/navigation_transitions.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startFadeAnimation();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(context, RightToLeftTransition(const OnBoardingScreen()));
    });
  }

  startFadeAnimation() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        animate = false;
      });
    });
  }

  bool animate = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppConstant.splashGif),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: ResponsiveSize.h * 60),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1300),
                    opacity: animate ? 0 : 1,
                    child: Image.asset(
                      AppConstant.logoWithText,
                      height: ResponsiveSize.h * 80,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: ResponsiveSize.h * 80),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1300),
                    opacity: animate ? 0 : 1,
                    child: Image.asset(
                      AppConstant.splash_center_image,
                      height: ResponsiveSize.h * 100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
