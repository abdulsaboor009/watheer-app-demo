import 'package:flutter/material.dart';
import 'package:watheer_demo/views/widgets/custom_btn.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../utils/appcolors.dart';
import '../../../utils/appconstant.dart';
import '../../../utils/appfontsizes.dart';
import '../../../utils/appfontwight.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/screen_utils_size.dart';
import 'components/message_sent_diaglog.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ResponsiveSize.h * 100),
        child: AppBarWidthTitle(title: 'تواصل معنا'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              30.height,
              Center(
                child: TextWidget(
                  color: AppColor.titleColor,
                  text: 'رأيك يهمنا',
                  fontSize: AppFontSize.sectiontitle + 1,
                  fontWeight: Appfontweight.very_extra_bold.font,
                ),
              ),
              20.height,
              customTextfield(
                hint: 'الاسم',
                prefixWidget: SizedBox(
                  width: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(AppConstant.user),
                  ),
                ),
              ),
              20.height,
              customTextfield(
                hint: 'رقم الجوال',
                keyboardType: TextInputType.number,
                prefixWidget: SizedBox(
                  width: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(AppConstant.phone),
                  ),
                ),
              ),
              20.height,
              SizedBox(
                height: ResponsiveSize.h * 240,
                child: customTextfield(
                  maxline: 11,
                  hint: 'رسالتك',
                  prefixWidget: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: ResponsiveSize.h * 14),
                        child: SizedBox(
                          width: 25,
                          child: Image.asset(AppConstant.drawer_item5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              35.height,
              CustomButton(
                centerContent: 'ارسال',
                onPressed: () {
                  contactUsMessageSentDiaglog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
