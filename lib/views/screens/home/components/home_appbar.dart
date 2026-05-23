import 'package:flutter/material.dart';
import 'package:watheer_demo/utils/appcolors.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/widgets/custom_btn.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_text.dart';
import '../../navigation drawer/navigation_drawer.dart';

// ignore: must_be_immutable
class HomeAppBar extends StatefulWidget {
  final Function(int) onTabselected;
  bool isUserGuest;
  HomeAppBar({
    super.key,
    required this.onTabselected,
    this.isUserGuest = false,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  int selectedTab = 1;
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
              55.height,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveSize.w * 15,
                ),
                child: IconButton(
                  onPressed: () {
                    z.toggle!();
                  },
                  icon: Container(
                    height: ResponsiveSize.h * 40,
                    width: ResponsiveSize.w * 40,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        AppConstant.menu,
                        height: ResponsiveSize.h * 25,
                      ),
                    ),
                  ),
                ),
              ),
              10.height,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveSize.w * 22,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextWidget(
                      text: 'مرحبا بك ',
                      color: AppColor.whitetext,
                      fontSize: AppFontSize.largediscription,
                      fontWeight: Appfontweight.semi_bold.font,
                    ),
                    widget.isUserGuest ? 0.height : 4.height,
                    widget.isUserGuest
                        ? const SizedBox()
                        : TextWidget(
                            text: 'مرام الطويرقي',
                            color: AppColor.whitetext,
                            fontSize: AppFontSize.sectiontitle + 2,
                            fontWeight: Appfontweight.medium.font,
                          ),
                    4.height,
                    TextWidget(
                      text: 'كيف يمكننا مساعدتك اليوم؟',
                      color: AppColor.whitetext,
                      fontSize: AppFontSize.sectiontitle + 2,
                      fontWeight: Appfontweight.bold.font,
                    ),
                  ],
                ),
              ),
              8.height,
              Container(
                height: ResponsiveSize.h * 64,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor.withOpacity(0.3),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveSize.w * 30,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          fontWeight: selectedTab == 2
                              ? Appfontweight.very_extra_bold.font
                              : Appfontweight.bold.font,
                          buttonColor: selectedTab == 2
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          fontSize: AppFontSize.discription,
                          centerContent: 'الخدمات الأخرى',
                          borderRadius: 9.39,
                          onPressed: () {
                            setState(() {
                              selectedTab = 2;
                              widget.onTabselected(2);
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
                          centerContent: 'الرعاية النفسية',
                          onPressed: () {
                            setState(() {
                              selectedTab = 1;
                              widget.onTabselected(1);
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
