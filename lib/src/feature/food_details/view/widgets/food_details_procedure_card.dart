import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/style/text_style.dart";

class FoodDetailsProcedureCard extends StatelessWidget {
  const FoodDetailsProcedureCard({super.key, this.index});

  final int? index;

  @override
  Widget build(BuildContext context) => SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.cD9D9D9,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Step $index",style: const AppTextStyle().bodyLarge?.copyWith(color: const Color.fromRGBO(18, 18, 18, 1),fontSize: 11.sp,fontWeight: FontWeight.w600),),
                Text("Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?",style: const AppTextStyle().bodySmall?.copyWith(color: const Color.fromRGBO(169, 169, 169, 1),fontSize: 11.sp),),
              ],
            ),
          )
        ),
      );
}