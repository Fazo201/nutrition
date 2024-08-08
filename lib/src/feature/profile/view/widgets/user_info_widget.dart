import 'package:flutter/material.dart';
import "package:nutrition/src/core/constants/context_extension.dart";

import "../../../../core/style/app_colors.dart";


class UserInfoWidget extends StatelessWidget {
 final String email;
 final String password;
  const UserInfoWidget({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          "Email: $email",
          style: context.theme.textTheme.bodyLarge?.copyWith(color: AppColors.black,fontWeight: FontWeight.w600),
        ),
        Text(
          "Password: $password",
          style: context.theme.textTheme.bodyLarge?.copyWith(color: AppColors.black,fontWeight: FontWeight.w600,),
        ),
      ],
    );
}