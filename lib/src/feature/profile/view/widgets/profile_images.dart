import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition/src/core/style/app_colors.dart';
import 'package:nutrition/src/core/style/text_style.dart';

class  ImagesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      width: double.infinity,
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
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
                child: Stack(
                  children: [
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black54,
                            Colors.black,
                          ],
                        ),
                      ),
                      child: Center(),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Traditional spare ribs\n baked",
                                style: const AppTextStyle().recipeBoxMain,
                              ),
                              const SizedBox(height: 6),
                              Text("By Chef John",
                                style: const AppTextStyle().recipeReviews?.copyWith(fontSize: 8 ),
                              ),
                              const SizedBox(height: 10),
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
                                SvgPicture.asset("assets/icons/timer_in_card_icon.svg"),
                                const SizedBox(width: 5),
                                Text("20 min", style: const AppTextStyle().recipeReviews?.copyWith(color: AppColors.cD9D9D9),),
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
                            const SizedBox(height: 10),
                          ],
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
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
