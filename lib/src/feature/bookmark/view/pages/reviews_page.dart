import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/feature/bookmark/vm/review_vm.dart";
import "../widgets/review_page_text_field_widget.dart";
import "../widgets/review_widget.dart";

class ReviewsPage extends ConsumerWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref.watch(reviewVM.notifier).reviews;
    final isLoading = reviews.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localized.reviews,
          style: context.textTheme.titleLarge?.copyWith(
            color: context.theme.colorScheme.surfaceDim,
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
                  style: context.textTheme.bodySmall,
                ),
                Text(
                  "${reviews.length} ${context.localized.comments}",
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
            10.verticalSpace,
            SafeArea(
              child: ReviewPageTextFieldWidget(
                commentC: ref.watch(reviewVM).commentC,
                onPressed: () {
                  ref.read(reviewVM).addReview();
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            15.verticalSpace,
            Expanded(
              child: isLoading
                  ? Center(
                      child: SvgPicture.asset("assets/images/write_a_review_image_when_list_is_empty.svg", height: 250.h),
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
