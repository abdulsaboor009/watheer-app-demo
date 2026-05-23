import 'package:flutter/material.dart';
import 'package:watheer_demo/utils/appcolors.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../utils/appconstant.dart';
import '../../../utils/appfontsizes.dart';
import '../../../utils/appfontwight.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/screen_utils_size.dart';

class EmptyAppointmentScreen extends StatelessWidget {
  const EmptyAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.25),
        Center(
          child: Image.asset(
            AppConstant.no_time_for_appointment,
            height: ResponsiveSize.h * 200,
          ),
        ),
        35.height,
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 30),
            child: TextWidget(
              textAlign: TextAlign.center,
              color: AppColor.titleColor,
              text:
                  'سيتم إلغاء الموعد بشكل تلقائي بعد 24 ساعة من حجز الموعد، في حال عدم استكمال اجراءات الدفع',
              fontSize: AppFontSize.sectiontitle,
              fontWeight: Appfontweight.bold.font,
            ),
          ),
        ),
      ],
    );
  }
}
