import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../models/training_course_model.dart';
import '../components/courses_card.dart';

// ignore: must_be_immutable
class ThePublicCourses extends StatelessWidget {
  bool isLoadData;
  ThePublicCourses({super.key, required this.isLoadData});
  List<TrainingCourseModel> publicCoursesList = [
    TrainingCourseModel(AppConstant.public_course1, false),
    TrainingCourseModel(AppConstant.public_course2, true),
    TrainingCourseModel(AppConstant.public_course3, true),
    TrainingCourseModel(AppConstant.public_course4, false),
    TrainingCourseModel(AppConstant.public_course5, true),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          30.height,
          ...List.generate(
            publicCoursesList.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                top: index == 0 ? 0 : ResponsiveSize.h * 16,
              ),
              child: Animate(
                effects: const [
                  FadeEffect(
                    duration: Duration(milliseconds: 900),
                    curve: Curves.easeInCirc,
                  ),
                  SlideEffect(
                    duration: Duration(milliseconds: 900),
                    curve: Curves.easeOutCubic,
                  ),
                ],
                child: CoursesCard(
                  courseImage: publicCoursesList[index].courseImage,
                  isExpired: publicCoursesList[index].isExpired,
                  isLoadDate: isLoadData,
                ),
              ),
            ),
          ),
          20.height,
        ],
      ),
    );
  }
}
