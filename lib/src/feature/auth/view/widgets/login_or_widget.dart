import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import '../../../../core/style/app_colors.dart';

class LoginOrWidget extends StatelessWidget {
  const LoginOrWidget({super.key});

  @override
  Widget build(BuildContext context) => Row(
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
            context.localized.orWith,
            style: context.theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 11.sp,
              fontFamily: "Poppins",
              color: AppColors.cD9D9D9,
            ),
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
