import 'package:flutter/material.dart';
import "package:nutrition/src/core/constants/context_extension.dart";
import 'package:nutrition/src/core/style/text_style.dart';
import '../../../../core/style/app_colors.dart';
import '../widgets/review_widget.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // style: context.textTheme.recipeReviews?.copyWith(
                  //   color: AppColors.cA9A9A9,
                  // ),
                ),
                Text(
                  "200 Comments",
                  // style: const AppTextStyle().recipeReviews?.copyWith(
                  //       color: AppColors.cA9A9A9,
                  //     ),
                ),
              ],
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (_, __) {
                return const ReviewWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
