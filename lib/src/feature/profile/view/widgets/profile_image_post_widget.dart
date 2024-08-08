import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../core/style/app_colors.dart";

class ProfileImagePostWidget extends StatelessWidget {
  const ProfileImagePostWidget({super.key});

  @override
  Widget build(BuildContext context) => PopupMenuButton<String>(
        onSelected: (String result) {
          switch (result) {
            case 'Posts image':
              showAboutDialog(context: context,
                  children: [
                    const Text('Posts image')
                  ]
              );
              break;
            case 'Delete image':
              showAboutDialog(context: context,
              children: [
                const Text('Delete image')
              ]
              );
              break;
            case 'Language':
              showAboutDialog(context: context,
                  children: [
                    const Text('Language')
                  ]
              );
              break;
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Posts image',
            child: ListTile(
              title: Text('Posts image'),
            ),
          ),
          const PopupMenuItem<String>(
            value: 'Delete image',
            child: ListTile(
              title: Text('Delete image'),
            ),
          ),
          const PopupMenuItem<String>(
            value: 'Language',
            child: ListTile(
              title: Text('Language'),
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
        constraints: const BoxConstraints(maxHeight: 180, maxWidth: 164),
        offset: const Offset(-12.0, -5.0),
      );
}
