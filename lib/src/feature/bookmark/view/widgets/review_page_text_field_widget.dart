import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/feature/bookmark/view/widgets/review_send_button_widget.dart";

class ReviewPageTextFieldWidget extends StatelessWidget {
  final TextEditingController commentC;
  final void Function() onPressed;

  const ReviewPageTextFieldWidget({
    required this.commentC,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => TextField(
        controller: commentC,
        cursorColor: context.theme.colorScheme.onSurface,
        style: context.textTheme.bodySmall?.copyWith(
          color: context.theme.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: context.theme.colorScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: context.theme.colorScheme.outline,
              width: 1.5.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: context.theme.colorScheme.outline,
              width: 1.5.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: context.theme.colorScheme.outline,
              width: 1.5.w,
            ),
          ),
          hintText: context.localized.say_something,
          hintStyle: context.textTheme.labelSmall,
          suffixIcon: ReviewSendButtonWidget(
            text: context.localized.send,
            onPressed: onPressed,
          ),
          suffixIconConstraints: BoxConstraints(
            maxHeight: 40.h,
          ),
        ),
      );
}
