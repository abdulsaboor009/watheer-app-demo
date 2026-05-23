import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../widgets/appbar.dart';
import 'components/purchased_courses_card.dart';

class PurchasesCourses extends StatefulWidget {
  const PurchasesCourses({super.key});

  @override
  State<PurchasesCourses> createState() => _PurchasesCoursesState();
}

class _PurchasesCoursesState extends State<PurchasesCourses> {
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!_isDisposed) {
      setState(() {
        isLoadDate = true;
      });
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  bool isLoadDate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ResponsiveSize.h * 100),
        child: AppBarWidthTitle(title: 'الدورات التدريبية'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 22),
          child: Column(
            children: [
              30.height,
              ...List.generate(
                1,
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
                    child: isLoadDate
                        ? InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   BottomToTopTransition(
                              //     const PurchasedCourseDetailScreen(),
                              //   ),
                              // );
                            },
                            child: const PurchasedCoursesCard(),
                          )
                        : Directionality(
                            textDirection: TextDirection.rtl,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: ResponsiveSize.w * 15,
                              ),
                              child: Row(
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      height: ResponsiveSize.h * 67,
                                      width: 67,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          15.87,
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  20.width,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey.shade300,
                                          highlightColor: Colors.grey.shade100,
                                          child: Container(
                                            width: ResponsiveSize.w * 70,
                                            height: ResponsiveSize.h * 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                        8.height,
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey.shade300,
                                          highlightColor: Colors.grey.shade100,
                                          child: Container(
                                            width: double.infinity,
                                            height: ResponsiveSize.h * 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
