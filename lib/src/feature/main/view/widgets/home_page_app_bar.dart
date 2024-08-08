import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:nutrition/src/core/style/app_colors.dart";

import "../pages/search_recipes_page.dart";

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: REdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Jega",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      5.verticalSpace,
                      Text(
                        "What are you cooking today?",
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.cFFCE80,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40.h,
                    child: TextField(
                      keyboardType: TextInputType.none,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchRecipesPage()));
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search recipe",
                        hintStyle: const TextStyle(color: AppColors.cD9D9D9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(color: AppColors.cD9D9D9),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(color: AppColors.cD9D9D9),
                        ),
                        contentPadding: REdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
                20.horizontalSpace,
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.c129575,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchRecipesPage()));
                      },
                      child: Padding(
                        padding: REdgeInsets.all(8),
                        child: SvgPicture.asset(
                          "assets/icons/filter_icon.svg",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            15.verticalSpace,
          ],
        ),
      );
}
