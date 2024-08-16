import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeVM = ChangeNotifierProvider((ref) => HomeVm());

class HomeVm with ChangeNotifier {
  int currentIndex = 0;
  Map<int, bool> _bookmarkStatus = {};

  List<String> tabBarItems = ["All", "Indian", "Italian", "Asian", "Chinese", "Uzbekistan", "USA", "Turkey"];

  bool isBookmarked(int index) => _bookmarkStatus[index] ?? false;

  void toggleBookmark(int index) {
    _bookmarkStatus[index] = !(_bookmarkStatus[index] ?? false);
    notifyListeners();
  }

  void changeTapBar(int i) {
    currentIndex = i;
    notifyListeners();
  }
}
