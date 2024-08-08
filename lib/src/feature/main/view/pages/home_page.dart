import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/feature/main/view_model/home_vm.dart";

import "../widgets/home_page_app_bar_widget.dart";
import "../widgets/home_page_bottom_card_widget.dart";
import "../widgets/home_page_main_card_widget.dart";

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(157.h),
          child: const HomePageAppBar(),
        ),
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom tabbar
            Padding(
              padding: REdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: 51,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ref.read(homeVM).tabBarItems.length,
                  padding: REdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  itemBuilder: (ctx, i) => MaterialButton(
                    height: 31.h,
                    minWidth: 54.w,
                    elevation: 0,
                    padding: REdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: ref.watch(homeVM).curretIndex == i ? AppColors.c129575 : AppColors.white,
                    onPressed: () {
                      ref.read(homeVM).changeTapBar(i);
                    },
                    child: Text(
                      ref.watch(homeVM).tabBarItems[i],
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: ref.watch(homeVM).curretIndex == i ? AppColors.white : AppColors.c71B1A1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            15.verticalSpace,

            // home page main cards
            SizedBox(
              height: 231.h,
              width: double.infinity,
              child: ListView.separated(
                padding: REdgeInsets.symmetric(horizontal: 30),
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) => const HomePageMainCardWidget(
                  imageUrl: "https://www.freepnglogos.com/uploads/food-png/food-sutherland-foodservice-12.png",
                  title: "Classic Greek Salad",
                  time: "15 Mins",
                  rating: 4.5,
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(width: 15.w),
              ),
            ),

            20.verticalSpace,

            // home page text
            Padding(
              padding: REdgeInsets.only(left: 30),
              child: Text(
                "New Recipes",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            5.verticalSpace,

            // home page bottom card
            SizedBox(
              height: 130.h,
              width: double.infinity,
              child: ListView.separated(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                padding: REdgeInsets.symmetric(horizontal: 30),
                itemBuilder: (_, i) => const HomePageBottomCardWidget(
                  imageUrl: "https://www.freepnglogos.com/uploads/food-png/food-sutherland-foodservice-12.png",
                  title: "Steak with tomato...",
                  time: 20,
                  owner: "By James Milner",
                  profilImgUrl: "assets/images/mini_profile_image.png",
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(width: 15.w),
              ),
            ),
          ],
        ),
      );
}
