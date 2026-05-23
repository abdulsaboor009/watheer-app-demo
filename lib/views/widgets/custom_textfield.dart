import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import '../../utils/appcolors.dart';
import '../../utils/appfontsizes.dart';
import '../../utils/appfontwight.dart';

Widget customTextfield({
  TextEditingController? controller,
  String? hint,
  bool? isobscure = false,
  double height = 55.16,
  Widget? prefixWidget,
  Widget? suffixWidget,
  Function? onFieldSubmitted,
  Function? onChanged,
  bool onChangedbool = false,
  double contentVerticlePadding = 15,
  String? Function(String?)? onValidator,
  // bool validator = false,
  TextInputType? keyboardType,
  int maxline = 1,
  Color fillColor = AppColor.textFieldfillColor,
  double borderWidth = 1.5,
  Color borderColor = AppColor.textfieldBorderColor,
  double borderRadius = 12,
  Color hintTextColor = AppColor.textfieldhintColor,
  bool enabled = true,
}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: SizedBox(
      // height: ResponsiveSize.h * height,
      width: double.infinity,
      child: TextFormField(
        enabled: enabled,
        validator: onValidator,
        onChanged: (v) {
          onChangedbool ? onChanged!(v) : (v) {};
        },
        maxLines: maxline,
        keyboardType: keyboardType,
        style: GoogleFonts.ibmPlexSansArabic(
          // fontFamily: 'Almendra',
          color: AppColor.titleColor,
          fontSize: AppFontSize.discription,
          fontWeight: Appfontweight.medium.font,
        ),
        controller: controller,
        textAlign: TextAlign.start,
        obscureText: isobscure!,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: ResponsiveSize.w * 16,
            vertical: ResponsiveSize.h * contentVerticlePadding,
          ),
          hintStyle: GoogleFonts.ibmPlexSansArabic(
            // fontFamily: 'Almendra',
            fontSize: AppFontSize.discription,
            color: hintTextColor,
            fontWeight: Appfontweight.normal.font,
          ),
          hintText: hint,
          fillColor: fillColor,
          filled: true,
          prefixIcon: prefixWidget,
          suffixIcon: suffixWidget,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(borderRadius),
          //   borderSide: BorderSide(color: borderColor, width: borderWidth),
          // ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          errorStyle: GoogleFonts.ibmPlexSansArabic(
            // fontFamily: 'Almendra',
            color: Colors.red,
            fontSize: AppFontSize.extremeSmallTitle,
            fontWeight: Appfontweight.normal.font,
          ),
        ),
      ),
    ),
  );
}
