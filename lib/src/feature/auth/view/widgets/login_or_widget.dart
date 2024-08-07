import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/text_style.dart';

import '../../../../core/style/app_colors.dart';

class LoginOrWidget extends StatelessWidget {
  const LoginOrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.cD9D9D9,
            thickness: 1,
            endIndent: 10,
            indent: 50,
          ),
        ),
        Text(
          "Or Sign in With",
          style: const AppTextStyle().loginOrSign,
        ),
        const Expanded(
          child: Divider(
            color: AppColors.cD9D9D9,
            endIndent: 50,
            thickness: 1,
            indent: 10,
          ),
        ),
      ],
    );
  }
}
