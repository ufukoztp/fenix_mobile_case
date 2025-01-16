// ignore_for_file: require_trailing_commas

import 'package:fenix_mobile_case/common/utils/colors/app_light_colors.dart';
import 'package:fenix_mobile_case/common/utils/font_weight/app_font_weight.dart';
import 'package:fenix_mobile_case/common/utils/text_styles/app_text_styles.dart';
import 'package:fenix_mobile_case/common/utils/text_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


final class AppThemes {
  static CustomTextTheme get textTheme => CustomTextTheme();


  static ThemeData get darkTheme => ThemeData.dark().copyWith(
    // ignore: deprecated_member_use
    useMaterial3: true,
    scaffoldBackgroundColor: AppLightColors.primaryBlack,
    primaryColorLight: AppLightColors.primaryPurple,
    secondaryHeaderColor: AppLightColors.primaryPurple,
    cardTheme: const CardTheme(
      color: AppLightColors.primaryWhite,
    ),

    primaryColor: AppLightColors.primaryPurple,
    buttonTheme: ButtonThemeData(
      buttonColor: AppLightColors.primaryPurple,
      textTheme: ButtonTextTheme.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppLightColors.primaryPurple,
        secondary: AppLightColors.purple80,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      color: AppLightColors.primaryBlack,
      titleTextStyle: AppTextStyles.generate(
          fontSize: 16.sp,
          fontWeight: AppFontWeight.medium,
          color: AppLightColors.dark1000),
      actionsIconTheme: const IconThemeData(
        color: AppLightColors.dark1000,
      ),
    ),
    textTheme: TextTheme(
      bodySmall: AppTextStyles.generate(
          fontSize: 8.sp,
          fontWeight: AppFontWeight.medium,
          color: AppLightColors.primaryWhite),
      bodyMedium: AppTextStyles.generate(
          fontSize: 12.sp,
          fontWeight: AppFontWeight.medium,
          color: AppLightColors.primaryWhite),
      bodyLarge: AppTextStyles.generate(
          fontSize: 18.sp,
          fontWeight: AppFontWeight.medium,
          color: AppLightColors.primaryWhite),
      labelSmall: AppTextStyles.generate(
          fontSize: 10.sp,
          fontWeight: AppFontWeight.medium,
          color: AppLightColors.primaryWhite),
      labelMedium: AppTextStyles.generate(
          fontSize: 14.sp,
          fontWeight: AppFontWeight.medium,
          color: AppLightColors.primaryWhite),
      labelLarge: AppTextStyles.generate(
          fontSize: 16.sp,
          fontWeight: AppFontWeight.medium,
          color: AppLightColors.primaryWhite),
      displaySmall: AppTextStyles.generate(
          fontSize: 10.sp,
          fontWeight: AppFontWeight.regular,
          color: AppLightColors.primaryWhite),
      displayMedium: AppTextStyles.generate(
          fontSize: 12.sp,
          fontWeight: AppFontWeight.regular,
          color: AppLightColors.primaryWhite),
      displayLarge: AppTextStyles.generate(
          fontSize: 14.sp,
          fontWeight: AppFontWeight.regular,
          color: AppLightColors.primaryWhite),
      titleSmall: AppTextStyles.generate(
          fontSize: 18.sp,
          fontWeight: AppFontWeight.medium,
          color: AppLightColors.primaryWhite),
      titleMedium: AppTextStyles.generate(
          fontSize: 22.sp,
          fontWeight: AppFontWeight.medium,
          color: AppLightColors.primaryWhite),
      titleLarge: AppTextStyles.generate(
          fontSize: 30.sp,
          fontWeight: AppFontWeight.medium,
          color: AppLightColors.primaryWhite),
    ),

    iconTheme: const IconThemeData(color: AppLightColors.primaryWhite),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppLightColors.primaryWhite,
      // selectedItemColor: AppLightColors.dark1000,
      // unselectedItemColor: AppLightColors.dark1000,
    ),
    colorScheme: ColorScheme.dark(
      primary: AppLightColors.primaryPurple,
      secondary: AppLightColors.primaryPurple,
      tertiary: AppLightColors.purple80,
      secondaryContainer: AppLightColors.purple20
          .withOpacity(.2), //Label renkleri (fiyat, etiket)
    ).copyWith(surface: AppLightColors.primaryWhite),
  );

}
