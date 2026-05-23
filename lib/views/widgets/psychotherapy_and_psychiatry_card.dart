import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watheer_demo/utils/appcolors.dart';
import 'package:watheer_demo/views/screens/doctor%20profile/doctor_profile.dart';
import 'package:watheer_demo/views/widgets/navigation_transitions.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../utils/appfontsizes.dart';
import '../../utils/appfontwight.dart';
import 'custom_btn.dart';
import 'custom_stepper.dart';
import 'custom_text.dart';
import 'screen_utils_size.dart';

// ignore: must_be_immutable
class PsychotherapyAndPsychiatryCard extends StatelessWidget {
  final String doctorImage, doctorName, doctorFor, doctorType;
  bool isLoadData;
  PsychotherapyAndPsychiatryCard({
    super.key,
    required this.doctorImage,
    required this.doctorName,
    required this.doctorFor,
    required this.doctorType,
    required this.isLoadData,
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
            color: const Color(0xff8A959E).withOpacity(0.2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              isLoadData
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
              isLoadData
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
                4,
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
                    child: isLoadData
                        ? TextWidget(
                            color: AppColor.titleColor,
                            textAlign: TextAlign.start,
                            text:
                                'استشاري - الزمالة الكندية في الطب النفسي للأشخاص ذوي الصعوبات النمائية و التوحد في جميعمراحل العمر - شهادة',
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
                  child: isLoadData
                      ? Row(
                          children: [
                            TextWidget(
                              color: AppColor.titleColor,
                              text: 'التصنيف :',
                              fontSize: AppFontSize.extremeSmallTitle + 1,
                              fontWeight: Appfontweight.bold.font,
                            ),
                            18.width,
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'العلاج النفسي',
                                    style: GoogleFonts.ibmPlexSansArabic(
                                      // fontFamily: 'Almendra',
                                      color: AppColor.titleColor,
                                      fontSize:
                                          AppFontSize.extremeSmallTitle + 1,
                                      fontWeight:
                                          Appfontweight.very_extra_bold.font,
                                    ),
                                  ),
                                  TextSpan(
                                    style: GoogleFonts.ibmPlexSansArabic(
                                      // fontFamily: 'Almendra',
                                      color: const Color(0xff5451D6),
                                      fontSize:
                                          AppFontSize.extremeSmallTitle + 1,
                                      fontWeight:
                                          Appfontweight.very_extra_bold.font,
                                    ),
                                    text: '  $doctorFor',
                                  ),
                                ],
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
                  child: isLoadData
                      ? Row(
                          children: [
                            TextWidget(
                              color: AppColor.titleColor,
                              text: 'سعر موعد جديد :',
                              fontSize: AppFontSize.extremeSmallTitle + 1,
                              fontWeight: Appfontweight.bold.font,
                            ),
                            18.width,
                            TextWidget(
                              color: AppColor.titleColor,
                              text: '400',
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
                                width: ResponsiveSize.w * 90,
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
                  child: isLoadData
                      ? Row(
                          children: [
                            TextWidget(
                              color: AppColor.titleColor,
                              text: 'سعر موعد متابعة :',
                              fontSize: AppFontSize.extremeSmallTitle + 1,
                              fontWeight: Appfontweight.bold.font,
                            ),
                            18.width,
                            TextWidget(
                              color: AppColor.titleColor,
                              text: '200',
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
                                width: ResponsiveSize.w * 100,
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
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  fontSize: AppFontSize.extremeSmallTitle,
                  height: ResponsiveSize.h * 45,
                  buttonColor: AppColor.guestButtonColor,
                  centerContent: 'حجز موعد جديد',
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
              10.width,
              Expanded(
                child: CustomButton(
                  fontSize: AppFontSize.extremeSmallTitle,
                  height: ResponsiveSize.h * 45,
                  centerContent: 'حجز موعد متابعة',
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
