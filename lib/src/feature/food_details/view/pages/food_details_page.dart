import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:nutrition/generated/assets.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/style/text_style.dart";
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
  Widget build(BuildContext context,WidgetRef ref) {
    final state = ref.watch(foodDetailsProvider);
    final selectedTab = state.selectedTap;
      return Scaffold(
        appBar: const CustomAppbarWidget(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: FoodDetailsPopupMenuButtonWidget(),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              const FoodDetailsTopCard(),
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Spicy chicken burger with French fries",
                      style: const AppTextStyle().titleSmall?.copyWith(
                            color: AppColors.black,
                          ),
                    ),
                  ),
                  Text(
                    "(13k ${context.localized.reviews})",
                    style: const AppTextStyle().bodyMedium?.copyWith(
                          color: AppColors.cA9A9A9,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    child: Image.network(
                        "https://th.bing.com/th?q=Cook+Clip&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.6&pid=InlineBlock&mkt=en-WW&cc=UZ&setlang=ru&adlt=moderate&t=1&mw=247"),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Column(
                    children: [
                      Text(
                        "Laura wilson",
                        style: const AppTextStyle().bodyMedium?.copyWith(color: AppColors.c121212, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.iconsLocationIcon),
                          Text(" Lagos, Nigeria",
                              style: const AppTextStyle().bodySmall?.copyWith(color: AppColors.cA9A9A9, fontSize: 11.sp)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              const FoodDetailsTapbar(),
              SizedBox(height: 24.h),
              Row(
                children: [
                  SvgPicture.asset(Assets.iconsRecipeDishIcon),
                  Text(" 1 ${context.localized.serve}", style: const AppTextStyle().bodySmall?.copyWith(color: AppColors.cA9A9A9, fontSize: 11.sp)),
                  const Spacer(),
                  Text("10 ${context.localized.items}", style: const AppTextStyle().bodySmall?.copyWith(color: AppColors.cA9A9A9, fontSize: 11.sp)),
                ],
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) => selectedTab == TapType.ingredient ? const FoodDetailsIngredientCard(): FoodDetailsProcedureCard(index: index+1,),
                ),
              ),
            ],
          ),
        ),
      );}
}
