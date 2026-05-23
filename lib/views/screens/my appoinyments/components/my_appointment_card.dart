import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_stepper.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/navigation_transitions.dart';
import '../../../widgets/screen_utils_size.dart';
import 'cancel_appointment_diaglog.dart';

// ignore: must_be_immutable
class MyAppointmentsCard extends StatelessWidget {
  final String doctorName;
  bool appointmentStatus;
  bool isLoadDate = false;
  MyAppointmentsCard({
    super.key,
    required this.doctorName,
    this.appointmentStatus = false,
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
            color: const Color(0xff8A959E).withOpacity(0.2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ResponsiveSize.h * 15,
                  ),
                  child: isLoadDate
                      ? Row(
                          children: [
                            TextWidget(
                              color: AppColor.titleColor,
                              text: 'اسم الطبيب :',
                              fontSize: AppFontSize.extremeSmallTitle + 1,
                              fontWeight: Appfontweight.bold.font,
                            ),
                            18.width,
                            TextWidget(
                              color: AppColor.titleColor,
                              text: doctorName,
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
                                width: ResponsiveSize.w * 130,
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
                              text: 'الموعد :',
                              fontSize: AppFontSize.extremeSmallTitle + 1,
                              fontWeight: Appfontweight.bold.font,
                            ),
                            18.width,
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: TextWidget(
                                color: AppColor.titleColor,
                                text: '2023/09/14 - 2:00 pm',
                                fontSize: AppFontSize.extremeSmallTitle + 1,
                                fontWeight: Appfontweight.very_extra_bold.font,
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
                                width: ResponsiveSize.w * 160,
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
                              text: 'حالة الموعد :',
                              fontSize: AppFontSize.extremeSmallTitle + 1,
                              fontWeight: Appfontweight.bold.font,
                            ),
                            18.width,
                            TextWidget(
                              color: appointmentStatus
                                  ? const Color(0xff5451D6)
                                  : const Color(0xffDA4A54),
                              text: appointmentStatus ? 'مؤكد' : 'غير مدفوع',
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
          appointmentStatus
              ? CustomButton(
                  fontSize: AppFontSize.extremeSmallTitle,
                  height: ResponsiveSize.h * 42,
                  centerContent: 'حضور الجلسه',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     BottomToTopTransition(DoctorProfile(
                    //       doctorFees: '400',
                    //       doctorFor: doctorFor,
                    //       doctorType: doctorType,
                    //     )));
                  },
                )
              : Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        fontSize: AppFontSize.extremeSmallTitle,
                        height: ResponsiveSize.h * 42,
                        centerContent: 'إلغاء الموعد',
                        onPressed: () {
                          cancelAppointMentDiaglog(context);
                        },
                      ),
                    ),
                    10.width,
                    Expanded(
                      child: CustomButton(
                        fontSize: AppFontSize.extremeSmallTitle,
                        height: ResponsiveSize.h * 42,
                        buttonColor: AppColor.guestButtonColor,
                        centerContent: 'الدفع',
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   BottomToTopTransition(
                          //     const JoinCoursePaymentConfirmation(),
                          //   ),
                          // );
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
