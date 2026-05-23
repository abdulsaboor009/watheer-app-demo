// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/screens/authentication/login/login_screen.dart';
import 'package:watheer_demo/views/widgets/navigation_transitions.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../models/onboarding_model.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/appfontsizes.dart';
import '../../../../utils/appfontwight.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/screen_utils_size.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  String currentTitle = '';
  String currentSubtitle = '';
  int currentPageIndex = 0;

  List<OnBoardingScreenModel> onBoardingList = [
    OnBoardingScreenModel(
      AppConstant.onboarding_1,
      'أطباء واستشاريين',
      'لتقديم العلاج الدوائي و الغير دوائي بمدارسه المختلفه كـ العلاج المعرفي السلوكي والعلاج بالتقبل والالتزام وغيرها من المدارس العلاجية مع طاقمنا المتميز',
    ),
    OnBoardingScreenModel(
      AppConstant.onboarding_2,
      'حجز العيادات والمواعيد',
      'آلية حجز مميزه وعيادات مجدوله معك اينما كنت لمساعدتك',
    ),
    OnBoardingScreenModel(
      AppConstant.onboarding_3,
      'التدريب والإشراف',
      'تقديم الإشراف والتدريب للمختصيين النفسيين من خلال توفير بيئة تعليمية وإشرافية وتدريبية لتطوير مهارتهم العيادية والعلاجية تحت إشراف أخصائيين مؤهلين وذو خبرة',
    ),
    OnBoardingScreenModel(
      AppConstant.onboarding_4,
      'وثير حيث تثق في أمان معلوماتك',
      'نضمن لك سلامة خصوصيتك وسرية وأمان معلوماتك بينك وبين المعالج الخاص بك',
    ),
  ];
  @override
  void initState() {
    super.initState();
    currentTitle = onBoardingList[currentPageIndex].title;
    currentSubtitle = onBoardingList[currentPageIndex].subtitle;
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        isImageAnimate = true;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Preload images
    for (var item in onBoardingList) {
      precacheImage(AssetImage(item.image), context);
    }
  }

  bool isImageAnimate = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentPageIndex > 0) {
          controller.previousPage(
            duration: const Duration(milliseconds: 800),
            curve: Curves.fastOutSlowIn,
          );
          isImageAnimate = false;
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: SizedBox(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  itemCount: onBoardingList.length,
                  clipBehavior: Clip.none,
                  onPageChanged: (int index) {
                    setState(() {
                      currentPageIndex = index;
                      currentTitle = onBoardingList[index].title;
                      currentSubtitle = onBoardingList[index].subtitle;
                      isImageAnimate = true;
                    });
                    // Preload next image
                    if (index < onBoardingList.length - 1) {
                      precacheImage(
                        AssetImage(onBoardingList[index + 1].image),
                        context,
                      );
                    }
                  },
                  itemBuilder: (_, index) {
                    return SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image.asset(
                            onBoardingList[index].image,
                            height: MediaQuery.of(context).size.height * 0.63,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.42,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveSize.w * 25,
                      vertical: ResponsiveSize.h * 25,
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: TextWidget(
                            textAlign: TextAlign.center,
                            color: AppColor.titleColor,
                            fontSize: AppFontSize.largetitle,
                            fontWeight: Appfontweight.bold.font,
                            text: currentTitle,
                          ),
                        ),
                        10.height,
                        Center(
                          child: TextWidget(
                            textAlign: TextAlign.center,
                            color: AppColor.subtitleColor,
                            fontSize: AppFontSize.sectiontitle + 2,
                            fontWeight: Appfontweight.medium.font,
                            text: currentSubtitle,
                          ),
                        ),
                        25.height,
                        const Spacer(),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: onBoardingList.length,
                            effect: WormEffect(
                              dotHeight: ResponsiveSize.h * 9,
                              dotWidth: 9,
                              activeDotColor: AppColor.primaryColor,
                              dotColor: const Color(0xffE5E5E5),
                            ),
                            onDotClicked: (index) {},
                          ),
                        ),
                        20.height,
                        CustomButton(
                          centerContent: currentPageIndex == 3
                              ? 'اهلا بك في وثير'
                              : 'التالي',
                          onPressed: currentPageIndex == 3
                              ? () {
                                  Navigator.push(
                                    context,
                                    RightToLeftTransition(const LoginScreen()),
                                  );
                                }
                              : () {
                                  controller.animateToPage(
                                    currentPageIndex + 1,
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.linearToEaseOut,
                                  );
                                  isImageAnimate = false;
                                },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
