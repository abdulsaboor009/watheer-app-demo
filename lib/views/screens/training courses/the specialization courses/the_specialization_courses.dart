import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../models/training_course_model.dart';
import '../../../../utils/appconstant.dart';
import '../../../widgets/screen_utils_size.dart';
import '../components/courses_card.dart';

// ignore: must_be_immutable
class SpecializationCourses extends StatelessWidget {
  bool isLoadData;
  SpecializationCourses({super.key, required this.isLoadData});
  List<TrainingCourseModel> specializationCoursesList = [
    TrainingCourseModel(AppConstant.specialization1, true),
    TrainingCourseModel(AppConstant.specialization2, true),
    TrainingCourseModel(AppConstant.specialization3, true),
    TrainingCourseModel(AppConstant.specialization4, false),
    TrainingCourseModel(AppConstant.specialization5, true),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          30.height,
          ...List.generate(
            specializationCoursesList.length,
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
                  courseImage: specializationCoursesList[index].courseImage,
                  isExpired: specializationCoursesList[index].isExpired,
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
