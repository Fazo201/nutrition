import 'package:flutter/material.dart';
import "package:nutrition/src/core/constants/context_extension.dart";
import "../../../../core/style/app_colors.dart";


class UserInfoWidget extends StatelessWidget {

 final  String? userEmail;
 final  String? userPassword;
   UserInfoWidget({super.key,this.userEmail, this.userPassword});

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          "Email: ${userEmail != null? userEmail! : "User Name"}",
          style: context.theme.textTheme.bodyLarge?.copyWith(color: AppColors.black,fontWeight: FontWeight.w600),
        ),
        Text(
          "Password: ${userEmail != null? userPassword! : "User Pasword"}",
          style: context.theme.textTheme.bodyLarge?.copyWith(color: AppColors.black,fontWeight: FontWeight.w600,),
        ),
      ],
    );
}
