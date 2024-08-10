import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final notificationVMProvider = ChangeNotifierProvider((ref) => NotificationVm());

class NotificationVm extends ChangeNotifier {
  int selectedIndex = 0;

  void selectTab(int index) {
    if (selectedIndex != index) {
      selectedIndex = index;
      notifyListeners();
    }
  }
}
