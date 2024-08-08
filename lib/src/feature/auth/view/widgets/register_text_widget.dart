import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "../../../../core/style/app_colors.dart";

class RegisterTextWidget extends StatelessWidget {
  final String text;

  const RegisterTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: context.theme.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          fontFamily: "Poppins",
          color: AppColors.c121212,
        ),
      );
}
