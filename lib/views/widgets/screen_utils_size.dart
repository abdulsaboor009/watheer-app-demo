// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ResponsiveSize {
//   static double get h => ScreenUtil().scaleHeight;
//   static double get w => ScreenUtil().scaleWidth;
//   static double setWidth(double size) => ScreenUtil().setWidth(size);
//   static double setHeight(double size) => ScreenUtil().setHeight(size);

//   // Access the screen util's setSp method for responsive font sizes
//   static double setSp(double fontSize) => ScreenUtil().setSp(fontSize);
// }

class ResponsiveSize {
  // Ab ye screen scaling nahi karega, sirf constant factor return karega
  static double get h => 0.8;
  static double get w => 0.99;

  // Direct value return (no scaling)
  static double setWidth(double size) => size;
  static double setHeight(double size) => size;

  // Font size bhi direct
  static double setSp(double fontSize) => fontSize;
}
