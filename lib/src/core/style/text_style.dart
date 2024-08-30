import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/style/color_schema.dart";
import "package:nutrition/src/core/widgets/app_material_context.dart";

@immutable
class AppTextStyle extends TextTheme {
  const AppTextStyle();

  @override
  TextStyle? get displayLarge => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size30, ///
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.surfaceDim : darkColorScheme.surfaceDim,
      ); /// If you have problem or any question with displayLarge tell me! Abdulloh Muminov.

  @override
  TextStyle? get displayMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size20, ///
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.onSurface : darkColorScheme.onSurface,
      ); /// If you have problem or any question with displayMedium tell me! Abdulloh Muminov.

  @override
  TextStyle? get displaySmall => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size11, ///
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.surfaceBright : darkColorScheme.surfaceBright,
      ); /// If you have problem or any question with displaySmall tell me! Abdulloh Muminov.

  @override
  TextStyle? get headlineMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.onSurface : darkColorScheme.onSurface,
      ); /// If you have problem or any question with headlineMedium tell me! Abdulloh Muminov.

  @override
  TextStyle? get headlineSmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size8, ///
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.surfaceBright : darkColorScheme.surfaceBright,
      ); /// If you have problem or any question with headlineSmall tell me! Abdulloh Muminov.

  @override
  TextStyle? get titleLarge => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size18, ///
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.surfaceDim : darkColorScheme.surfaceDim,
      ); /// If you have problem or any question with titleLarge tell me! Abdulloh Muminov.

  @override
  TextStyle? get titleMedium => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size16, ///
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.surfaceDim : darkColorScheme.surfaceDim,
      ); /// If you have problem or any question with titleMedium tell me! Abdulloh Muminov.

  @override
  TextStyle? get titleSmall => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size11, ///
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.surfaceBright : darkColorScheme.surfaceBright,
      ); /// If you have problem or any question with titleSmall tell me! Abdulloh Muminov.

  @override
  TextStyle? get bodyLarge => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size11, ///
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.onSurface : darkColorScheme.onSurface,
      ); /// If you have problem or any question with bodyLarge tell me! Abdulloh Muminov.

  @override
  TextStyle? get bodyMedium => TextStyle(
        fontWeight: FontWeight.w600, /// for MAIN (primary) button and ...
        fontSize: FontSize.size11, ///
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.onPrimary : darkColorScheme.onPrimary,
      ); /// If you have problem or any question with bodyMedium tell me! Abdulloh Muminov.

  @override
  TextStyle? get bodySmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11, ///
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.onSurfaceVariant : darkColorScheme.onSurfaceVariant,
      ); /// If you have problem or any question with bodySmall tell me! Abdulloh Muminov.

  @override
  TextStyle? get labelLarge => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size7,
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.onSurfaceVariant : darkColorScheme.onSurfaceVariant,
      ); /// If you have problem or any question with labelLarge tell me! Abdulloh Muminov.

  @override
  TextStyle? get labelSmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11, ///
        fontFamily: "Poppins",
        color: themeController.isLight ? lightColorScheme.surfaceBright : darkColorScheme.surfaceBright,
      ); /// If you have problem or any question with labelSmall tell me! Abdulloh Muminov.
}

@immutable
class FontSize {
  const FontSize._();

  static double size7 = 7.sp;
  static double size8 = 8.sp;
  static double size10 = 10.sp;
  static double size11 = 11.sp;
  static double size12 = 12.sp;
  static double size14 = 14.sp;
  static double size16 = 16.sp;
  static double size18 = 18.sp;
  static double size20 = 20.sp;
  static double size24 = 24.sp;
  static double size30 = 30.sp;
  static double size34 = 34.sp;
  static double size48 = 48.sp;
  static double size60 = 60.sp;
  static double size96 = 96.sp;
}
