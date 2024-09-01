import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";

class FoodDetailsProcedureCard extends StatelessWidget {
  const FoodDetailsProcedureCard({
    super.key,
    this.index,
  });

  final int? index;

  @override
  Widget build(BuildContext context) => SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surfaceBright,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: REdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Step $index",
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?",
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      );
}
