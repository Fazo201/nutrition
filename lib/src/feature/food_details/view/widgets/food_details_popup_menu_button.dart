import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_rating_bar/flutter_rating_bar.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:nutrition/generated/assets.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/style/text_style.dart";
import "package:nutrition/src/feature/food_details/view_model/vm/food_details_vm.dart";
import "package:share_plus/share_plus.dart";

class FoodDetailsPopupMenuButtonWidget extends ConsumerWidget {
  const FoodDetailsPopupMenuButtonWidget({super.key});
 
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final foodDetailsVM = ref.watch(foodDetailsProvider.notifier);
    final foodDetailsState = ref.read(foodDetailsProvider);
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
                  backgroundColor: AppColors.white,
                  title: Center(
                      child: Text(
                    "Rate recipe",
                    style: const AppTextStyle().bodySmall?.copyWith(
                          fontSize: 11.sp,
                          color: AppColors.black,
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
                    itemSize: 28.sp,
                    itemPadding: EdgeInsets.symmetric(horizontal: 10.w),
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
                          color: ref.watch(foodDetailsProvider).rating > 0 ? const Color.fromRGBO(255, 173, 48, 1) : const Color.fromRGBO(217, 217, 217, 1),
                          height: 20.h,
                          minWidth: 61.w,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide.none,
                          ),
                          child: const Text(
                            "Send",
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
              break;
            case "review":
              break;
            case "unsave":
              break;
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: "share",
            child: ListTile(
              leading: SvgPicture.asset(Assets.iconsRecipeShareIcon),
              title: const Text("share"),
            ),
          ),
          const PopupMenuItem<String>(
            value: "rate",
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text("Rate Recipe"),
            ),
          ),
          PopupMenuItem<String>(
            value: "review",
            child: ListTile(
              leading: SvgPicture.asset(Assets.iconsReviewIcon),
              title: const Text("Review"),
            ),
          ),
          PopupMenuItem<String>(
            value: "unsave",
            child: ListTile(
              leading: SvgPicture.asset(Assets.iconsRecipeUnsaveIcon),
              title: const Text("Unsave"),
            ),
          ),
        ],
        icon: SvgPicture.asset(
          "assets/icons/more_apbar_icon.svg",
          height: 4,
          width: 18,
        ),
        color: AppColors.white,
        position: PopupMenuPosition.under,
        popUpAnimationStyle: AnimationStyle(duration: Durations.extralong2),
        constraints: BoxConstraints(maxWidth: 164.w),
        offset: const Offset(-12, -5),
      );

  }
}
