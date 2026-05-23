import 'package:flutter/material.dart';
import 'package:watheer_demo/utils/appcolors.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';

import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_text.dart';

class PurchasedCoursesCard extends StatelessWidget {
  const PurchasedCoursesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: ResponsiveSize.h * 116,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.whiteColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3.3),
              blurRadius: 20.7,
              spreadRadius: 0,
              color: const Color(0xff8D8D8D).withOpacity(0.1),
            ),
          ],
        ),
        child: Stack(
          children: [
            SizedBox(
              height: ResponsiveSize.h * 116,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveSize.w * 15,
                ),
                child: Row(
                  children: [
                    Container(
                      height: ResponsiveSize.h * 67,
                      width: 67,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.87),
                        color: AppColor.primaryColor.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Image.asset(
                          AppConstant.purchased_courses_card_icon,
                          height: ResponsiveSize.h * 45,
                        ),
                      ),
                    ),
                    20.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'اسم الدورة :',
                            color: AppColor.titleColor,
                            fontSize: AppFontSize.extremeSmallTitle + 1,
                            fontWeight: Appfontweight.bold.font,
                          ),
                          8.height,
                          TextWidget(
                            textAlign: TextAlign.start,
                            text: 'التغلب على مخاوف التواصل مع الاخرين',
                            color: AppColor.titleColor,
                            fontSize: AppFontSize.extremeSmallTitle + 1,
                            fontWeight: Appfontweight.very_extra_bold.font,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
