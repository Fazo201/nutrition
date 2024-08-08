import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/style/text_style.dart";

class RecipeTopCard extends StatelessWidget {
  const RecipeTopCard({super.key});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 150,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/all_post_image.png"),
              ),
            ),
            child: Stack(
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black26,
                        Colors.black54,
                      ],
                    ),
                  ),
                  child: Center(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 37.w,
                        height: 16.h,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.cFFE1B3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset("assets/icons/star_selected_icon.svg", height: 12.h, width: 12.w),
                              Text(
                                "4.0",
                                style: const AppTextStyle().bodySmall?.copyWith(color: AppColors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/icons/timer_in_card_icon.svg"),
                          const SizedBox(width: 5),
                          Text("20 min", style: const AppTextStyle().bodySmall?.copyWith(color: AppColors.cD9D9D9, fontSize: 11.sp)),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/recipe_bottom_navigation_bar_icon.svg",
                                  // ignore: deprecated_member_use
                                  color: Colors.green,
                                  width: 16.w,
                                  height: 16.h,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
