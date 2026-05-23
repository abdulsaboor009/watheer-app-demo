import 'package:flutter/material.dart';
import '../../widgets/screen_utils_size.dart';
import 'components/appbar.dart';
import 'the public courses/the_public_courses.dart';
import 'the registered courses/registered_courses.dart';
import 'the specialization courses/the_specialization_courses.dart';

class TrainingCoursesScreen extends StatefulWidget {
  const TrainingCoursesScreen({super.key});

  @override
  State<TrainingCoursesScreen> createState() => _TrainingCoursesScreenState();
}

class _TrainingCoursesScreenState extends State<TrainingCoursesScreen> {
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
  int selectedTab = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TrainingCoursesAppBar(
            onTabselected: (selectedTabIndex) {
              setState(() {
                selectedTab = selectedTabIndex;
              });
            },
          ),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 22),
                  child: Column(
                    children: [
                      if (selectedTab == 0)
                        ThePublicCourses(
                          isLoadData: isLoadDate,
                        ),
                      if (selectedTab == 1)
                        SpecializationCourses(
                          isLoadData: isLoadDate,
                        ),
                      if (selectedTab == 2)
                        TheRegisteredCourses(
                          isLoadData: isLoadDate,
                        ),
                    ],
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
