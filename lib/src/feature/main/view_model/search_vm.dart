import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/style/app_colors.dart";

import "../view/widgets/filter_search_widget.dart";

final searchVm = ChangeNotifierProvider((ref) => SearchVm());

class SearchVm extends ChangeNotifier {

  final List<String> _recentSearches = [
    "Traditional spare ribs baked",
    "Lamb chops with fruity couscous and mint",
    "Spice roasted chicken with flavored rice",
    "Chinese style Egg fried rice with sliced pork",
    "Traditional spare ribs baked",
    "Lamb chops with fruity couscous and mint",
    "Spice roasted chicken with flavored rice",
    "Chinese style Egg fried rice with sliced pork",
  ];

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  List<String> _results = [];
  int _totalResults = 0;

  List<String> get recentSearches => _recentSearches;
  List<String> get results => _results;
  int get totalResults => _totalResults;
  FocusNode get focusNode => _focusNode;
  TextEditingController get controller => _controller;

  void performSearch() {
    final query = _controller.text;
    _results = List<String>.generate(10, (index) => 'Result ${index + 1} for "$query"');
    _totalResults = _results.length;
    notifyListeners();
  }

  void showFilterBottomSheet(BuildContext context) {
    FocusScope.of(context).unfocus();  // Unfocus to dismiss the keyboard
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      isScrollControlled: true,  // Allows the bottom sheet to be dismissible
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0.r),
        ),
      ),
      builder: (context) => const FilterBottomSheet(),
    );
  }

  void checkBooleanValue(bool? isTextField, BuildContext context) {
    if (isTextField == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(_focusNode);
      });
    } else if (isTextField == false) {
      Future.delayed(const Duration(milliseconds: 100), () {
        showFilterBottomSheet(context);
      });
    } else {
      log("Error on your page");
    }
  }
}
