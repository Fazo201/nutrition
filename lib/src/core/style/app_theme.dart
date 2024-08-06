import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:nutrition/src/core/style/text_style.dart";

import "app_colors.dart";
import "color_schema.dart";

@immutable
final class AppThemes {
  final ThemeMode mode;
  final ThemeData darkTheme;
  final ThemeData lightTheme;

  AppThemes({required this.mode})

      : darkTheme = ThemeData(
          brightness: Brightness.dark,
          colorScheme: darkColorScheme,
          scaffoldBackgroundColor: AppColors.black,
          textTheme: const AppTextStyle(),
        ),

        lightTheme = ThemeData(
          brightness: Brightness.light,
          colorScheme: lightColorScheme,
          scaffoldBackgroundColor: AppColors.white,
          textTheme: const AppTextStyle(),
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
        );

  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: AppColors.white,
        textTheme: const AppTextStyle(),
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
      );

  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        colorScheme: darkColorScheme,
        scaffoldBackgroundColor: AppColors.black,
        textTheme: const AppTextStyle(),
      );

  ThemeData computeTheme() {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark ? darkTheme : lightTheme;
    }
  }
}
