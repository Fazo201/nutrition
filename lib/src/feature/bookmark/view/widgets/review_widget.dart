import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/style/text_style.dart";

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 200.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 28.r,
            ),
            9.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bella Throne",
                  // style: const AppTextStyle().homeAll?.copyWith(
                  //   color: AppColors.c121212,
                  // ),
                ),
                2.verticalSpace,
                Text(
                  "June 12, 2020 - 19:35",
                  // style: const AppTextStyle().searchFilter?.copyWith(
                  //   color: AppColors.cA9A9A9,
                  // ),
                ),
              ],
            ),
          ],
        ),
        18.verticalSpace,
        Expanded(
          flex: 0,
          child: Text(
            "Lorem Ipsum tempor incididunt ut labore et dolore, inise voluptate velit esse cillum",
            // style: const AppTextStyle().loginEnter?.copyWith(
            //   color: AppColors.c484848,
            // ),
          ),
        ),
        10.verticalSpace,
        Row(
          children: [
            SizedBox(
              width: 55.w,
              height: 30.h,
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
                      //   color: AppColors.c484848,
                      // ),
                    ),
                  ],
                ),
              ),
            ),
            10.horizontalSpace,
            SizedBox(
              width: 55.w,
              height: 30.h,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.cDBEBE7,
                  borderRadius: BorderRadius.all(Radius.circular(17.r)),
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
                      //   color: AppColors.c484848,
                      // ),
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
