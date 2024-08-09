import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/feature/bookmark/vm/review_vm.dart";
import "../../../../core/style/app_colors.dart";
import "../widgets/review_page_text_field.dart";

class ReviewsPage extends ConsumerWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(reviewVM.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          "Reviews",
          style: context.theme.textTheme.labelLarge?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Leave a comment",
                  style: context.theme.textTheme.labelSmall?.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  "Comments: ${ref.read(reviewVM).reviewWidgetList.length}",
                  style: context.theme.textTheme.labelSmall?.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            SafeArea(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  ReviewPageTextField(
                    commentC: ref.read(reviewVM).commentC,
                  ),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: MaterialButton(
                      color: AppColors.c129575,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      height: 35.h,
                      minWidth: 59.w,
                      onPressed: () {
                        ref.read(reviewVM).addReview(context);
                        FocusScope.of(context).unfocus();
                      },
                      child: Text(
                        "Send",
                        style: context.theme.textTheme.labelSmall?.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ref.read(reviewVM).reviewWidgetList.length,
                itemBuilder: (_, index) => ref.read(reviewVM).reviewWidgetList[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
