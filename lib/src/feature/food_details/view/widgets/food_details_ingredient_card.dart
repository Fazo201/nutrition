import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";

class FoodDetailsIngredientCard extends StatelessWidget {
  const FoodDetailsIngredientCard({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 76.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surfaceBright,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: ListTile(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                "https://th.bing.com/th/id/OIP.NL54ug-JswPdtmMChNyh6QHaE7?w=218&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7",
                height: 52.h,
                width: 52.w,
                fit: BoxFit.cover,
              ),
            ),
            subtitle: Text(
              "Vegetables",
              style: context.textTheme.titleMedium?.copyWith(
                color: context.theme.colorScheme.onSurface,
              ),
            ),
            trailing: Text(
              "300g",
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      );
}
