import 'package:flutter/material.dart';
import '../../utils/appcolors.dart';
import '../../utils/appfontsizes.dart';
import '../../utils/appfontwight.dart';
import 'custom_text.dart';
import 'screen_utils_size.dart';

// ignore: must_be_immutable
class AppBarWidthTitle extends StatelessWidget {
  final String title;
  bool showBackIcon;
  AppBarWidthTitle({
    super.key,
    required this.title,
    this.showBackIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      height: ResponsiveSize.h * 100,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          showBackIcon
              ? Positioned(
                  left: ResponsiveSize.w * 10,
                  child: Padding(
                    padding: EdgeInsets.only(top: ResponsiveSize.h * 20),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: ResponsiveSize.h * 20,
                          color: AppColor.whiteColor,
                        )),
                  ),
                )
              : const SizedBox(),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: ResponsiveSize.h * 20, bottom: 0),
              child: SizedBox(
                width: 255,
                child: TextWidget(
                  textAlign: TextAlign.center,
                  color: AppColor.whitetext,
                  fontSize: AppFontSize.screenTitle,
                  fontWeight: Appfontweight.bold.font,
                  text: title,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
