import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final foodDetailsProvider = ChangeNotifierProvider((ref) => FoodDetailsVM());

enum TapType {ingredient, procedure}

class FoodDetailsVM with ChangeNotifier {
  FoodDetailsVM({TapType selectedTap = TapType.ingredient}):_selectedTap = selectedTap;
  TapType _selectedTap;
  double _rating = 0;

  double get rating => _rating;

  TapType get selectedTap => _selectedTap;

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
}
