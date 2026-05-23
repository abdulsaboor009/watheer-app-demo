import 'package:flutter/material.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/screen_utils_size.dart';

class PsychologicalAndOtherServicesCard extends StatelessWidget {
  final String image, title;
  const PsychologicalAndOtherServicesCard(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveSize.h * 116,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.whiteColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 3.3),
                blurRadius: 20,
                spreadRadius: 0,
                color: const Color(0xff8D8D8D).withOpacity(0.1))
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: ResponsiveSize.h * 92,
              width: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColor.secondaryColor,
              ),
              child: Center(
                child: Image.asset(
                  image,
                  height: ResponsiveSize.h * 55,
                ),
              ),
            ),
            TextWidget(
              text: title,
              color: AppColor.titleColor,
              fontSize: AppFontSize.screenTitle,
              fontWeight: Appfontweight.bold.font,
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
