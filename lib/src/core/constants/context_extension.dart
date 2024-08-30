import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:nutrition/src/core/style/text_style.dart";


extension CustomContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => const AppTextStyle();
  AppLocalizations get localized => AppLocalizations.of(this)!;
}
