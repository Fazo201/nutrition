import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/feature/bookmark/vm/review_vm.dart";
import "package:shimmer/shimmer.dart";

import "../../../../core/style/app_colors.dart";
import "../widgets/review_page_text_field_widget.dart";
import "../widgets/review_send_button_widget.dart";
import "../widgets/review_widget.dart";

class ReviewsPage extends ConsumerWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref.watch(reviewVM.notifier).reviews;
    final isLoading = reviews.isEmpty;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          context.localized.reviews,
          style: context.theme.textTheme.labelLarge?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
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
                  context.localized.leave_a_comment,
                  style: context.theme.textTheme.labelSmall?.copyWith(
                    fontSize: 14.sp,
                    fontFamily: "Poppins",
                  ),
                ),
                Text(
                  "${reviews.length} ${context.localized.comments}",
                  style: context.theme.textTheme.labelSmall?.copyWith(
                    fontSize: 14.sp,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            SafeArea(
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  ReviewPageTextFieldWidget(
                    commentC: ref.watch(reviewVM).commentC,
                  ),
                  ReviewSendButtonWidget(
                    text: context.localized.send,
                    onPressed: () {
                      ref.read(reviewVM).addReview();
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
            ),
            15.verticalSpace,
            Expanded(
              child: isLoading
                  ? ListView.builder(
                      itemCount: 10,
                      itemBuilder: (_, index) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          margin: REdgeInsets.symmetric(vertical: 8),
                          padding: REdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24.r,
                                backgroundColor: Colors.grey,
                              ),
                              16.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 12.h,
                                      width: 100.w,
                                      child: const DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    8.verticalSpace,
                                    SizedBox(
                                      height: 8.h,
                                      width: 150.w,
                                      child: const DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: reviews.length,
                      itemBuilder: (_, index) => ReviewWidget(
                        reviewIndex: index,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
