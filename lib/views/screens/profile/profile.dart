import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

// ignore: must_be_immutable
class UserProfile extends StatelessWidget {
  UserProfile({super.key});
  TextEditingController userNameController = TextEditingController(
    text: 'ايمان ابا حسن',
  );
  TextEditingController userEmailController = TextEditingController(
    text: 'ايمان ابا حسن@gmail.com',
  );
  TextEditingController userPhoneNumberController = TextEditingController(
    text: '3127984597 966+',
  );
  TextEditingController userIdNumberController = TextEditingController(
    text: '#34698523',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ResponsiveSize.h * 100),
        child: AppBarWidthTitle(title: 'معلوماتي'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              40.height,
              Center(
                child: TextWidget(
                  text: 'المعلومات الشخصية',
                  color: AppColor.titleColor,
                  fontSize: AppFontSize.sectiontitle + 1,
                  fontWeight: Appfontweight.very_extra_bold.font,
                ),
              ),
              20.height,
              customTextfield(
                controller: userNameController,
                contentVerticlePadding: 22,
                suffixWidget: SizedBox(
                  width: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(AppConstant.edit),
                  ),
                ),
                hint: 'ايمان ابا حسن',
                prefixWidget: Container(
                  margin: EdgeInsets.only(
                    left: ResponsiveSize.w * 8,
                    right: ResponsiveSize.w * 14,
                  ),
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor.withOpacity(0.15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(AppConstant.user),
                  ),
                ),
              ),
              20.height,
              customTextfield(
                controller: userEmailController,
                contentVerticlePadding: 22,
                suffixWidget: SizedBox(
                  width: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(AppConstant.edit),
                  ),
                ),
                hint: 'ايمان ابا حسن@gmail.com',
                prefixWidget: Container(
                  margin: EdgeInsets.only(
                    left: ResponsiveSize.w * 8,
                    right: ResponsiveSize.w * 14,
                  ),
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor.withOpacity(0.15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(AppConstant.email),
                  ),
                ),
              ),
              20.height,
              customTextfield(
                controller: userPhoneNumberController,
                contentVerticlePadding: 22,
                enabled: false,
                hint: '3127984597 +966 ',
                prefixWidget: Container(
                  margin: EdgeInsets.only(
                    left: ResponsiveSize.w * 8,
                    right: ResponsiveSize.w * 14,
                  ),
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor.withOpacity(0.15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(AppConstant.phone),
                  ),
                ),
              ),
              20.height,
              customTextfield(
                controller: userIdNumberController,
                contentVerticlePadding: 22,
                enabled: false,
                hint: '#34698523',
                prefixWidget: Container(
                  margin: EdgeInsets.only(
                    left: ResponsiveSize.w * 8,
                    right: ResponsiveSize.w * 14,
                  ),
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor.withOpacity(0.15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(AppConstant.id),
                  ),
                ),
              ),
              35.height,
              CustomButton(
                centerContent: 'حفظ التغييرات',
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
