import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/app_colors.dart';
import 'package:nutrition/src/core/style/text_style.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
              ),
              const SizedBox(width: 9),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bella Throne",
                    // style: const AppTextStyle().homeAll?.copyWith(
                    //       color: AppColors.c121212,
                    //     ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "June 12, 2020 - 19:35",
                    // style: const AppTextStyle().searchFilter?.copyWith(
                    //       color: AppColors.cA9A9A9,
                    //     ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),
          Expanded(
            flex: 0,
            child: Text(
              "Lorem Ipsum tempor incididunt ut labore et dolore, inise voluptate velit esse cillum",
              // style: const AppTextStyle().loginEnter?.copyWith(
              //       color: AppColors.c484848,
              //     ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                width: 55,
                height: 30,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color(0xff71B1A1),
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "👍",
                        // style: const AppTextStyle().searchByChef,
                      ),
                      Text(
                        "9",
                        // style: const AppTextStyle().searchByChef?.copyWith(
                        //       color: AppColors.c484848,
                        //     ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 55,
                height: 30,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color(0xffDBEBE7),
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "👎",
                        // style: const AppTextStyle().searchByChef,
                      ),
                      Text(
                        "2",
                        // style: const AppTextStyle().searchByChef?.copyWith(
                        //       color: AppColors.c484848,
                        //     ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
