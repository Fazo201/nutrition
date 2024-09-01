import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:nutrition/generated/assets.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/widgets/app_material_context.dart";
import "package:nutrition/src/core/widgets/custom_appbar_widget.dart";
import "package:nutrition/src/feature/food_details/view/widgets/food_details_ingredient_card.dart";
import "package:nutrition/src/feature/food_details/view/widgets/food_details_popup_menu_button.dart";
import "package:nutrition/src/feature/food_details/view/widgets/food_details_procedure_card.dart";
import "package:nutrition/src/feature/food_details/view/widgets/food_details_tapbar.dart";
import "package:nutrition/src/feature/food_details/view/widgets/food_details_top_card.dart";
import "package:nutrition/src/feature/food_details/view_model/vm/food_details_vm.dart";

class FoodDetailsPage extends ConsumerWidget {
  const FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(foodDetailsProvider);
    final selectedTab = state.selectedTap;
    return Scaffold(
      appBar: CustomAppbarWidget(
        actions: [
          Padding(
            padding: REdgeInsets.only(right: 12),
            child: const FoodDetailsPopupMenuButtonWidget(),
          ),
          IconButton(onPressed: (){themeController.switchTheme();}, icon: const Icon(Icons.dark_mode)),
        ],
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const FoodDetailsTopCard(),
            8.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Spicy chicken burger with French fries",
                    style: context.textTheme.titleMedium?.copyWith(
                          fontSize: 14.sp,
                        ),
                  ),
                ),
                Text(
                  "(13k ${context.localized.reviews})",
                  style: context.textTheme.headlineMedium?.copyWith(
                        color: context.theme.colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: const NetworkImage(
                    "https://th.bing.com/th?q=Cook+Clip&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.6&pid=InlineBlock&mkt=en-WW&cc=UZ&setlang=ru&adlt=moderate&t=1&mw=247",
                  ),
                ),
                6.horizontalSpace,
                Column(
                  children: [
                    Text(
                      "Laura wilson",
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.theme.colorScheme.onSurface,
                        fontSize: 14.sp,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.iconsLocationIcon),
                        Text(
                          " Lagos, Nigeria",
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            18.verticalSpace,
            const FoodDetailsTapbar(),
            24.verticalSpace,
            Row(
              children: [
                SvgPicture.asset(Assets.iconsRecipeDishIcon),
                Text(
                  " 1 ${context.localized.serve}",
                  style: context.textTheme.bodySmall,
                ),
                const Spacer(),
                Text(
                  "10 ${context.localized.items}",
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
            8.verticalSpace,
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                padding: const EdgeInsets.symmetric(vertical: 10),
                separatorBuilder: (context, index) => 12.verticalSpace,
                itemBuilder: (context, index) => selectedTab == TapType.ingredient
                    ? const FoodDetailsIngredientCard()
                    : FoodDetailsProcedureCard(
                        index: index + 1,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
