// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watheer_demo/views/widgets/navigation_transitions.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/appconstant.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/screen_utils_size.dart';
import '../../navigation drawer/navigation_drawer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _idNumberController = TextEditingController();
  bool _validate = false;
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "الرجاء إدخال عنوان بريد إلكتروني";
    } else if (!GetUtils.isEmail(value)) {
      return "الرجاء التأكد من إدخال البريد الالكتروني بالطريقة الصحيحة";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Column(
      //   children: [

      //     ),
      //   ],
      // ),
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
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.19),
                    Image.asset(
                      AppConstant.logoWithText,
                      height: ResponsiveSize.h * 117,
                    ),
                    70.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: 'إنضم إلينا',
                          color: AppColor.titleColor,
                          fontSize: AppFontSize.screenTitle,
                          fontWeight: Appfontweight.very_extra_bold.font,
                        ),
                      ],
                    ),
                    21.height,
                    Form(
                      key: _formKey,
                      autovalidateMode: _validate
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          customTextfield(
                            controller: _userNameController,
                            onValidator: (value) {
                              if (value!.isEmpty) {
                                return "الرجاء إدخال اسمك";
                              }
                              return null;
                            },
                            hint: 'الاسم الثلاثي',
                            prefixWidget: SizedBox(
                              width: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(AppConstant.user),
                              ),
                            ),
                          ),
                          20.height,
                          customTextfield(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            onValidator: validateEmail,
                            hint: 'البريد الالكتروني',
                            prefixWidget: SizedBox(
                              width: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(AppConstant.email),
                              ),
                            ),
                          ),
                          20.height,
                          customTextfield(
                            controller: _idNumberController,
                            onValidator: (value) {
                              if (value!.isEmpty) {
                                return "الرجاء إدخال رقم الهوية";
                              }
                              return null;
                            },
                            hint: 'رقم الهوية',
                            keyboardType: TextInputType.number,
                            prefixWidget: SizedBox(
                              width: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(AppConstant.id),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    35.height,
                    CustomButton(
                      centerContent: 'إنشاء حساب',
                      onPressed: () {
                        setState(() {
                          _validate = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            RightToLeftTransition(
                              NavigationDrawerWidget(isUserGuest: false),
                            ),
                          );
                        }
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
