import 'package:flutter/material.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watheer_demo/utils/appcolors.dart';
import 'package:watheer_demo/views/screens/doctor%20profile/doctor_profile.dart';
import 'package:watheer_demo/views/widgets/navigation_transitions.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_stepper.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/screen_utils_size.dart';

// ignore: must_be_immutable
class TrainingDoctorsCard extends StatelessWidget {
  final String doctorImage, doctorName, doctorFor, doctorType;
  bool isLoadDate = false;
  TrainingDoctorsCard({
    super.key,
    required this.doctorImage,
    required this.doctorName,
    required this.doctorFor,
    required this.doctorType,
    required this.isLoadDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveSize.w * 20,
        vertical: ResponsiveSize.h * 25,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.88),
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 7.88),
            spreadRadius: 0,
            blurRadius: 39,
            // ignore: deprecated_member_use
            color: const Color(0xff8A959E).withOpacity(0.2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              isLoadDate
                  ? Container(
                      height: ResponsiveSize.h * 54,
                      width: ResponsiveSize.w * 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(doctorImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: ResponsiveSize.h * 54,
                        width: ResponsiveSize.w * 54,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
              15.width,
              isLoadDate
                  ? TextWidget(
                      color: AppColor.titleColor,
                      text: doctorName,
                      fontSize: AppFontSize.sectiontitle,
                      fontWeight: Appfontweight.very_extra_bold.font,
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: ResponsiveSize.w * 100,
                        height: ResponsiveSize.h * 10,
                        color: Colors.white,
                      ),
                    ),
            ],
          ),
          15.height,
          FDottedLine(
            color: AppColor.darkborderColor,
            height: 1,
            width: double.infinity,
            space: 2,
          ),
          Transform.translate(
            offset: const Offset(0, -15),
            child: CustomStepper(
              indicatorSize: ResponsiveSize.h * 35,
              indicators: List<Widget>.generate(
                3,
                (index) => Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor,
                  ),
                  child: Center(
                    child: Container(
                      height: ResponsiveSize.h * 12,
                      width: ResponsiveSize.w * 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              children: <Widget>[
                Transform.translate(
                  offset: const Offset(0, 10),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: ResponsiveSize.h * 20,
                    ),
                    child: isLoadDate
                        ? TextWidget(
                            color: AppColor.titleColor,
                            textAlign: TextAlign.start,
                            text:
                                'البورد الامريكي في الطب النفسي للبالغين ، خبرة في العلاج النفسي التحليلي والاشراف على كثير من حالات العلاج النفسي للمتدربين من',
                            fontSize: AppFontSize.extremeSmallTitle + 1,
                            fontWeight: Appfontweight.bold.font,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  width: ResponsiveSize.w * 160,
                                  height: ResponsiveSize.h * 10,
                                  color: Colors.white,
                                ),
                              ),
                              7.height,
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  width: ResponsiveSize.w * 180,
                                  height: ResponsiveSize.h * 10,
                                  color: Colors.white,
                                ),
                              ),
                              7.height,
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  width: double.infinity,
                                  height: ResponsiveSize.h * 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ResponsiveSize.h * 15,
                  ),
                  child: isLoadDate
                      ? Row(
                          children: [
                            TextWidget(
                              color: AppColor.titleColor,
                              text: 'التصنيف :',
                              fontSize: AppFontSize.extremeSmallTitle + 1,
                              fontWeight: Appfontweight.bold.font,
                            ),
                            18.width,
                            TextWidget(
                              color: AppColor.titleColor,
                              text: 'العلاج المعرفي السلوكي',
                              fontSize: AppFontSize.extremeSmallTitle + 1,
                              fontWeight: Appfontweight.very_extra_bold.font,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: ResponsiveSize.w * 140,
                                height: ResponsiveSize.h * 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ResponsiveSize.h * 15,
                  ),
                  child: isLoadDate
                      ? Row(
                          children: [
                            TextWidget(
                              color: AppColor.titleColor,
                              text: 'السيرة الذاتية :',
                              fontSize: AppFontSize.extremeSmallTitle + 1,
                              fontWeight: Appfontweight.bold.font,
                            ),
                            18.width,
                            Container(
                              height: ResponsiveSize.h * 30,
                              padding: EdgeInsets.symmetric(
                                horizontal: ResponsiveSize.w * 11,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xffF9FAE5),
                              ),
                              child: Center(
                                child: TextWidget(
                                  color: AppColor.titleColor,
                                  text: 'اضغط هنا',
                                  fontSize: AppFontSize.extremeSmallTitle + 1,
                                  fontWeight:
                                      Appfontweight.very_extra_bold.font,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: ResponsiveSize.w * 90,
                                height: ResponsiveSize.h * 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
          // Transform.translate(
          //     offset: const Offset(10, 0),
          //     child: CustomStepper(
          //         steps: steps,
          //         title1: widget.steptitle1,
          //         title2: widget.steptitle2,
          //         content: widget.stepcontent)),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  fontSize: AppFontSize.extremeSmallTitle,
                  height: ResponsiveSize.h * 42,
                  centerContent: 'حجز استشارة',
                  onPressed: () {
                    Navigator.push(
                      context,
                      BottomToTopTransition(
                        DoctorProfile(
                          doctorFees: 'مجانا',
                          doctorFor: doctorFor,
                          doctorType: doctorType,
                        ),
                      ),
                    );
                  },
                ),
              ),
              10.width,
              Expanded(
                child: CustomButton(
                  fontSize: AppFontSize.extremeSmallTitle,
                  height: ResponsiveSize.h * 42,
                  buttonColor: AppColor.guestButtonColor,
                  centerContent: 'حجز جلسة اشرافية',
                  onPressed: () {
                    Navigator.push(
                      context,
                      BottomToTopTransition(
                        DoctorProfile(
                          doctorFees: '400',
                          doctorFor: doctorFor,
                          doctorType: doctorType,
                        ),
                      ),
                    );
                  },
                  textColor: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
