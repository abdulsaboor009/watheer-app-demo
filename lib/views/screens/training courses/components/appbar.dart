import 'package:flutter/material.dart';
import 'package:watheer_demo/utils/appcolors.dart';
import 'package:watheer_demo/views/widgets/custom_btn.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../../utils/appfontsizes.dart';
import '../../../../../utils/appfontwight.dart';
import '../../../widgets/custom_text.dart';

// ignore: must_be_immutable
class TrainingCoursesAppBar extends StatefulWidget {
  final Function(int) onTabselected;
  const TrainingCoursesAppBar({super.key, required this.onTabselected});

  @override
  State<TrainingCoursesAppBar> createState() => _TrainingCoursesAppBarState();
}

class _TrainingCoursesAppBarState extends State<TrainingCoursesAppBar> {
  int selectedTab = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: AppColor.primaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              45.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveSize.w * 10,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: ResponsiveSize.h * 20,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: ResponsiveSize.w * 50),
                    child: TextWidget(
                      text: 'الدورات التدريبية',
                      color: AppColor.whitetext,
                      fontSize: AppFontSize.screenTitle,
                      fontWeight: Appfontweight.bold.font,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
              24.height,
              Container(
                height: ResponsiveSize.h * 64,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor.withOpacity(0.3),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveSize.w * 22,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          fontWeight: selectedTab == 0
                              ? Appfontweight.very_extra_bold.font
                              : Appfontweight.bold.font,
                          buttonColor: selectedTab == 0
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          fontSize: AppFontSize.discription,
                          centerContent: 'المسجله',
                          borderRadius: 9.39,
                          onPressed: () {
                            setState(() {
                              selectedTab = 0;
                              widget.onTabselected(0);
                            });
                          },
                          height: ResponsiveSize.h * 46,
                        ),
                      ),
                      10.width,
                      Expanded(
                        child: CustomButton(
                          fontWeight: selectedTab == 1
                              ? Appfontweight.very_extra_bold.font
                              : Appfontweight.bold.font,
                          buttonColor: selectedTab == 1
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          fontSize: AppFontSize.discription,
                          borderRadius: 9.39,
                          centerContent: 'التخصصية',
                          onPressed: () {
                            setState(() {
                              selectedTab = 1;
                              widget.onTabselected(1);
                            });
                          },
                          height: ResponsiveSize.h * 46,
                        ),
                      ),
                      10.width,
                      Expanded(
                        child: CustomButton(
                          fontWeight: selectedTab == 2
                              ? Appfontweight.very_extra_bold.font
                              : Appfontweight.bold.font,
                          buttonColor: selectedTab == 2
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          fontSize: AppFontSize.discription,
                          borderRadius: 9.39,
                          centerContent: 'العامة',
                          onPressed: () {
                            setState(() {
                              selectedTab = 2;
                              widget.onTabselected(2);
                            });
                          },
                          height: ResponsiveSize.h * 46,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
