import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/style/text_style.dart";

class FoodDetailsIngredientCard extends StatelessWidget {
  const FoodDetailsIngredientCard({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 76.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.cD9D9D9,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network("https://th.bing.com/th/id/OIP.NL54ug-JswPdtmMChNyh6QHaE7?w=218&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7",height: 52.h,width: 52.w,fit: BoxFit.cover,),),
            subtitle: Text(
              "Vegetables",
              style: const AppTextStyle().titleSmall?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            trailing: Text("300g",style: const AppTextStyle().titleSmall?.copyWith(
                    color: AppColors.cA9A9A9,
                    fontWeight: FontWeight.w400,
                  ),
                ),
          ),
        ),
      );
}
