import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/feature/food_details/view_model/vm/food_details_vm.dart";

class FoodDetailsTopCard extends ConsumerWidget {
  const FoodDetailsTopCard({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final foodDetailsVM = ref.read(foodDetailsProvider.notifier);
    final state = ref.watch(foodDetailsProvider);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 150.h,
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
                  padding: REdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 37.w,
                        height: 16.h,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.cFFE1B3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset("assets/icons/star_selected_icon.svg", height: 9.h, width: 9.w),
                              Text(
                                "4.0",
                                style: context.textTheme.headlineSmall?.copyWith(
                                  color: AppColors.black,
                                ),
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
                          5.horizontalSpace,
                          Text("20 ${context.localized.min}", style: context.textTheme.labelSmall?.copyWith(color: AppColors.cD9D9D9)),
                          5.horizontalSpace,
                          InkWell(
                            onTap: (){
                              foodDetailsVM.isSavedFood();
                            },
                            child: SizedBox(
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
                                    color: state.saveFood ? Colors.green : null,
                                    width: 16.w,
                                    height: 16.h,
                                  ),
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
      );}
}
