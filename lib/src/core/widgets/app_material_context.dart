
import 'package:flutter/material.dart';
import 'package:nutrition/src/feature/search/view/pages/search_recipes_page.dart';

import '../../feature/settings/inherited_locale_notifier.dart';
import '../../feature/settings/inherited_theme_notifier.dart';
import '../../feature/settings/locale_controller.dart';
import '../../feature/settings/theme_controller.dart';

final ThemeController themeController = ThemeController();
final LocalController localController = LocalController();

class AppMaterialContext extends StatelessWidget {
  const AppMaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedThemeNotifier(
      themeController: themeController,
      child: InheritedLocalNotifier(
        localController: localController,
        child: Builder(
            builder: (context) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: InheritedThemeNotifier.maybeOf(context)?.theme,
                locale: InheritedLocalNotifier.maybeOf(context)?.appLocal,
                home: SearchRecipesPage(),
                // home:
              );
            }
        ),
      ),
    );
  }
}