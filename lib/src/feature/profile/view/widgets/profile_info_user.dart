import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/text_style.dart';

import '../../../../core/style/app_colors.dart';

class ProfileInfoUser extends StatelessWidget {
  const ProfileInfoUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/images/profile_image.png')

      ),
    );
  }
}
