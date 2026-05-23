import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watheer_demo/utils/appcolors.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../models/doctor_profile_select_time_model.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_text.dart';

class DoctorProfileSelectDate extends StatefulWidget {
  const DoctorProfileSelectDate({super.key});

  @override
  State<DoctorProfileSelectDate> createState() =>
      _DoctorProfileSelectDateState();
}

class _DoctorProfileSelectDateState extends State<DoctorProfileSelectDate> {
  List<DoctorProfileSelectTimeModel> dateList = [
    DoctorProfileSelectTimeModel('7', 'الاثنين'),
    DoctorProfileSelectTimeModel('8', 'يوم الثلاثاء'),
    DoctorProfileSelectTimeModel('9', 'الأربعاء'),
    DoctorProfileSelectTimeModel('10', 'الخميس'),
    DoctorProfileSelectTimeModel('11', 'جمعة'),
    DoctorProfileSelectTimeModel('12', 'جمعة'),
    DoctorProfileSelectTimeModel('13', 'جمعة'),
  ];
  int selectedDate = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        44.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextWidget(
              color: AppColor.titleColor,
              fontSize: AppFontSize.sectiontitle + 2,
              fontWeight: Appfontweight.semi_bold.font,
              text: 'حدد التاريخ',
            ),
          ],
        ),
        15.height,
        SizedBox(
          height: ResponsiveSize.h * 65,
          child: ListView.builder(
            itemCount: dateList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            reverse: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index == 0 ? 0 : ResponsiveSize.w * 15,
                ),
                child: Animate(
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
                        selectedDate = index;
                      });
                    },
                    child: Container(
                      height: ResponsiveSize.h * 65,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.9),
                        color: selectedDate == index
                            ? AppColor.primaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: selectedDate == index
                              ? Colors.transparent
                              : AppColor.lightborderColor,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            color: selectedDate == index
                                ? AppColor.whitetext
                                : AppColor.titleColor,
                            fontSize: AppFontSize.extraSmallTitle,
                            fontWeight: Appfontweight.semi_bold.font,
                            text: dateList[index].date,
                          ),
                          2.height,
                          TextWidget(
                            color: selectedDate == index
                                ? AppColor.whitetext
                                : AppColor.subtitleColor,
                            fontSize: AppFontSize.extremeSmalldiscription,
                            fontWeight: Appfontweight.semi_bold.font,
                            text: dateList[index].day,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
