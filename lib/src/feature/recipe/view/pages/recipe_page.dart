import 'package:flutter/material.dart';
import 'package:nutrition/src/core/widgets/custom_appbar_widget.dart';
import 'package:nutrition/src/feature/recipe/view/widgets/recipe_popup_menu_button.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarWidget(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: RecipePopupMenuButtonWidget(),
          ),
        ],
      ),
      body: Center(
        child: Text("Recipe"),
      ),
    );
  }
}
