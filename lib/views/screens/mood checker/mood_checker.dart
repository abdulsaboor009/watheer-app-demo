import 'package:flutter/material.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../models/mode_checker_model.dart';
import '../../../utils/appcolors.dart';
import '../../../utils/appfontsizes.dart';
import '../../../utils/appfontwight.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/screen_utils_size.dart';
import 'components/mood_checker_card.dart';

// ignore: must_be_immutable
class MoodCheckerScreen extends StatefulWidget {
  const MoodCheckerScreen({super.key});

  @override
  State<MoodCheckerScreen> createState() => _MoodCheckerScreenState();
}

class _MoodCheckerScreenState extends State<MoodCheckerScreen> {
  List<MoodCheckerModel> moods = [
    MoodCheckerModel(
      AppConstant.laziness,
      'كسل وخمول',
      const Color(0xff949599),
    ),
    MoodCheckerModel(AppConstant.stress, 'توتر وقلق', const Color(0xffFDC114)),
    MoodCheckerModel(AppConstant.panic, 'نوبه هلع', const Color(0xff88B24E)),
    MoodCheckerModel(AppConstant.sadness, 'حزن', const Color(0xffF57E21)),
  ];
  int selectedMood = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ResponsiveSize.h * 100),
        child: AppBarWidthTitle(title: 'مزاجك؟'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              55.height,
              TextWidget(
                color: AppColor.titleColor,
                fontSize: AppFontSize.sectiontitle + 1,
                fontWeight: Appfontweight.bold.font,
                text: 'كيف تشعر اليوم؟',
              ),
              35.height,
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: ResponsiveSize.w * 16,
                  mainAxisSpacing: ResponsiveSize.h * 16,
                  mainAxisExtent: ResponsiveSize.h * 165,
                ),
                itemCount: moods.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedMood = index;
                      });
                    },
                    child: MoodCheckerCard(
                      moodName: moods[index].moodName,
                      moodImage: moods[index].moodImage,
                      moodColor: moods[index].moodColor,
                      isSelectedMood: selectedMood == index ? true : false,
                    ),
                  );
                },
              ),
              57.height,
              Center(
                child: TextWidget(
                  textAlign: TextAlign.center,
                  color: AppColor.titleColor,
                  fontSize: AppFontSize.screenTitle,
                  fontWeight: Appfontweight.bold.font,
                  text: selectedMood < 0
                      ? ''
                      : 'للتعامل مع نوبات الهلع تنفس بعمق وتهدئة النفس بالتفكير في أن نوبة الهلع حالة ليست خطيرة',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
