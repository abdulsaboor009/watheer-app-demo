import 'package:flutter/material.dart';
import 'package:watheer_demo/views/screens/doctor%20profile/components/select_date.dart';
import 'package:watheer_demo/views/screens/doctor%20profile/components/select_time.dart'
    show DoctorProfileSelectTime;
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../utils/appcolors.dart';
import '../../widgets/custom_btn.dart';
import 'components/header.dart';

class DoctorProfile extends StatelessWidget {
  final String doctorFees, doctorType, doctorFor;
  const DoctorProfile({
    super.key,
    required this.doctorFees,
    required this.doctorType,
    required this.doctorFor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DoctorprofileHeader(
              doctorType: doctorType,
              doctorFees: doctorFees,
              doctorFor: doctorFor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 22),
              child: Column(
                children: [
                  const DoctorProfileSelectDate(),
                  30.height,
                  const DoctorProfileSelectTime(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveSize.w * 22,
          vertical: ResponsiveSize.h * 20,
        ),
        child: CustomButton(
          buttonColor: AppColor.primaryColor,
          centerContent: 'حجز',
          onPressed: () {
            // bookAppointmentDiaglog(context);
            Navigator.pop(context);
          },
          isIcon: true,
          icon: Icon(
            Icons.arrow_back_rounded,
            size: ResponsiveSize.h * 20,
            color: AppColor.whiteColor,
          ),
        ),
      ),
    );
  }
}
