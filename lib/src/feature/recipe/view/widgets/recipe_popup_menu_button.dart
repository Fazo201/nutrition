import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition/src/core/style/app_colors.dart';

class RecipePopupMenuButtonWidget extends StatelessWidget {
  const RecipePopupMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
          onSelected: (String result) {
            switch (result) {
              case 'share':
                showAboutDialog(context: context);
                break;
              case 'rate':
                break;
              case 'review':
                break;
              case 'unsave':
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'share',
              child: ListTile(
                leading: Icon(Icons.share),
                title: Text('share'),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'rate',
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text('Rate Recipe'),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'review',
              child: ListTile(
                leading: Icon(Icons.comment),
                title: Text('Review'),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'unsave',
              child: ListTile(
                leading: Icon(Icons.bookmark_remove),
                title: Text('Unsave'),
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
          constraints:const BoxConstraints(maxHeight: 180,maxWidth: 164),
          offset: const Offset(-12.0, -5.0),
        );
  }
}