import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watheer_demo/views/screens/training%20courses/training_courses.dart';
import 'package:watheer_demo/views/screens/training%20doctors/training_doctors.dart';
import 'package:watheer_demo/views/widgets/navigation_transitions.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../models/home_most_visited_model.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/appconstant.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_text.dart';
import 'psychological_and_other_services_card.dart';

// ignore: must_be_immutable
class HomeOtherServices extends StatelessWidget {
  bool isUserGuest;
  bool isLoadData;
  HomeOtherServices({
    super.key,
    this.isUserGuest = false,
    required this.isLoadData,
  });
  List<HomeMostVisitedModel> otherServices = [
    HomeMostVisitedModel(
      AppConstant.psychological_therapy,
      'الدورات التدريبية',
    ),
    HomeMostVisitedModel(AppConstant.psychiatry, 'التدريب والإشراف'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextWidget(
          text: 'اختر الخدمة',
          color: AppColor.titleColor,
          fontSize: AppFontSize.sectiontitle + 2,
          fontWeight: Appfontweight.semi_bold.font,
        ),
        20.height,
        ...List.generate(
          otherServices.length,
          (index) => Animate(
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
            child: Padding(
              padding: EdgeInsets.only(
                top: index == 0 ? 0 : ResponsiveSize.h * 20,
              ),
              child: isLoadData
                  ? GestureDetector(
                      onTap: index == 0
                          ? () {
                              Navigator.push(
                                context,
                                RightToLeftTransition(
                                  const TrainingCoursesScreen(),
                                ),
                              );
                              // trainingCoursesPoliciesDiaglog(context);
                            }
                          : () {
                              Navigator.push(
                                context,
                                RightToLeftTransition(const TrainingDoctors()),
                              );
                              // trainingAndSupervisionPolicyDiaglog(context);
                            },
                      child: PsychologicalAndOtherServicesCard(
                        image: otherServices[index].image,
                        title: otherServices[index].name,
                      ),
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: ResponsiveSize.h * 116,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
