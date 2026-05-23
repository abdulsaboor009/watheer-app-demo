import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/widgets/psychotherapy_and_psychiatry_card.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../models/home_most_visited_model.dart';
import '../../widgets/appbar.dart';
import '../../widgets/screen_utils_size.dart';

class PsychotherapyScreen extends StatefulWidget {
  const PsychotherapyScreen({super.key});

  @override
  State<PsychotherapyScreen> createState() => _PsychotherapyScreenState();
}

class _PsychotherapyScreenState extends State<PsychotherapyScreen> {
  List<HomeMostVisitedModel> doctors = [
    HomeMostVisitedModel(AppConstant.doctor1, 'ايمان ابا حسن'),
    HomeMostVisitedModel(AppConstant.doctor2, 'محمد ال جعفر'),
    HomeMostVisitedModel(AppConstant.doctor3, 'مرام الطويرقي'),
  ];
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
        child: AppBarWidthTitle(title: 'اختر المعالج'),
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 22),
            child: Column(
              children: [
                30.height,
                ...List.generate(
                  doctors.length,
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
                      child: PsychotherapyAndPsychiatryCard(
                        doctorImage: doctors[index].image,
                        doctorName: doctors[index].name,
                        doctorFor: index == 1 ? '(أطفال)' : '(بالغين)',
                        doctorType: 'العلاج النفسي',
                        isLoadData: isLoadDate,
                      ),
                    ),
                  ),
                ),
                20.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
