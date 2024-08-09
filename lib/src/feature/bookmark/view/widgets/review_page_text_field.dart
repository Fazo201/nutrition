import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";

import "../../../../core/style/app_colors.dart";

class ReviewPageTextField extends StatelessWidget{

  final TextEditingController commentC;

  const ReviewPageTextField({
    required this.commentC,
  });

  @override
  Widget build(BuildContext context) => TextField(
      controller: commentC,
      cursorColor: AppColors.black,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.cD9D9D9,
            width: 1.5.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.cD9D9D9,
            width: 1.5.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.cD9D9D9,
            width: 1.5.w,
          ),
        ),
        hintText: "Say something...",
        hintStyle: context.theme.textTheme.labelSmall?.copyWith(
          fontSize: 14.sp,
          color: AppColors.cD9D9D9,
        ),
      ),
    );
}