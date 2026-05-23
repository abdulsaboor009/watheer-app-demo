import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watheer_demo/utils/appcolors.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/screens/training%20courses/course%20detail/course_detail.dart';
import 'package:watheer_demo/views/widgets/custom_text.dart';
import 'package:watheer_demo/views/widgets/navigation_transitions.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';

// ignore: must_be_immutable
class CoursesCard extends StatelessWidget {
  final String courseImage;
  bool isExpired;
  bool isLoadDate = false;
  CoursesCard({
    super.key,
    required this.courseImage,
    required this.isExpired,
    required this.isLoadDate,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: isLoadDate
          ? InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  BottomToTopTransition(const CourseDetail()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveSize.w * 10,
                  vertical: ResponsiveSize.h * 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.secondaryColor,
                ),
                child: Row(
                  children: [
                    Container(
                      height: ResponsiveSize.h * 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xff5451D6),
                          width: 1,
                        ),
                        image: DecorationImage(
                          image: AssetImage(courseImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: ResponsiveSize.w * 5,
                            child: Image.asset(
                              isExpired
                                  ? AppConstant.course_expired
                                  : AppConstant.course_registration_available,
                              height: ResponsiveSize.h * 30,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: ResponsiveSize.h * 33,
                              width: ResponsiveSize.w * 33,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primaryColor,
                              ),
                              child: Center(
                                child: Image.asset(
                                  AppConstant.play,
                                  height: ResponsiveSize.h * 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    12.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: ResponsiveSize.w * 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: 'اسم الدورة ',
                                            color: AppColor.titleColor,
                                            fontSize:
                                                AppFontSize
                                                    .extremeSmalldiscription +
                                                1,
                                            fontWeight: Appfontweight.bold.font,
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextWidget(
                                      text: ' :',
                                      color: AppColor.titleColor,
                                      fontSize:
                                          AppFontSize.extremeSmalldiscription +
                                          1,
                                      fontWeight: Appfontweight.bold.font,
                                    ),
                                  ],
                                ),
                              ),
                              8.width,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: 'التعامل مع مشكلات ال ',
                                      color: AppColor.titleColor,
                                      fontSize:
                                          AppFontSize.extremeSmalldiscription +
                                          1,
                                      fontWeight:
                                          Appfontweight.very_extra_bold.font,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          5.height,
                          Row(
                            children: [
                              SizedBox(
                                width: ResponsiveSize.w * 60,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: 'المتحدث',
                                            color: AppColor.titleColor,
                                            fontSize:
                                                AppFontSize
                                                    .extremeSmalldiscription +
                                                1,
                                            fontWeight: Appfontweight.bold.font,
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextWidget(
                                      text: ' :',
                                      color: AppColor.titleColor,
                                      fontSize:
                                          AppFontSize.extremeSmalldiscription +
                                          1,
                                      fontWeight: Appfontweight.bold.font,
                                    ),
                                  ],
                                ),
                              ),
                              8.width,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: 'البروفيسور فاطمة الحيدر',
                                      color: AppColor.titleColor,
                                      fontSize:
                                          AppFontSize.extremeSmalldiscription +
                                          1,
                                      fontWeight:
                                          Appfontweight.very_extra_bold.font,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          5.height,
                          Row(
                            children: [
                              SizedBox(
                                width: ResponsiveSize.w * 60,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: 'سعر الدورة',
                                            color: AppColor.titleColor,
                                            fontSize:
                                                AppFontSize
                                                    .extremeSmalldiscription +
                                                1,
                                            fontWeight: Appfontweight.bold.font,
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextWidget(
                                      text: ' :',
                                      color: AppColor.titleColor,
                                      fontSize:
                                          AppFontSize.extremeSmalldiscription +
                                          1,
                                      fontWeight: Appfontweight.bold.font,
                                    ),
                                  ],
                                ),
                              ),
                              8.width,
                              TextWidget(
                                text: '50.00',
                                color: AppColor.titleColor,
                                fontSize:
                                    AppFontSize.extremeSmalldiscription + 1,
                                fontWeight: Appfontweight.very_extra_bold.font,
                              ),
                            ],
                          ),
                          7.height,
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                BottomToTopTransition(const CourseDetail()),
                              );
                            },
                            child: Container(
                              height: ResponsiveSize.h * 27,
                              width: ResponsiveSize.w * 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColor.primaryColor,
                              ),
                              child: Center(
                                child: TextWidget(
                                  text: 'التسجيل في الدورة',
                                  color: AppColor.whitetext,
                                  fontSize:
                                      AppFontSize.extremeSmalldiscription - 1,
                                  fontWeight:
                                      Appfontweight.very_extra_bold.font,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              height: ResponsiveSize.h * 120,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  15.width,
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: ResponsiveSize.h * 100,
                      width: 100,
                      color: Colors.white,
                    ),
                  ),
                  12.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        12.width,
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            height: ResponsiveSize.h * 12,
                            width: ResponsiveSize.w * 150,
                            color: Colors.white,
                          ),
                        ),
                        12.height,
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            height: ResponsiveSize.h * 12,
                            width: ResponsiveSize.w * 100,
                            color: Colors.white,
                          ),
                        ),
                        12.height,
                        Row(
                          children: [
                            Expanded(
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  height: ResponsiveSize.h * 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            10.width,
                            Expanded(
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  height: ResponsiveSize.h * 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
