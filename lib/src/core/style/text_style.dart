import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/style/app_colors.dart";

@immutable
class AppTextStyle extends TextTheme {
  const AppTextStyle();

  @override
  TextStyle? get bodyMedium => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size18,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get splashCenter => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size50,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get splashButtomText => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size16,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get splashButton => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size16,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get loginHello => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size30,
        fontFamily: "Poppins",
        color: AppColors.black,
      );

  @override
  TextStyle? get loginWelcomeBack => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size20,
        fontFamily: "Poppins",
        color: AppColors.c121212,
      );

  @override
  TextStyle? get loginEmail => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: "Poppins",
        color: AppColors.c121212,
      );

  @override
  TextStyle? get loginEnter => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.cD9D9D9,
      );

  @override
  TextStyle? get loginForgotPassword => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.cFF9C00,
      );

  @override
  TextStyle? get loginOrSign => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.cD9D9D9,
      );

  @override
  TextStyle? get loginDont => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.black,
      );

  @override
  TextStyle? get loginMinSign => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.cFF9C00,
      );

  @override
  TextStyle? get registerCreateAccount => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size20,
        fontFamily: "Poppins",
        color: AppColors.black,
      );

  @override
  TextStyle? get registerLetsHelp => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.c121212,
      );

  @override
  TextStyle? get homeWhatAre => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.cA9A9A9,
      );

  @override
  TextStyle? get homeAll => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get homeIndian => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.c71B1A1,
      );

  @override
  TextStyle? get homeFoodsName => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size14,
        fontFamily: "Poppins",
        color: AppColors.c484848,
      );

  @override
  TextStyle? get homeFoodsTime => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.c484848,
      );

  @override
  TextStyle? get homeNewRecipes => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size16,
        fontFamily: "Poppins",
        color: AppColors.black,
      );

  @override
  TextStyle? get searchRecipes => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size16,
        fontFamily: "Poppins",
        color: AppColors.c181818,
      );

  @override
  TextStyle? get searchStarNumber => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.black,
      );

  @override
  TextStyle? get searchByChef => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size8,
        fontFamily: "Poppins",
        color: AppColors.cA9A9A9,
      );
  @override
  TextStyle? get searchFilter => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size8,
        fontFamily: "Poppins",
        color: AppColors.c71B1A1,
      );

  @override
  TextStyle? get searchFilterButton => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get recipeReviews => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.cA9A9A9,
      );

  @override
  TextStyle? get recipeBoxMain => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size14,
        fontFamily: "Poppins",
        color: AppColors.white,
      );
}

@immutable
class FontSize {
  const FontSize._();

  static double size6_4 = 6.4.sp;
  static double size7_8 = 7.8.sp;
  static double size9_5 = 9.5.sp;
  static double size8 = 8.sp;
  static double size10 = 10.sp;
  static double size10_5 = 10.5.sp;
  static double size11 = 11.sp;
  static double size12 = 12.sp;
  static double size12_5 = 12.5.sp;
  static double size13 = 13.sp;
  static double size13_5 = 13.5.sp;
  static double size14 = 14.sp;
  static double size14_2 = 14.2.sp;
  static double size16 = 16.sp;
  static double size17_3 = 17.3.sp;
  static double size18 = 18.sp;
  static double size19_2 = 19.2.sp;
  static double size20 = 20.sp;
  static double size21 = 21.sp;
  static double size22 = 22.sp;
  static double size23_3 = 23.3.sp;
  static double size24 = 24.sp;
  static double size26 = 26.sp;
  static double size28 = 28.sp;
  static double size30 = 30.sp;
  static double size32 = 32.sp;
  static double size42 = 42.sp;
  static double size48 = 48.sp;
  static double size50 = 50.sp;
  static double size62 = 62.2.sp;
}
