// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:watheer_demo/views/screens/authentication/sign%20up/sign_up_screen.dart';
import 'package:watheer_demo/views/widgets/navigation_transitions.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
// import 'package:pinput/pinput.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/appconstant.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/screen_utils_size.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final defaultPinTheme = PinTheme(
    width: 57,
    height: ResponsiveSize.h * 57,
    textStyle: GoogleFonts.ibmPlexSansArabic(
      // fontFamily: 'Almendra',
      fontSize: AppFontSize.buttonText,
      color: AppColor.titleColor,
    ),
    decoration: BoxDecoration(
      color: AppColor.textFieldfillColor,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColor.textfieldBorderColor),
    ),
  );
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now().millisecondsSinceEpoch;
      if (endTime > now) {
        final secondsRemaining = (endTime - now) ~/ 1000;
        final minutes = secondsRemaining ~/ 60;
        final seconds = secondsRemaining % 60;
        setState(() {
          remainingTime = '$minutes:${seconds.toString().padLeft(2, '0')}';
        });
      } else {
        timer.cancel();
        setState(() {
          showResendButton = true;
        });
      }
    });
  }

  int endTime = DateTime.now().millisecondsSinceEpoch + 10 * 1000;
  String remainingTime = "0:10";

  bool showResendButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppConstant.login_screen_bg,
            height: MediaQuery.of(context).size.height * 0.55,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveSize.w * 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                    Center(
                      child: Container(
                        height: ResponsiveSize.h * 156,
                        width: ResponsiveSize.w * 156,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.primaryColor.withOpacity(0.4),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppConstant.lock_image,
                            height: ResponsiveSize.h * 110,
                          ),
                        ),
                      ),
                    ),
                    40.height,
                    TextWidget(
                      text: 'تَحَقّق',
                      color: AppColor.titleColor,
                      fontSize: AppFontSize.screenTitle,
                      fontWeight: Appfontweight.very_extra_bold.font,
                    ),
                    10.height,
                    RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '+966***432 ',
                            style: GoogleFonts.ibmPlexSansArabic(
                              // fontFamily: 'Almendra',
                              color: AppColor.titleColor,
                              fontSize:
                                  AppFontSize.sectiontitle -
                                  ResponsiveSize.setSp(1.5),
                              fontWeight: Appfontweight.semi_bold.font,
                            ),
                          ),
                          TextSpan(
                            text: 'الرجاء ادخال رمز التحقق المرسل إلى الرقم',
                            style: GoogleFonts.ibmPlexSansArabic(
                              // fontFamily: 'Almendra',
                              color: AppColor.titleColor,
                              fontSize:
                                  AppFontSize.sectiontitle -
                                  ResponsiveSize.setSp(1.5),
                              fontWeight: Appfontweight.semi_bold.font,
                            ),
                          ),
                        ],
                      ),
                    ),
                    22.height,
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveSize.w * 30,
                      ),
                      child: Form(
                        key: formKey,
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Pinput(
                                  length: 4,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  controller: pinController,
                                  focusNode: focusNode,
                                  listenForMultipleSmsOnAndroid: true,
                                  defaultPinTheme: defaultPinTheme,
                                  // separatorBuilder: (index) => 0.width,
                                  hapticFeedbackType:
                                      HapticFeedbackType.lightImpact,
                                  focusedPinTheme: defaultPinTheme.copyWith(
                                    decoration: defaultPinTheme.decoration!
                                        .copyWith(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          border: Border.all(
                                            color: AppColor.primaryColor,
                                            width: 1,
                                          ),
                                        ),
                                  ),

                                  validator: (value) {
                                    return value == '222222'
                                        ? null
                                        : "الرقم السري غير صحيح";
                                  },
                                  errorPinTheme: defaultPinTheme.copyWith(
                                    textStyle: GoogleFonts.ibmPlexSansArabic(
                                      // fontFamily: 'Almendra',
                                      fontSize: AppFontSize.buttonText,
                                      color: Colors.red,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: Colors.red,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  submittedPinTheme: defaultPinTheme.copyWith(
                                    decoration: defaultPinTheme.decoration!
                                        .copyWith(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          border: Border.all(
                                            color:
                                                AppColor.textfieldBorderColor,
                                            width: 1,
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    10.height,
                    showResendButton
                        ? Center(
                            child: TextButton(
                              onPressed: () {},
                              child: TextWidget(
                                text: "إعادة إرسال الرمز",
                                color: const Color(0xffDA4A54),
                                fontSize: AppFontSize.extremeSmallTitle + 1,
                                fontWeight: Appfontweight.medium.font,
                              ),
                            ),
                          )
                        : Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    style: GoogleFonts.ibmPlexSansArabic(
                                      // fontFamily: 'Almendra',
                                      color: const Color(0xffDA4A54),
                                      fontSize: AppFontSize.extremeSmallTitle,
                                      fontWeight: Appfontweight.medium.font,
                                    ),
                                    text: remainingTime,
                                  ),
                                  TextSpan(
                                    style: GoogleFonts.ibmPlexSansArabic(
                                      // fontFamily: 'Almendra',
                                      color: AppColor.titleColor,
                                      fontSize: AppFontSize.extremeSmallTitle,
                                      fontWeight: Appfontweight.medium.font,
                                    ),
                                    text: '  إعادة الإرسال خلال',
                                  ),
                                ],
                              ),
                            ),
                          ),
                    showResendButton ? 25.height : 35.height,
                    CustomButton(
                      centerContent: 'تأكيد',
                      onPressed: () {
                        // newUserAlertDiaglog(context);
                        Navigator.push(
                          context,
                          BottomToTopTransition(const SignUpScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: ResponsiveSize.w * 25,
            top: ResponsiveSize.h * 55,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: ResponsiveSize.h * 46,
                width: 49,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.86),
                  color: AppColor.primaryColor,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColor.whiteColor,
                    size: ResponsiveSize.h * 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
