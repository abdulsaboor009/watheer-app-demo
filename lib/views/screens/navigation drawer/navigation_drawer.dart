// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:watheer_demo/models/home_most_visited_model.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/utils/appfontsizes.dart';
import 'package:watheer_demo/utils/appfontwight.dart';
import 'package:watheer_demo/views/screens/home/home_screen.dart';
import 'package:watheer_demo/views/screens/my%20appoinyments/my_appointments.dart';
import 'package:watheer_demo/views/widgets/custom_text.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../utils/appcolors.dart';
import '../../widgets/navigation_transitions.dart';
import '../contact us/contact_us.dart';
import '../mood checker/mood_checker.dart';
import '../profile/profile.dart';
import '../purchased courses/purchased_courses.dart';
import 'components/social_media_links.dart';

final ZoomDrawerController z = ZoomDrawerController();

// ignore: must_be_immutable
class NavigationDrawerWidget extends StatefulWidget {
  bool isUserGuest;
  NavigationDrawerWidget({super.key, this.isUserGuest = false});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  List<HomeMostVisitedModel> drawerItemsList = [
    HomeMostVisitedModel(AppConstant.drawer_item1, ' معلوماتي'),
    HomeMostVisitedModel(AppConstant.drawer_item2, 'مواعيدي'),
    HomeMostVisitedModel(AppConstant.drawer_item3, 'الدورات'),
    HomeMostVisitedModel(AppConstant.drawer_item4, 'مزاجك؟'),
    HomeMostVisitedModel(AppConstant.drawer_item5, 'تواصل معنا'),
    HomeMostVisitedModel(AppConstant.drawer_item6, 'وسائل التواصل الاجتماعي'),
  ];

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      isRtl: true,
      controller: z,
      angle: 0.0,
      borderRadius: 30,
      closeCurve: Curves.linear,
      showShadow: true,
      mainScreenScale: 0.2,
      openCurve: Curves.linear,
      slideWidth: MediaQuery.of(context).size.width * 0.64,
      duration: const Duration(milliseconds: 300),
      mainScreenTapClose: true,
      shadowLayer1Color: Colors.transparent,
      shadowLayer2Color: const Color(0xff1E0909).withOpacity(0.05),
      menuBackgroundColor: AppColor.backgroundColor,
      mainScreen: HomeScreen(isUserGuest: widget.isUserGuest),
      menuScreen: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.only(right: ResponsiveSize.w * 25),
                child: Column(
                  children: [
                    45.height,
                    Image.asset(
                      AppConstant.logo1,
                      height: ResponsiveSize.h * 90,
                    ),
                    40.height,
                    ListView.builder(
                      itemCount: drawerItemsList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.none,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: index == 0 ? 0 : ResponsiveSize.h * 10,
                          ),
                          child: InkWell(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Navigator.push(
                                    context,
                                    LeftToRightTransition(UserProfile()),
                                  );
                                  break;
                                case 1:
                                  Navigator.push(
                                    context,
                                    LeftToRightTransition(
                                      const MyAppointmentsScreen(),
                                    ),
                                  );
                                  break;
                                case 2:
                                  Navigator.push(
                                    context,
                                    LeftToRightTransition(
                                      const PurchasesCourses(),
                                    ),
                                  );
                                  break;
                                case 3:
                                  Navigator.push(
                                    context,
                                    LeftToRightTransition(
                                      const MoodCheckerScreen(),
                                    ),
                                  );
                                  break;
                                case 4:
                                  Navigator.push(
                                    context,
                                    LeftToRightTransition(const ContactUs()),
                                  );
                                  break;
                                case 5:
                                  // Navigator.push(
                                  //   context,
                                  //   LeftToRightTransition(
                                  //     const MoodCheckerScreen(),
                                  //   ),
                                  // );
                                  break;
                                default:
                              }
                            },
                            splashColor: AppColor.primaryColor.withOpacity(0.2),
                            highlightColor: AppColor.primaryColor.withOpacity(
                              0.2,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: ResponsiveSize.h * 11,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    drawerItemsList[index].image,
                                    height: ResponsiveSize.h * 23,
                                  ),
                                  10.width,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          textAlign: TextAlign.start,
                                          color: AppColor.lighttitleColor
                                              .withOpacity(0.8),
                                          fontSize:
                                              AppFontSize.extremeSmallTitle,
                                          fontWeight: Appfontweight.bold.font,
                                          text: drawerItemsList[index].name,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    20.height,
                    NavigationDrawerSocialMediaLinks(),
                    40.height,
                    Container(
                      width: ResponsiveSize.w * 150,
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveSize.w * 12,
                        vertical: ResponsiveSize.h * 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xffDA4A54),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            color: AppColor.whitetext,
                            fontSize: AppFontSize.discription,
                            fontWeight: Appfontweight.normal.font,
                            text: 'تسجيل الخروج',
                          ),
                          10.width,
                          Image.asset(
                            AppConstant.power,
                            height: ResponsiveSize.h * 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
