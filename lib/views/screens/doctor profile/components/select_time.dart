import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/screen_utils_size.dart';

class DoctorProfileSelectTime extends StatefulWidget {
  const DoctorProfileSelectTime({super.key});

  @override
  State<DoctorProfileSelectTime> createState() =>
      _DoctorProfileSelectTimeState();
}

class _DoctorProfileSelectTimeState extends State<DoctorProfileSelectTime> {
  List<String> timeList = [
    '01:00م',
    '02:00م',
    '03:00م',
    '04:00م',
    '05:00م',
    '06:00م',
    '07:00م',
    '08:00م',
  ];
  int selectedTime = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextWidget(
              color: AppColor.titleColor,
              fontSize: AppFontSize.sectiontitle + 2,
              fontWeight: Appfontweight.semi_bold.font,
              text: 'حدد الوقت',
            ),
          ],
        ),
        15.height,
        GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: ResponsiveSize.w * 7.5,
            mainAxisSpacing: ResponsiveSize.h * 12,
            mainAxisExtent: ResponsiveSize.h * 46,
          ),
          itemCount: timeList.length,
          itemBuilder: (BuildContext context, int index) {
            return Animate(
              effects: const [
                FadeEffect(
                  duration: Duration(milliseconds: 900),
                  curve: Curves.easeInCirc,
                ),
                SlideEffect(
                  duration: Duration(milliseconds: 900),
                  curve: Curves.easeOutCubic,
                ),
              ],
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTime = index;
                  });
                },
                child: Container(
                  height: ResponsiveSize.h * 46,
                  width: 77,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.9),
                    color: selectedTime == index
                        ? AppColor.primaryColor
                        : Colors.transparent,
                    border: Border.all(
                      color: selectedTime == index
                          ? Colors.transparent
                          : AppColor.lightborderColor,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        color: selectedTime == index
                            ? AppColor.whitetext
                            : AppColor.subtitleColor,
                        fontSize: AppFontSize.extremeSmallTitle,
                        fontWeight: Appfontweight.semi_bold.font,
                        text: timeList[index],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
