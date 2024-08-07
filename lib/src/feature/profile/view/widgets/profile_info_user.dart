import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/text_style.dart';

import '../../../../core/style/app_colors.dart';

class ProfileInfoUser extends StatelessWidget {
  const ProfileInfoUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/profile_image.png')

        ),
        Column(
          children: [
            Text("Recipe",style: const AppTextStyle().loginEnter?.copyWith(color: AppColors.cA9A9A9),),
            Text("4",style: const AppTextStyle().profileTitle,)
          ],
        ),
        Column(
          children: [
            Text("Followers",style: const AppTextStyle().loginEnter?.copyWith(color: AppColors.cA9A9A9),),
            Text("2.5M",style: const AppTextStyle().profileTitle,)
          ],
        ),
        Column(
          children: [
            Text("Following",style: const AppTextStyle().loginEnter?.copyWith(color: AppColors.cA9A9A9),),
            Text("259",style: const AppTextStyle().profileTitle,)
          ],
        ),

      ],
    );
  }
}
