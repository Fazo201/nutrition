import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";

class ReviewSendButtonWidget extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const ReviewSendButtonWidget({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: REdgeInsets.only(left: 14, right: 8),
        child: MaterialButton(
          onPressed: onPressed,
          elevation: 0,
          color: context.theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            text,
            style: context.textTheme.bodyMedium,
          ),
        ),
      );
}
