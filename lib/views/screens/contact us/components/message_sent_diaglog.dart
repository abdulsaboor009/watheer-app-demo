import 'package:flutter/material.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../../utils/appcolors.dart';
import '../../../../../utils/appconstant.dart';
import '../../../../../utils/appfontsizes.dart';
import '../../../../../utils/appfontwight.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/screen_utils_size.dart';

Future contactUsMessageSentDiaglog(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Dialog(
            elevation: 0,
            clipBehavior: Clip.none,
            backgroundColor: Colors.transparent,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: ResponsiveSize.w * 316,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppConstant.new_user_auth_diaglog),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveSize.w * 40,
                        ),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Transform.translate(
                                offset: const Offset(0, -40),
                                child: Transform.scale(
                                  scale: 1.6,
                                  child: Image.asset(
                                    AppConstant.appointment_booked_img,
                                    height: ResponsiveSize.h * 70,
                                  ),
                                ),
                              ),
                              TextWidget(
                                textAlign: TextAlign.center,
                                text: 'تم ارسال رسالتك',
                                color: const Color(0xffFF621F),
                                fontSize: AppFontSize.sectiontitle + 2,
                                fontWeight: Appfontweight.very_extra_bold.font,
                              ),
                              6.height,
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ResponsiveSize.w * 10,
                                ),
                                child: TextWidget(
                                  textAlign: TextAlign.center,
                                  text: 'وسيتم التواصل معك قريبا',
                                  color: AppColor.titleColor,
                                  fontSize: AppFontSize.sectiontitle,
                                  fontWeight:
                                      Appfontweight.very_extra_bold.font,
                                ),
                              ),
                              30.height,
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ResponsiveSize.w * 40,
                                ),
                                child: CustomButton(
                                  borderRadius: 8,
                                  fontSize: AppFontSize.discription,
                                  height: ResponsiveSize.h * 45,
                                  centerContent: 'نهارك سعيد',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              25.height,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
