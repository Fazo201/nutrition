import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/style/app_theme.dart';

const String _spThemeKey = 'is_light_theme';


final theme = ChangeNotifierProvider((ref) => ThemeController());


class ThemeController with ChangeNotifier {
  ThemeController() : _isLight = PlatformDispatcher.instance.platformBrightness != Brightness.dark {
    SharedPreferences.getInstance().then<void>(
          (sp) {
        final theme = sp.getBool(_spThemeKey);
        if (theme != null && theme != isLight) {
          _isLight = theme;
          notifyListeners();
        }
      },
      onError: (e){
            log(e);
      },
    );
  }

  ThemeData get theme => isLight ? AppThemes.light() : AppThemes.dark();

  bool get isLight => _isLight;

  bool get isDark => !isLight;

  bool _isLight;

  void switchTheme() {
    _isLight = !_isLight;
    SharedPreferences.getInstance().then<void>(
          (sp) {
        sp.setBool(_spThemeKey, _isLight);
      },
      onError: (e){
        log(e);
      },
    );
    notifyListeners();
  }
}
