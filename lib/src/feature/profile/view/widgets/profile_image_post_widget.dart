import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:nutrition/src/core/constants/context_extension.dart";

import "../../../../core/style/app_colors.dart";

class ProfileImagePostWidget extends StatelessWidget {
  const ProfileImagePostWidget({
    required this.imagesPosts,
    required this.imagesDelete,
    required this.languageChanges,
    required this.logOut,
    super.key,
  });
  final void Function() imagesPosts;
  final void Function() imagesDelete;
  final void Function() languageChanges;
  final void Function() logOut;

  @override
  Widget build(BuildContext context) => PopupMenuButton<String>(
    useRootNavigator: true,
        // onSelected: (String result) {
        //   switch (result) {
        //     case context.localized.post_image,:
        //       break;
        //     case "Delete image":
        //       break;
        //     case "Language":
        //       break;
        //     case "Log out":
        //       break;
        //   }
        // },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            onTap: imagesPosts,
            value:context.localized.post_image,
            child:  ListTile(
              title: Text( context.localized.post_image,),
            ),
          ),
          PopupMenuItem<String>(
            onTap: imagesDelete,
            value: context.localized.delete_image,
            child:  ListTile(
              title: Text(context.localized.delete_image,),
            ),
          ),
          PopupMenuItem<String>(
            onTap: languageChanges,
            value: context.localized.language,
            child:  ListTile(
              title: Text(context.localized.language,),
            ),
          ),
          PopupMenuItem<String>(
            onTap: logOut,
            value: context.localized.log_out,
            child:  ListTile(
              title: Text(context.localized.log_out),
            ),
          ),
        ],
        icon: SvgPicture.asset(
          "assets/icons/more_apbar_icon.svg",
          height: 4.h,
          width: 18.w,
        ),
        color: AppColors.white,
        position: PopupMenuPosition.under,
        popUpAnimationStyle: AnimationStyle(duration: Durations.extralong2),
        // constraints: const BoxConstraints(maxHeight: 180, maxWidth: 164),
        offset: const Offset(-12, - 5),
      );
}
