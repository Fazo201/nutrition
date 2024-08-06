import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition/src/core/widgets/app_material_context.dart';
import 'package:nutrition/src/core/widgets/custom_appbar_widget.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        actionButton: SvgPicture.asset(
          "assets/icons/more_apbar_icon.svg",
          height: 4,
          width: 18,
        ),
      ),
      body: const Center(
        child: Text("Recipe"),
      ),
    );
  }
}
