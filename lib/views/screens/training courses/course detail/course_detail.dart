import 'package:flutter/material.dart';
import 'package:watheer_demo/views/screens/training%20courses/course%20detail/components/course_info.dart';
import 'package:watheer_demo/views/widgets/custom_btn.dart';
import '../../../../utils/appcolors.dart';
import '../../../widgets/screen_utils_size.dart';
import 'components/header.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            const CourseDetailHeader(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CourseDetailInfo(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveSize.w * 22,
                  vertical: ResponsiveSize.h * 20,
                ),
                child: CustomButton(
                  buttonColor: AppColor.primaryColor,
                  centerContent: 'الانضمام للدورة',
                  onPressed: () {
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
            ),
          ],
        ),
      ),
    );
  }
}
