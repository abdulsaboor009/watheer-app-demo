import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watheer_demo/views/widgets/navigation_transitions.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../models/home_most_visited_model.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/appconstant.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_text.dart';
import '../../psychiatry doctors/psychiatry_screen.dart';
import '../../psychotherapy doctors/psychotherapy_screen.dart';
import 'psychological_and_other_services_card.dart';

// ignore: must_be_immutable
class HomePsychologicalServices extends StatelessWidget {
  bool isUserGuest;
  bool isLoadData;
  HomePsychologicalServices({
    super.key,
    this.isUserGuest = false,
    required this.isLoadData,
  });
  List<HomeMostVisitedModel> mentalHealthServices = [
    HomeMostVisitedModel(AppConstant.psychological_therapy, 'العلاج النفسي'),
    HomeMostVisitedModel(AppConstant.psychiatry, 'الطب النفسي'),
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
          fontWeight: Appfontweight.bold.font,
        ),
        20.height,
        ...List.generate(
          mentalHealthServices.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              top: index == 0 ? 0 : ResponsiveSize.h * 20,
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
              child: isLoadData
                  ? GestureDetector(
                      onTap: index == 0
                          ? () {
                              Navigator.push(
                                context,
                                RightToLeftTransition(
                                  const PsychotherapyScreen(),
                                ),
                              );
                            }
                          : () {
                              Navigator.push(
                                context,
                                RightToLeftTransition(const PsychiatryScreen()),
                              );
                            },
                      child: PsychologicalAndOtherServicesCard(
                        image: mentalHealthServices[index].image,
                        title: mentalHealthServices[index].name,
                      ),
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: ResponsiveSize.h * 116,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveSize.w * 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: ResponsiveSize.h * 92,
                                width: 96,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: AppColor.secondaryColor,
                                ),
                              ),
                              Container(
                                height: ResponsiveSize.h * 10,
                                width: ResponsiveSize.w * 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(),
                            ],
                          ),
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
