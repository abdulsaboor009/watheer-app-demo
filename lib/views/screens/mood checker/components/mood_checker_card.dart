import 'package:flutter/material.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/screen_utils_size.dart';

// ignore: must_be_immutable
class MoodCheckerCard extends StatelessWidget {
  final String moodImage, moodName;
  final Color moodColor;
  bool isSelectedMood;
  MoodCheckerCard({
    super.key,
    required this.moodImage,
    required this.moodName,
    required this.moodColor,
    this.isSelectedMood = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveSize.h * 165,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: moodColor,
        border: Border.all(
          color: isSelectedMood ? AppColor.blackColor : Colors.transparent,
          width: isSelectedMood ? 3 : 0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(moodImage, height: ResponsiveSize.h * 75),
          20.height,
          TextWidget(
            color: AppColor.whitetext,
            fontSize: AppFontSize.screenTitle,
            fontWeight: Appfontweight.bold.font,
            text: moodName,
          ),
        ],
      ),
    );
  }
}
