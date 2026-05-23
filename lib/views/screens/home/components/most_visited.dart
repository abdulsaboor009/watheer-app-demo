import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../models/home_most_visited_model.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_text.dart';

// ignore: must_be_immutable
class MostVisited extends StatelessWidget {
  bool isUserGuest;
  bool isLoadData;
  MostVisited({super.key, this.isUserGuest = false, required this.isLoadData});
  List<HomeMostVisitedModel> doctors = [
    HomeMostVisitedModel(AppConstant.most_visited_1, 'مرام الطويرقي'),
    HomeMostVisitedModel(AppConstant.most_visited_2, 'ايمان ابا حسن'),
    HomeMostVisitedModel(AppConstant.most_visited_3, 'محمد ال جعفر'),
    HomeMostVisitedModel(AppConstant.most_visited_1, 'فيرشلا هللا دبع'),
    HomeMostVisitedModel(AppConstant.most_visited_2, 'ايمان ابا حسن'),
    HomeMostVisitedModel(AppConstant.most_visited_3, 'محمد ال جعفر'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        25.height,
        TextWidget(
          text: 'الأكثر زيارة',
          color: AppColor.titleColor,
          fontSize: AppFontSize.sectiontitle + 2,
          fontWeight: Appfontweight.bold.font,
        ),
        20.height,
        SizedBox(
          height: ResponsiveSize.h * 100,
          child: ListView.builder(
            itemCount: doctors.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            reverse: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index == 0 ? 0 : ResponsiveSize.w * 25,
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
                      ? Column(
                          children: [
                            Container(
                              height: ResponsiveSize.h * 71,
                              width: 78,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(doctors[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            5.height,
                            TextWidget(
                              text: doctors[index].name,
                              color: AppColor.subtitleColor,
                              fontSize: AppFontSize.extraSmalldiscription,
                              fontWeight: Appfontweight.normal.font,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: ResponsiveSize.h * 71,
                                width: 78,
                                color: Colors.white,
                              ),
                            ),
                            5.height,
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                color: Colors.white,
                                height: ResponsiveSize.h * 10,
                                width: 78,
                              ),
                            ),
                          ],
                        ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
