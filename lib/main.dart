import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watheer_demo/utils/appcolors.dart';
import 'package:watheer_demo/views/screens/authentication/splash/splash_screen.dart';

void main() {
  runApp(const WatheerApp());
}

class WatheerApp extends StatelessWidget {
  const WatheerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: const Size(375, 812));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watheer App',
      theme: ThemeData(
        useMaterial3: true,
      ).copyWith(scaffoldBackgroundColor: AppColor.backgroundColor),
      home: const SplashScreen(),
    );
  }
}
