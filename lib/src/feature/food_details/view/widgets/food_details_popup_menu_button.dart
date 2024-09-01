import "dart:developer";
import "package:flutter/material.dart";
import "package:flutter_rating_bar/flutter_rating_bar.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/generated/assets.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/feature/food_details/view_model/vm/food_details_vm.dart";
import "package:share_plus/share_plus.dart";

class FoodDetailsPopupMenuButtonWidget extends ConsumerWidget {
  const FoodDetailsPopupMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodDetailsVM = ref.read(foodDetailsProvider.notifier);
    return PopupMenuButton<String>(
      onSelected: (String result) {
        switch (result) {
          case "share":
            Share.share("Ushbu habar yuborilmoqda...");
            break;
          case "rate":
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(
                  child: Text(
                    context.localized.rateRecipe,
                    style: context.textTheme.bodySmall?.copyWith(
                          color: context.theme.colorScheme.onSurface,
                        ),
                  ),
                ),
                content: RatingBar(
                  maxRating: 5,
                  ratingWidget: RatingWidget(
                    full: SvgPicture.asset(Assets.iconsStarSelectedIcon),
                    half: SvgPicture.asset(Assets.iconsStarSelectedIcon),
                    empty: SvgPicture.asset(Assets.iconsStarIcon),
                  ),
                  itemSize: 22.sp,
                  itemPadding: REdgeInsets.symmetric(horizontal: 10),
                  onRatingUpdate: (rating) {
                    foodDetailsVM.updateRating(rating);
                    log("Rating: ${foodDetailsVM.rating}");
                  },
                ),
                actionsPadding: EdgeInsets.zero,
                actions: [
                  Center(
                    child: Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) => MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 0,
                        color: ref.watch(foodDetailsProvider).rating > 0
                            ? AppColors.cFFAD30
                            : AppColors.cD9D9D9,
                        height: 28.h,
                        minWidth: 80.w,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide.none,
                        ),
                        child: Text(
                          context.localized.send,
                          style: const TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
            break;
          case "review":
            context.go("${AppRouteNames.home}/${AppRouteNames.foodDetails}/${AppRouteNames.reviews}");
            break;
          case "unsave":
            foodDetailsVM.isSavedFood();
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: "share",
          child: ListTile(
            leading: SvgPicture.asset(Assets.iconsRecipeShareIcon,color: context.theme.colorScheme.onSurface,),
            title: Text(context.localized.share),
          ),
        ),
        PopupMenuItem<String>(
          value: "rate",
          child: ListTile(
            leading: Icon(Icons.star,color: context.theme.colorScheme.onSurface,),
            title: Text(context.localized.rateRecipe),
          ),
        ),
        PopupMenuItem<String>(
          value: "review",
          child: ListTile(
            leading: SvgPicture.asset(Assets.iconsReviewIcon,color: context.theme.colorScheme.onSurface,),
            title: Text(context.localized.reviews),
          ),
        ),
        if(foodDetailsVM.saveFood) PopupMenuItem<String>(
          value: "unsave",
          child: ListTile(
            leading: SvgPicture.asset(Assets.iconsRecipeUnsaveIcon,color: context.theme.colorScheme.onSurface,),
            title: Text(context.localized.unsave),
          ),
        ),
      ],
      icon: SvgPicture.asset(
        "assets/icons/more_apbar_icon.svg",
        height: 4.h,
        width: 18.w,
        color: context.theme.colorScheme.onSurface,
      ),
      position: PopupMenuPosition.under,
      popUpAnimationStyle: AnimationStyle(duration: Durations.extralong2),
      constraints: BoxConstraints(maxWidth: 164.w),
      offset: const Offset(-12, -5),
    );
  }
}
