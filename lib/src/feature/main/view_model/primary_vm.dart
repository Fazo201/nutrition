import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final primaryVM = ChangeNotifierProvider((ref) => PrimaryVM());

class PrimaryVM with ChangeNotifier {
  int currentIndex = 0;

  void changeNavigation(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
