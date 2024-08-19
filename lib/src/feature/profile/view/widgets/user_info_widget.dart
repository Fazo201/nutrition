import "package:flutter/material.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "../../../../core/style/app_colors.dart";


class UserInfoWidget extends StatelessWidget {

 final  String? userEmail;
 final  String? userPassword;
   const UserInfoWidget({super.key,this.userEmail, this.userPassword});

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          "${context.localized.email}: ${userEmail != null? userEmail! : context.localized.user_email}",
          style: context.theme.textTheme.bodyLarge?.copyWith(color: AppColors.black,fontWeight: FontWeight.w600),
        ),
        Text(
          "${context.localized.password}: ${userEmail != null? userPassword! : context.localized.user_password}",
          style: context.theme.textTheme.bodyLarge?.copyWith(color: AppColors.black,fontWeight: FontWeight.w600,),
        ),
      ],
    );
}
