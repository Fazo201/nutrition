import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final foodDetailsProvider = ChangeNotifierProvider((ref) => FoodDetailsVM());

enum TapType {ingredient, procedure}

class FoodDetailsVM with ChangeNotifier {
  FoodDetailsVM({TapType selectedTap = TapType.ingredient}):_selectedTap = selectedTap;
  TapType _selectedTap;
  double _rating = 0;
  bool _saveFood = false;

  TapType get selectedTap => _selectedTap;
  double get rating => _rating;
  bool get saveFood => _saveFood;

  void selectIngredient(){
    _selectedTap = TapType.ingredient;
    notifyListeners();
  }

  void selectProcedure(){
    _selectedTap = TapType.procedure;
    notifyListeners();
  }

  void updateRating(double rating) {
    _rating = rating;
    notifyListeners();
  }

  void isSavedFood(){
    _saveFood = !_saveFood;
    notifyListeners();
  }
}
