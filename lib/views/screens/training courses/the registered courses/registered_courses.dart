import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../models/training_course_model.dart';
import '../../../../utils/appconstant.dart';
import '../../../widgets/screen_utils_size.dart';
import '../components/courses_card.dart';

// ignore: must_be_immutable
class TheRegisteredCourses extends StatelessWidget {
  bool isLoadData;
  TheRegisteredCourses({super.key, required this.isLoadData});
  List<TrainingCourseModel> registeredCoursesList = [
    TrainingCourseModel(AppConstant.registeredCourse1, false),
    TrainingCourseModel(AppConstant.registeredCourse2, false),
    TrainingCourseModel(AppConstant.registeredCourse3, true),
    TrainingCourseModel(AppConstant.registeredCourse4, false),
    TrainingCourseModel(AppConstant.registeredCourse5, false),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          30.height,
          ...List.generate(
            registeredCoursesList.length,
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
                  courseImage: registeredCoursesList[index].courseImage,
                  isExpired: registeredCoursesList[index].isExpired,
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
