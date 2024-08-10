import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "../../../../core/style/app_colors.dart";

class NotificationPageTabWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final int index;
  final void Function() onPressed;

  const NotificationPageTabWidget({
    required this.text,
    required this.isSelected,
    required this.onPressed,
    required this.index,
  });

  @override
  Widget build(BuildContext context) => MaterialButton(
        onPressed: onPressed,
        color: isSelected ? AppColors.c129575 : AppColors.white,
        elevation: 0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        child: Text(
          text,
          style: context.theme.textTheme.labelSmall?.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppColors.white : AppColors.c71B1A1,
          ),
        ),
      );
}
