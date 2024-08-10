import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/style/app_colors.dart";

@immutable
class AppTextStyle extends TextTheme {
  const AppTextStyle();

  @override
  TextStyle? get displayLarge => TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: FontSize.size96,
        letterSpacing: -1.5,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get displayMedium => TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: FontSize.size60,
        letterSpacing: -0.5,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get displaySmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size48,
        letterSpacing: 0,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get headlineMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size34,
        letterSpacing: 0.25,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get headlineSmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size24,
        letterSpacing: 0,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get titleLarge => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size20,
        letterSpacing: 0.15,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get titleMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size16,
        letterSpacing: 0.15,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get titleSmall => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size14,
        letterSpacing: 0.1,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get bodyLarge => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size16,
        letterSpacing: 0.5,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get bodyMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        letterSpacing: 0.25,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get bodySmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size12,
        letterSpacing: 0.4,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get labelLarge => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size14,
        letterSpacing: 1.25,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get labelSmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size10,
        letterSpacing: 1.5,
        fontFamily: "Poppins",
        color: AppColors.white,
      );
}

@immutable
class FontSize {
  const FontSize._();

  static double size8 = 8.sp;
  static double size10 = 10.sp;
  static double size11 = 11.sp;
  static double size12 = 12.sp;
  static double size14 = 14.sp;
  static double size16 = 16.sp;
  static double size18 = 18.sp;
  static double size20 = 20.sp;
  static double size24 = 24.sp;
  static double size34 = 34.sp;
  static double size48 = 48.sp;
  static double size60 = 60.sp;
  static double size96 = 96.sp;
}
