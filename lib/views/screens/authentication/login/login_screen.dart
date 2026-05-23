import 'package:flutter/material.dart';
import 'package:watheer_demo/utils/appcolors.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/utils/appfontsizes.dart';
import 'package:watheer_demo/utils/appfontwight.dart';
import 'package:watheer_demo/views/widgets/custom_btn.dart';
import 'package:watheer_demo/views/widgets/custom_text.dart';
import 'package:watheer_demo/views/widgets/custom_textfield.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../widgets/navigation_transitions.dart';
import '../../navigation drawer/navigation_drawer.dart';
import '../verification/verification_screen.dart';
import 'components/country_code_picker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedCountryCode = '+966';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: prefer_final_fields
  TextEditingController _phoneController = TextEditingController();
  bool _validate = false;

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
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.19),
                    Image.asset(
                      AppConstant.logoWithText,
                      height: ResponsiveSize.h * 117,
                    ),
                    70.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextWidget(
                          text: 'مرحبا بك',
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
                            controller: _phoneController,
                            onValidator: (value) {
                              if (value!.isEmpty) {
                                return 'الرجاء التأكد من إدخال رقم الجوال';
                              }
                              if (value.length != 10) {
                                return 'الرجاء إدخال رقم الجوال الصحيح المكون من 10 أرقام';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            hint: 'الرجاء إدخال رقم الجوال',
                            prefixWidget: SizedBox(
                              width: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(AppConstant.phone),
                              ),
                            ),
                            suffixWidget: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return GccCountryCodePickerDialog(
                                      onValuePicked: (countryCode) {
                                        // Update the selected country code
                                        setState(() {
                                          selectedCountryCode = countryCode;
                                        });
                                      },
                                    );
                                  },
                                );
                              },
                              child: SizedBox(
                                width: ResponsiveSize.w * 70,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(width: 2),
                                    TextWidget(
                                      text: selectedCountryCode,
                                      color: AppColor.textfieldhintColor,
                                      fontSize: AppFontSize.discription,
                                      fontWeight: Appfontweight.normal.font,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: AppColor.textfieldhintColor,
                                      size: ResponsiveSize.h * 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    35.height,
                    CustomButton(
                      centerContent: 'المتابعة',
                      onPressed: () {
                        setState(() {
                          _validate = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            TopToBottomTransition(const VerificationScreen()),
                          );
                        }
                      },
                    ),
                    15.height,
                    CustomButton(
                      fontSize: AppFontSize.discription,
                      buttonColor: AppColor.guestButtonColor,
                      centerContent: 'الدخول كضيف',
                      onPressed: () {
                        Navigator.push(
                          context,
                          RightToLeftTransition(
                            NavigationDrawerWidget(isUserGuest: true),
                          ),
                        );
                      },
                      textColor: AppColor.primaryColor,
                      isIcon: true,
                      icon: Image.asset(
                        AppConstant.guest,
                        height: ResponsiveSize.h * 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
