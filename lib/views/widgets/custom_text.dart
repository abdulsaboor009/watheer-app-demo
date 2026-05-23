import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  String? text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  TextAlign? textAlign;
  double? letterSpacing;
  Paint? foreground;
  bool underLineText;
  TextWidget({
    super.key,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign = TextAlign.end,
    this.letterSpacing,
    this.foreground,
    this.underLineText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text!,
      style: GoogleFonts.ibmPlexSansArabic(
        // fontFamily: 'Almendra',
        decoration:
            underLineText ? TextDecoration.underline : TextDecoration.none,
        foreground: foreground,
        letterSpacing: letterSpacing,
        fontSize: fontSize!,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
