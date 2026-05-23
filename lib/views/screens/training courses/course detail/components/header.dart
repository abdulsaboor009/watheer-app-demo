import 'package:flutter/material.dart';
import 'package:watheer_demo/utils/appcolors.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';

class CourseDetailHeader extends StatelessWidget {
  const CourseDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppConstant.course_detail_img),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: ResponsiveSize.h * 55,
            left: ResponsiveSize.w * 22,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: ResponsiveSize.h * 46,
                width: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.86),
                  color: AppColor.primaryColor,
                  border: Border.all(color: AppColor.whiteColor, width: 1),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: ResponsiveSize.h * 22,
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
