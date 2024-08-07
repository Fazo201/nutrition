import "package:flutter/material.dart";
import "package:nutrition/src/core/style/app_colors.dart";

@immutable
class AppTextStyle extends TextTheme {
  const AppTextStyle();

  @override
  TextStyle? get splashTopText => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size18,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get splashCenter => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size50,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get splashButtomText => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size16,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get splashButton => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size16,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get loginHello => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size30,
        fontFamily: "Poppins",
        color: AppColors.black,
      );

  @override
  TextStyle? get loginWelcomeBack => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size20,
        fontFamily: "Poppins",
        color: AppColors.c121212,
      );

  @override
  TextStyle? get loginEmail => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: "Poppins",
        color: AppColors.c121212,
      );

  @override
  TextStyle? get loginEnter => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.cD9D9D9,
      );

  @override
  TextStyle? get loginForgotPassword => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.cFF9C00,
      );

  @override
  TextStyle? get loginOrSign => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.cD9D9D9,
      );

  @override
  TextStyle? get loginDont => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.black,
      );

  @override
  TextStyle? get loginMinSign => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.cFF9C00,
      );

  @override
  TextStyle? get registerCreateAccount => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size20,
        fontFamily: "Poppins",
        color: AppColors.black,
      );

  @override
  TextStyle? get registerLetsHelp => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.c121212,
      );

  @override
  TextStyle? get homeWhatAre => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.cA9A9A9,
      );

  @override
  TextStyle? get homeAll => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get homeIndian => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.c71B1A1,
      );

  @override
  TextStyle? get homeFoodsName => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size14,
        fontFamily: "Poppins",
        color: AppColors.c484848,
      );

  @override
  TextStyle? get homeFoodsTime => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.c484848,
      );

  @override
  TextStyle? get homeNewRecipes => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size16,
        fontFamily: "Poppins",
        color: AppColors.black,
      );

  @override
  TextStyle? get searchRecipes => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size16,
        fontFamily: "Poppins",
        color: AppColors.c181818,
      );

  @override
  TextStyle? get searchStarNumber => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.black,
      );

  @override
  TextStyle? get searchByChef => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size8,
        fontFamily: "Poppins",
        color: AppColors.cA9A9A9,
      );
  @override
  TextStyle? get searchFilter => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size8,
        fontFamily: "Poppins",
        color: AppColors.c71B1A1,
      );

  @override
  TextStyle? get searchFilterButton => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.white,
      );

  @override
  TextStyle? get recipeReviews => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        fontFamily: "Poppins",
        color: AppColors.cA9A9A9,
      );

  @override
  TextStyle? get recipeBoxMain => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size14,
        fontFamily: "Poppins",
        color: AppColors.white,
      );
}

@immutable
class FontSize {
  const FontSize._();

  static const double size6_4 = 6.4;
  static const double size7_8 = 7.8;
  static const double size9_5 = 9.5;
  static const double size8 = 8;
  static const double size10 = 10;
  static const double size10_5 = 10.5;
  static const double size11 = 11;
  static const double size12 = 12;
  static const double size12_5 = 12.5;
  static const double size13 = 13;
  static const double size13_5 = 13.5;
  static const double size14 = 14;
  static const double size14_2 = 14.2;
  static const double size16 = 16;
  static const double size17_3 = 17.3;
  static const double size18 = 18;
  static const double size19_2 = 19.2;
  static const double size20 = 20;
  static const double size21 = 21;
  static const double size22 = 22;
  static const double size23_3 = 23.3;
  static const double size24 = 24;
  static const double size26 = 26;
  static const double size28 = 28;
  static const double size30 = 30;
  static const double size32 = 32;
  static const double size42 = 42;
  static const double size48 = 48;
  static const double size50 = 50;
  static const double size62 = 62.2;
}
