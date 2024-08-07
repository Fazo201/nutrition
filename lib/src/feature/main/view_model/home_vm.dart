import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final homeVM = ChangeNotifierProvider((ref) => HomeVm());

class HomeVm with ChangeNotifier {
  int curretIndex = 0;
  List<String> tabBarItems = ["All", "Indian", "Italian", "Asian", "Chinese", "Uzbekistan", "USA", "Turkey"];
  void navigateToSearchPage(BuildContext context) {}

  void changeTapBar(int i) {
    curretIndex = i;
    notifyListeners();
  }
}
