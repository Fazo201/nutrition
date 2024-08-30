import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/widgets/app_material_context.dart";
import "package:nutrition/src/feature/bookmark/vm/review_vm.dart";
import "package:shimmer/shimmer.dart";
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localized.reviews,
              style: context.textTheme.titleLarge?.copyWith(
                color: context.theme.colorScheme.surfaceDim,
              ),
            ),
            IconButton(
              onPressed: () {
                themeController.switchTheme();
              },
              icon: const Icon(Icons.dark_mode_outlined),
            ),
          ],
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
                  ? ListView.separated(
                      itemCount: 10,
                      itemBuilder: (_, index) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: SizedBox(
                          height: 95.h,
                          child: DecoratedBox(
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
                      ),
                      separatorBuilder: (_, __) => 10.verticalSpace,
                    )
                  : ListView.builder(
                      itemCount: reviews.length,
                      itemBuilder: (_, index) => reviews.isEmpty
                          ? Center(
                              child: SvgPicture.asset("assets/images/write_a_review_image_when_list_is_empty.svg"),
                            )
                          : ReviewWidget(
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
