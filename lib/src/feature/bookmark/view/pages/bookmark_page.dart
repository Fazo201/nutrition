import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition/src/core/style/app_colors.dart';
import 'package:nutrition/src/core/style/text_style.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved recipes", style: const AppTextStyle().appBarText),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 150,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/all_post_image.png")
                  )
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("spice roasted chicken with flavored rice",
                            style: const AppTextStyle().recipeBoxMain,
                          ),
                          const SizedBox(height: 6),
                          Text("By Mark Kelvin",
                            style: const AppTextStyle().recipeReviews,
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 52,
                          height: 22,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.cFFE1B3
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset("assets/icons/star_selected_icon.svg", height: 14, width: 14),
                                const Text("4.0")
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [

                            const SizedBox(width: 5),
                            Text("20 min", style: const AppTextStyle().recipeBoxMain),
                            const SizedBox(width: 5),
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/icons/recipe_bottom_navigation_bar_icon.svg",
                                    // ignore: deprecated_member_use
                                    color: Colors.green,
                                    width: 16,
                                    height: 16
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
