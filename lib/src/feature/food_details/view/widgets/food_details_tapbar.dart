import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
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
              color: selectedTab == TapType.ingredient ? context.theme.colorScheme.primary : context.theme.colorScheme.surface,
              height: double.infinity,
              child: Text(
                context.localized.ingredient,
                style: context.textTheme.bodyMedium?.copyWith(
                      color: selectedTab == TapType.ingredient ? context.theme.colorScheme.onPrimary : context.theme.colorScheme.primaryFixed,
                    ),
              ),
            ),
          ),
          12.verticalSpace,
          Expanded(
            child: MaterialButton(
              onPressed: () => state.selectProcedure(),
              elevation: 0,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              color: selectedTab == TapType.procedure ? context.theme.colorScheme.primary : context.theme.colorScheme.surface,
              height: double.infinity,
              child: Text(
                context.localized.procedure,
                style: context.textTheme.bodyMedium?.copyWith(
                      color: selectedTab == TapType.procedure ? context.theme.colorScheme.onPrimary : context.theme.colorScheme.primaryFixed,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
