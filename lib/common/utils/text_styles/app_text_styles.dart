// ignore_for_file: avoid_final_parameters

import 'package:fenix_mobile_case/common/constants/theme/app_themes.dart';
import 'package:fenix_mobile_case/common/utils/colors/app_light_colors.dart';
import 'package:fenix_mobile_case/common/utils/font_family/app_font_family.dart';
import 'package:fenix_mobile_case/common/utils/font_weight/app_font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle generate({
    final double? fontSize,
    final Color? color,
    final AppFontWeight? fontWeight,
    final TextDecoration? decoration,
    final AppFontFamily? fontFamily = AppFontFamily.SofiaPro,
  }) =>
      TextStyle(
        fontSize: fontSize?.sp ?? 12.sp,
        fontWeight: fontWeight?.value ?? AppFontWeight.regular.value,
        fontFamily: fontFamily!.value,
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
        color: color ?? AppLightColors.primaryWhite,
        decoration: decoration ?? TextDecoration.none,
      );
}
