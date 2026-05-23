import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watheer_demo/models/country_code_picker_diaglog_model.dart';
import 'package:watheer_demo/utils/appconstant.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import '../../../../../utils/appcolors.dart';
import '../../../../../utils/appfontsizes.dart';
import '../../../../../utils/appfontwight.dart';

class GccCountryCodePickerDialog extends StatefulWidget {
  final Function(String) onValuePicked;
  const GccCountryCodePickerDialog({Key? key, required this.onValuePicked})
    : super(key: key);

  @override
  State<GccCountryCodePickerDialog> createState() =>
      _GccCountryCodePickerDialogState();
}

class _GccCountryCodePickerDialogState
    extends State<GccCountryCodePickerDialog> {
  final List<CountryCodePickerDiaglogModel> gccCountries = [
    CountryCodePickerDiaglogModel(
      AppConstant.saudi_arabia,
      'Saudi Arabia',
      '+966',
    ),
    CountryCodePickerDiaglogModel(
      AppConstant.united_arab_emirates,
      'United Arab Emirates',
      '+971',
    ),
    CountryCodePickerDiaglogModel(AppConstant.oman, 'Oman', '+968'),
    CountryCodePickerDiaglogModel(AppConstant.qatar, 'Qatar', '+974'),
    CountryCodePickerDiaglogModel(AppConstant.bahrain, 'Bahrain', '+973'),
    CountryCodePickerDiaglogModel(AppConstant.kuwait, 'Kuwait', '+965'),
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.none,
      actionsPadding: EdgeInsets.zero,
      backgroundColor: AppColor.whiteColor,
      elevation: 0,
      contentPadding: EdgeInsets.symmetric(
        horizontal: ResponsiveSize.w * 10,
        vertical: ResponsiveSize.h * 10,
      ),
      title: Center(
        child: Text(
          'Select Country',
          style: GoogleFonts.balooBhaijaan2(
            fontSize: AppFontSize.screenTitle,
            fontWeight: Appfontweight.bold.font,
            color: AppColor.titleColor,
          ),
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          itemCount: gccCountries.length,
          shrinkWrap: true,
          clipBehavior: Clip.none,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              splashColor: AppColor.primaryColor.withOpacity(0.2),
              highlightColor: AppColor.primaryColor.withOpacity(0.2),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  widget.onValuePicked(gccCountries[index].code);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveSize.w * 10,
                  vertical: ResponsiveSize.h * 15,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      gccCountries[index].flag,
                      height: ResponsiveSize.h * 30,
                    ),
                    10.width,
                    Text(
                      gccCountries[index].name,
                      style: GoogleFonts.balooBhaijaan2(
                        color: AppColor.titleColor,
                        fontSize: AppFontSize.discription,
                        fontWeight: Appfontweight.semi_bold.font,
                      ),
                    ),
                    8.width,
                    Text(
                      gccCountries[index].code,
                      style: GoogleFonts.balooBhaijaan2(
                        color: AppColor.titleColor,
                        fontSize: AppFontSize.discription,
                        fontWeight: Appfontweight.semi_bold.font,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
