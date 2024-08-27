import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "../../../../core/style/app_colors.dart";

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({
    required this.userName, super.key,
  });
 final  String? userName;
  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          userName != null? userName! : context.localized.user_name,
          style: context.theme.textTheme.labelLarge?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,),
        ),
      );
}
