import 'package:flutter/material.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../utils/appcolors.dart';
import 'custom_text.dart';
import 'screen_utils_size.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double borderRadius;
  final double height;
  final double width;
  final Color buttonColor;
  final String centerContent;
  final double borderwidth;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final bool isIcon;
  final Widget icon;
  final FontWeight fontWeight;

  const CustomButton({
    super.key,
    this.onPressed,
    this.borderRadius = 11.48,
    this.height = 55.16,
    this.width = double.infinity,
    this.buttonColor = AppColor.primaryColor,
    required this.centerContent,
    this.borderwidth = 0,
    this.borderColor = Colors.transparent,
    this.textColor = AppColor.whitetext,
    this.fontSize = 16,
    this.isIcon = false,
    this.icon = const SizedBox(),
    this.fontWeight = FontWeight.w900,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      clipBehavior: Clip.none,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      height: ResponsiveSize.h * height,
      minWidth: width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      color: null,
      child: Container(
        height: ResponsiveSize.h * height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: buttonColor,
          border: Border.all(color: borderColor, width: borderwidth),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isIcon ? icon : const SizedBox(),
              isIcon ? 6.width : 0.width,
              TextWidget(
                fontSize: ResponsiveSize.setSp(fontSize),
                fontWeight: fontWeight,
                text: centerContent,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
