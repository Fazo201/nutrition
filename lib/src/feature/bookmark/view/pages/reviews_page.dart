import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/style/text_style.dart";
import "package:nutrition/src/feature/bookmark/vm/review_vm.dart";
import "../../../../core/style/app_colors.dart";
import "../widgets/review_widget.dart";

class ReviewPage extends ConsumerWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Reviews",
          // style: ,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "200 Comments",
                  // style: const AppTextStyle().recipeReviews?.copyWith(
                  //   color: AppColors.cA9A9A9,
                  // ),
                ),
                Text(
                  "155 Saved",
                  // style: const AppTextStyle().recipeReviews?.copyWith(
                  //   color: AppColors.cA9A9A9,
                  // ),
                ),
              ],
            ),
            10.verticalSpace,
            Row(
              children: [
                Text(
                  "Leave a comment",
                  // style: const AppTextStyle().loginEmail?.copyWith(
                  //   color: AppColors.c121212,
                  // ),
                ),
              ],
            ),
            10.verticalSpace,
            SafeArea(
              child: TextField(
                controller: ref.watch(reviewVM).commentC,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: AppColors.cD9D9D9,
                      width: 1.5.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: AppColors.cD9D9D9,
                      width: 1.5.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: AppColors.cD9D9D9,
                      width: 1.5.w,
                    ),
                  ),
                  hintText: "Say something...",
                  // hintStyle: const AppTextStyle().loginEnter,
                ),
              ),
            ),
            15.verticalSpace,
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, __) => const ReviewWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
