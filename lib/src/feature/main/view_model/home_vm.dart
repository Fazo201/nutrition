// import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final homeVM = ChangeNotifierProvider((ref) => HomeVm());

class HomeVm with ChangeNotifier {
  int currentIndex = 0;
  List<String> tabBarItems = ["All", "Indian", "Italian", "Asian", "Chinese", "Uzbekistan", "USA", "Turkey"];

  void changeTapBar(int i) {
    currentIndex = i;
    // log("$currentIndex  == $i    change Tapbar");
    notifyListeners();
  }
}
