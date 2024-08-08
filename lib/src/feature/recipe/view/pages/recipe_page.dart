import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/style/text_style.dart";
import "package:nutrition/src/core/widgets/custom_appbar_widget.dart";
import "package:nutrition/src/feature/recipe/view/widgets/recipe_popup_menu_button.dart";
import "package:nutrition/src/feature/recipe/view/widgets/recipe_top_card.dart";

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppbarWidget(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: RecipePopupMenuButtonWidget(),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              const RecipeTopCard(),
              SizedBox(height: 12.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("Spicy chicken burger with French fries",style: const AppTextStyle().titleSmall?.copyWith(color: AppColors.black,),),),
                  Text("(13k Reviews)",style: const AppTextStyle().bodyMedium?.copyWith(color: AppColors.cA9A9A9,),),
                ],
              ),
              
            ],
          ),
        ),
      );
}
