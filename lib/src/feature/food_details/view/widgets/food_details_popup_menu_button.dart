import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:nutrition/generated/assets.dart";
import "package:nutrition/src/core/style/app_colors.dart";

class FoodDetailsPopupMenuButtonWidget extends StatelessWidget {
  const FoodDetailsPopupMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) => PopupMenuButton<String>(
        onSelected: (String result) {
          switch (result) {
            case "share":
              showAboutDialog(context: context);
              break;
            case "rate":
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
