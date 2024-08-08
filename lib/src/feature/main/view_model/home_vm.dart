import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";

final homeVM = ChangeNotifierProvider((ref) => HomeVm());

class HomeVm with ChangeNotifier {
  int curretIndex = 0;
  List<String> tabBarItems = ["All", "Indian", "Italian", "Asian", "Chinese", "Uzbekistan", "USA", "Turkey"];
  void navigateToSearchPage(BuildContext context, bool isFilter) {
    context.push("${AppRouteNames.homePage}${AppRouteNames.register}", extra: isFilter);
  }

  void changeTapBar(int i) {
    curretIndex = i;
    log("$curretIndex  == $i    change Tapbar");

    notifyListeners();
  }
}
