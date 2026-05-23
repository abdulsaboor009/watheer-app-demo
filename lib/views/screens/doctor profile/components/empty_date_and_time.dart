import 'package:flutter/material.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/widgets/custom_text.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';

class EmptyDateAndTimeScreen extends StatelessWidget {
  const EmptyDateAndTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        75.height,
        Center(
          child: Image.asset(
            AppConstant.no_time_for_appointment,
            height: ResponsiveSize.h * 143,
          ),
        ),
        35.height,
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 30),
            child: TextWidget(
              textAlign: TextAlign.center,
              color: const Color(0xffCF1F22),
              text: 'نعتذر العياده مغلقه في الوقت الحالي',
              fontSize: AppFontSize.sectiontitle,
              fontWeight: Appfontweight.bold.font,
            ),
          ),
        ),
      ],
    );
  }
}
