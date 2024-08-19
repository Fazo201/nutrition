import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "../../../../core/style/app_colors.dart";

class ReviewSendButtonWidget extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const ReviewSendButtonWidget({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: REdgeInsets.only(right: 10),
    child: MaterialButton(
          color: AppColors.c129575,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          height: 35.h,
          minWidth: 59.w,
          onPressed: onPressed,
          child: Text(
            text,
            style: context.theme.textTheme.labelSmall?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontFamily: "Poppins",
            ),
          ),
        ),
  );
}
