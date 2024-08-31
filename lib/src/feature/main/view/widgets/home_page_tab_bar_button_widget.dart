import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";

class HomePageTabBarButtonWidget extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;
  final String text;
  const HomePageTabBarButtonWidget({
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialButton(
        height: 31.h,
        minWidth: 54.w,
        elevation: 0,
        highlightElevation: 0,
        padding: REdgeInsets.symmetric(horizontal: 20, vertical: 7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        color: buttonColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: context.textTheme.titleSmall!.copyWith(color: textColor),
        ),
      );
}
