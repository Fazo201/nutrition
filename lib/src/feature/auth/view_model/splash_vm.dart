import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:nutrition/src/core/widgets/app_material_context.dart";
import "package:nutrition/src/feature/settings/locale_controller.dart";

final splashVm = ChangeNotifierProvider.family((ref, TickerProvider tickerProvider) => SplashVm(tickerProvider));

class SplashVm extends ChangeNotifier {
  late final AnimationController controller;
  late final Animation<double> animation;
  late final Animation<Offset> animationIcons;
  LangCodes? language;

  SplashVm(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 3),
    );
    animation = Tween(end: 1.0, begin: 0.0).animate(controller);
    animationIcons = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(controller);
    controller.forward();
  }

  void changeLanguage(LangCodes langCode) {
    language = langCode;
    localController.changeLocal(langCode);
    notifyListeners();
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }
}
