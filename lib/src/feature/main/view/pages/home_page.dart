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
          child: const HomePageAppBar(
              // ctx: context,
              ),
        ),
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // custom tabbar
              10.verticalSpace,
              SizedBox(
                height: 60.h,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: ref.read(homeVM).tabBarItems.length,
                  padding: REdgeInsets.symmetric(horizontal: 30, vertical: 4),
                  separatorBuilder: (BuildContext context, int index) => SizedBox(width: 5.w),
                  itemBuilder: (ctx, i) => MaterialButton(
                    height: 31.h,
                    minWidth: 54.w,
                    elevation: 0,
                    highlightElevation: 0,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    padding: REdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: ref.watch(homeVM).currentIndex == i ? AppColors.c129575 : AppColors.white,
                    onPressed: () {
                      ref.read(homeVM).changeTapBar(i);
                    },
                    child: Text(
                      ref.watch(homeVM).tabBarItems[i],
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: ref.watch(homeVM).currentIndex == i ? AppColors.white : AppColors.c71B1A1,
                      ),
                    ),
                  ),
                ),
              ),

              // home page main cards
              20.verticalSpace,
              SizedBox(
                height: 231.h,
                width: double.infinity,
                child: Center(
                  child: ListView.separated(
                    padding: REdgeInsets.symmetric(horizontal: 30),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) => const HomePageMainCardWidget(
                      imageUrl: "assets/images/food_card.png",
                      title: "Classic Greek Salad",
                      time: "15 Mins",
                      rating: 4.5,
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
                  "New Recipes",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // home page bottom card
              5.verticalSpace,
              SizedBox(
                height: 130.h,
                width: double.infinity,
                child: ListView.separated(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  padding: REdgeInsets.symmetric(horizontal: 30),
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
