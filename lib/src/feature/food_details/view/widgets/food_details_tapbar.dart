import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/style/text_style.dart";
import "package:nutrition/src/feature/food_details/view_model/vm/food_details_vm.dart";

class FoodDetailsTapbar extends ConsumerWidget {
  const FoodDetailsTapbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(foodDetailsProvider);
    final selectedTab = state.selectedTap;
    return SizedBox(
      height: 33.h,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () => state.selectIngredient(),
              elevation: 0,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              color: selectedTab == TapType.ingredient ? AppColors.c129575 : AppColors.white,
              height: double.infinity,
              child: Text(
                context.localized.ingredient,
                style: const AppTextStyle().labelLarge?.copyWith(
                      color: selectedTab == TapType.ingredient ? AppColors.white : AppColors.c129575,
                    ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: MaterialButton(
              onPressed: () => state.selectProcedure(),
              elevation: 0,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              color: selectedTab == TapType.procedure ? AppColors.c129575 : AppColors.white,
              height: double.infinity,
              child: Text(
                context.localized.procedure,
                style: const AppTextStyle().labelLarge?.copyWith(
                      color: selectedTab == TapType.procedure ? AppColors.white : AppColors.c129575,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
