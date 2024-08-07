import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/src/core/style/text_style.dart';
import 'package:nutrition/src/feature/review/view_model/vm/review_vm.dart';
import '../../../../core/style/app_colors.dart';
import '../widgets/review_widget.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Reviews",
          // style: const AppTextStyle().appBarText,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "200 Comments",
                  style: const AppTextStyle().recipeReviews?.copyWith(
                    color: AppColors.cA9A9A9,
                  ),
                ),
                Text(
                  "155 Saved",
                  style: const AppTextStyle().recipeReviews?.copyWith(
                    color: AppColors.cA9A9A9,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Leave a comment",
              style: const AppTextStyle().loginEmail?.copyWith(
                color: AppColors.c121212,
              ),
            ),
            const SizedBox(height: 10),
            SafeArea(
              child: TextField(
                controller: ref.watch(reviewVM).commentC,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.cD9D9D9,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.cD9D9D9,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.cD9D9D9,
                      width: 2,
                    ),
                  ),
                  hintText: "Say something...",
                  hintStyle: const AppTextStyle().loginEnter,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, __) {
                  return const ReviewWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
