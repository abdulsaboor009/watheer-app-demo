import 'package:flutter/material.dart';
import 'package:watheer_demo/models/navigation_drawer_social_media_model.dart';
import '../../../../utils/appconstant.dart';
import '../../../widgets/screen_utils_size.dart';

// ignore: must_be_immutable
class NavigationDrawerSocialMediaLinks extends StatelessWidget {
  NavigationDrawerSocialMediaLinks({super.key});
  List<NavigationDrawerSocialMediaModel> socialMediaLinks = [
    NavigationDrawerSocialMediaModel(
      AppConstant.whatsapp,
      const Color(0xff25D366),
    ),
    NavigationDrawerSocialMediaModel(
      AppConstant.instagram,
      const Color(0xffF00073),
    ),
    NavigationDrawerSocialMediaModel(
      AppConstant.twitter,
      const Color(0xff1DA1F2),
    ),
    NavigationDrawerSocialMediaModel(
      AppConstant.snapchat,
      const Color(0xffF7F400),
    ),
    NavigationDrawerSocialMediaModel(
      AppConstant.tiktok,
      const Color(0xff000000),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      clipBehavior: Clip.none,
      runAlignment: WrapAlignment.start,
      runSpacing: ResponsiveSize.h * 16,
      spacing: ResponsiveSize.w * 16,
      children: List.generate(
        socialMediaLinks.length,
        (index) => Container(
          height: ResponsiveSize.h * 40,
          width: ResponsiveSize.w * 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: socialMediaLinks[index].color,
          ),
          child: Center(
            child: Transform.scale(
              scale: socialMediaLinks[index].image == AppConstant.twitter
                  ? 1
                  : 1.4,
              child: Image.asset(
                socialMediaLinks[index].image,
                height: ResponsiveSize.h * 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
