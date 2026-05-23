import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_text.dart';

class DoctorprofileHeader extends StatelessWidget {
  final String doctorFees, doctorType, doctorFor;
  const DoctorprofileHeader({
    super.key,
    required this.doctorFees,
    required this.doctorType,
    required this.doctorFor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          width: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                AppConstant.doctor_profile_header_img,
                height: 300,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned(
                top: 50,
                left: ResponsiveSize.w * 4,
                right: ResponsiveSize.w * 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: ResponsiveSize.h * 22,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    TextWidget(
                      textAlign: TextAlign.center,
                      color: AppColor.whitetext,
                      fontSize: AppFontSize.screenTitle,
                      fontWeight: Appfontweight.bold.font,
                      text: 'حجز موعد',
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 164,
                          width: ResponsiveSize.w * 285,
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(15.34),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 3.18),
                                blurRadius: 19.8,
                                spreadRadius: 0,
                                color: const Color(
                                  0xff8D8D8D,
                                ).withOpacity(0.10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 45),
                              TextWidget(
                                color: AppColor.blackColor,
                                fontSize: AppFontSize.screenTitle,
                                fontWeight: Appfontweight.very_extra_bold.font,
                                text: 'ايمان ابا حسن',
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          TextWidget(
                                            color: AppColor.subtitleColor,
                                            fontSize:
                                                AppFontSize.extremeSmallTitle +
                                                1,
                                            fontWeight: Appfontweight.bold.font,
                                            text: 'التصنيف',
                                          ),
                                          const SizedBox(height: 5),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '$doctorFor  ',
                                                  style: GoogleFonts.ibmPlexSansArabic(
                                                    // fontFamily: 'Almendra',
                                                    color: const Color(
                                                      0xff847AEF,
                                                    ),
                                                    fontSize:
                                                        AppFontSize
                                                            .extremeSmallTitle +
                                                        1,
                                                    fontWeight: Appfontweight
                                                        .normal
                                                        .font,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: doctorType,
                                                  style:
                                                      GoogleFonts.ibmPlexSansArabic(
                                                        // fontFamily: 'Almendra',
                                                        color: AppColor
                                                            .primaryColor,
                                                        fontSize: AppFontSize
                                                            .discription,
                                                        fontWeight:
                                                            Appfontweight
                                                                .bold
                                                                .font,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                    FDottedLine(
                                      color: AppColor.darkborderColor,
                                      height: 50,
                                      width: 1,
                                      space: 3,
                                    ),
                                    const SizedBox(width: 15),
                                    SizedBox(
                                      width: ResponsiveSize.w * 70,
                                      child: Column(
                                        children: [
                                          TextWidget(
                                            color: AppColor.subtitleColor,
                                            fontSize:
                                                AppFontSize.extremeSmallTitle +
                                                1,
                                            fontWeight: Appfontweight.bold.font,
                                            text: 'السعر',
                                          ),
                                          const SizedBox(height: 5),
                                          TextWidget(
                                            color: AppColor.primaryColor,
                                            fontSize: AppFontSize.discription,
                                            fontWeight: Appfontweight.bold.font,
                                            text: doctorFees,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 84,
                          width: 93,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(AppConstant.doctor_profile_img),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(9.59),
                            border: Border.all(
                              color: AppColor.whiteColor,
                              width: 2,
                            ),
                          ),
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
