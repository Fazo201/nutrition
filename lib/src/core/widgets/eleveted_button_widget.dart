import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";

import '../style/app_colors.dart';
import '../style/text_style.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const ElevatedButtonWidget({required this.text, super.key, this.onPressed});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.c129575,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fixedSize: const Size(double.maxFinite, 60),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: context.theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                fontFamily: "Poppins",
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 20),
            const Icon(Icons.arrow_forward_outlined),
          ],
        ),
      );
}
