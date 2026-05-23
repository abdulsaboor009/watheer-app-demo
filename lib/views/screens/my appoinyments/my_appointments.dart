import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../models/training_course_model.dart';
import '../../../utils/appcolors.dart';
import '../../../utils/appfontsizes.dart';
import '../../../utils/appfontwight.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/screen_utils_size.dart';
import 'components/my_appointment_card.dart';

class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen> {
  List<TrainingCourseModel> allAppointments = [
    TrainingCourseModel('د. مرام الطويرقي', true),
    TrainingCourseModel('ايمان ابا حسن', false),
    TrainingCourseModel('فيرشلا هللا دبع', false),
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
        child: AppBarWidthTitle(title: 'مواعيدي'),
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 22),
            child: Column(
              children: [
                30.height,
                TextWidget(
                  textAlign: TextAlign.center,
                  color: AppColor.titleColor,
                  text:
                      'سيتم إلغاء الموعد بشكل تلقائي بعد 24 ساعة من حجز الموعد، في حال عدم استكمال اجراءات الدفع',
                  fontSize: AppFontSize.discription,
                  fontWeight: Appfontweight.bold.font,
                ),
                30.height,
                ...List.generate(
                  allAppointments.length,
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
                      child: MyAppointmentsCard(
                        doctorName: allAppointments[index].courseImage,
                        appointmentStatus: allAppointments[index].isExpired,
                        isLoadDate: isLoadDate,
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
