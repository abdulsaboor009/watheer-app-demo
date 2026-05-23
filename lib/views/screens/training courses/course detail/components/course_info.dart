import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watheer_demo/utils/appcolors.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../../utils/appfontsizes.dart';
import '../../../../../utils/appfontwight.dart';
import '../../../../widgets/custom_text.dart';

class CourseDetailInfo extends StatelessWidget {
  const CourseDetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.57,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: AppColor.whiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveSize.w * 22,
            vertical: ResponsiveSize.h * 25,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: TextWidget(
                    text: 'التعامل مع مشكلات ال',
                    color: AppColor.titleColor,
                    fontSize: AppFontSize.sectiontitle + 2,
                    fontWeight: Appfontweight.very_extra_bold.font,
                  ),
                ),
                15.height,
                Row(
                  children: [
                    TextWidget(
                      text: 'التاريخ :',
                      color: AppColor.titleColor,
                      fontSize: AppFontSize.extremeSmallTitle,
                      fontWeight: Appfontweight.bold.font,
                    ),
                    14.width,
                    TextWidget(
                      text: '20-12-2023',
                      color: AppColor.titleColor,
                      fontSize: AppFontSize.extremeSmallTitle + 1,
                      fontWeight: Appfontweight.very_extra_bold.font,
                    ),
                  ],
                ),
                5.height,
                Row(
                  children: [
                    TextWidget(
                      text: 'المقدم :',
                      color: AppColor.titleColor,
                      fontSize: AppFontSize.extremeSmallTitle,
                      fontWeight: Appfontweight.bold.font,
                    ),
                    14.width,
                    TextWidget(
                      text: 'البروفيسور فاطمة الحيدر',
                      color: AppColor.titleColor,
                      fontSize: AppFontSize.extremeSmallTitle + 1,
                      fontWeight: Appfontweight.very_extra_bold.font,
                    ),
                  ],
                ),
                15.height,
                Container(
                  padding: EdgeInsets.symmetric(vertical: ResponsiveSize.h * 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColor.darkborderColor,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'السعر ',
                                  style: GoogleFonts.ibmPlexSansArabic(
                                    // fontFamily: 'Almendra',
                                    color: AppColor.primaryColor,
                                    fontSize: AppFontSize.discription,
                                    fontWeight: Appfontweight.bold.font,
                                  ),
                                ),
                                TextSpan(
                                  text: ': 50.00',
                                  style: GoogleFonts.ibmPlexSansArabic(
                                    // fontFamily: 'Almendra',
                                    color: AppColor.subtitleColor,
                                    fontSize: AppFontSize.extremeSmallTitle,
                                    fontWeight:
                                        Appfontweight.very_extra_bold.font,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ResponsiveSize.h * 40,
                        child: const VerticalDivider(
                          color: AppColor.darkborderColor,
                          thickness: 1,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '07:30 pm : ',
                                    style: GoogleFonts.ibmPlexSansArabic(
                                      // fontFamily: 'Almendra',
                                      color: AppColor.subtitleColor,
                                      fontSize: AppFontSize.extremeSmallTitle,
                                      fontWeight:
                                          Appfontweight.very_extra_bold.font,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'الوقت ',
                                    style: GoogleFonts.ibmPlexSansArabic(
                                      // fontFamily: 'Almendra',
                                      color: AppColor.primaryColor,
                                      fontSize: AppFontSize.discription,
                                      fontWeight: Appfontweight.bold.font,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ResponsiveSize.h * 40,
                        child: const VerticalDivider(
                          color: AppColor.darkborderColor,
                          thickness: 1,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'المده ',
                                  style: GoogleFonts.ibmPlexSansArabic(
                                    // fontFamily: 'Almendra',
                                    color: AppColor.primaryColor,
                                    fontSize: AppFontSize.discription,
                                    fontWeight: Appfontweight.bold.font,
                                  ),
                                ),
                                TextSpan(
                                  text: ': 2',
                                  style: GoogleFonts.ibmPlexSansArabic(
                                    // fontFamily: 'Almendra',
                                    color: AppColor.subtitleColor,
                                    fontSize: AppFontSize.extremeSmallTitle,
                                    fontWeight:
                                        Appfontweight.very_extra_bold.font,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                25.height,
                TextWidget(
                  text: 'الاهداف',
                  color: AppColor.titleColor,
                  fontSize: AppFontSize.sectiontitle,
                  fontWeight: Appfontweight.very_extra_bold.font,
                ),
                10.height,
                TextWidget(
                  textAlign: TextAlign.start,
                  text:
                      'معنى التواصل مع الآخرين وأهميته طرق تفكير تعطل التواصل مع الآخرين طرق التواصل غير الفعالة مع الاخرينالمائة. النفسية التواصل',
                  color: AppColor.subtitleColor,
                  fontSize: AppFontSize.discription,
                  fontWeight: Appfontweight.bold.font,
                ),
                80.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
