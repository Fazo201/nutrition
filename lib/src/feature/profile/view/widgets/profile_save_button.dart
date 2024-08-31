import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "../../../../core/style/app_colors.dart";

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.c129575,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          fixedSize: const Size(double.maxFinite, 60),
        ),
        onPressed: () => {
          // log("save"),
          onPressed!(),
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localized.save,
              style: context.theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                fontFamily: "Poppins",
                color: AppColors.white,
              ),
            ),
          ],
        ),
      );
}
