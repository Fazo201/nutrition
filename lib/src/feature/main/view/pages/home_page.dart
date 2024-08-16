import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/feature/main/view/widgets/home_page_tab_bar_button_widget.dart";
import "package:nutrition/src/feature/main/view_model/home_vm.dart";
import "../widgets/home_page_app_bar_widget.dart";
import "../widgets/home_page_bottom_card_widget.dart";
import "../widgets/home_page_main_card_widget.dart";

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: const HomePageAppBar(),
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom tabbar
            25.verticalSpace,
            SizedBox(
              height: 51.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: ref.read(homeVM).tabBarItems.length,
                padding: REdgeInsets.symmetric(horizontal: 30, vertical: 10),
                separatorBuilder: (BuildContext context, int index) => SizedBox(width: 5.w),
                itemBuilder: (ctx, i) => HomePageTabBarButtonWidget(
                  buttonColor: ref.watch(homeVM).currentIndex == i ? AppColors.c129575 : AppColors.white,
                  textColor: ref.watch(homeVM).currentIndex == i ? AppColors.white : AppColors.c71B1A1,
                  onPressed: () {
                    ref.read(homeVM).changeTapBar(i);
                  },
                  text: ref.watch(homeVM).tabBarItems[i],
                ),
              ),
            ),

            // home page main cards
            15.verticalSpace,
            SizedBox(
              height: 231.h,
              width: double.infinity,
              child: Center(
                child: ListView.separated(
                  padding: REdgeInsets.symmetric(horizontal: 30),
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) => HomePageMainCardWidget(
                    imageUrl: "assets/images/food_card.png",
                    title: context.localized.helloWorld,
                    time: "15",
                    rating: 4.5,
                    isBookMarkPressed: ref.watch(homeVM).isBookmarked(i),
                    onTap: () {
                      ref.read(homeVM.notifier).toggleBookmark(i);
                    },
                  ),
                  separatorBuilder: (BuildContext context, int index) => SizedBox(width: 15.w),
                ),
              ),
            ),

            // home page text
            20.verticalSpace,
            Padding(
              padding: REdgeInsets.only(left: 30),
              child: Text(
                context.localized.homePageNewRecipes,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // home page bottom card
            5.verticalSpace,
            SizedBox(
              height: 144.h,
              width: double.infinity,
              child: ListView.separated(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                padding: REdgeInsets.only(left: 30, bottom: 18, right: 30),
                itemBuilder: (_, i) => const HomePageBottomCardWidget(
                  imageUrl: "assets/images/food_card.png",
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
      ),
    );
  }
}
