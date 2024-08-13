import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/feature/main/view_model/home_vm.dart";
import "package:nutrition/src/feature/settings/inherited_locale_notifier.dart";
import "package:nutrition/src/feature/settings/locale_controller.dart";

import "../widgets/home_page_app_bar_widget.dart";
import "../widgets/home_page_bottom_card_widget.dart";
import "../widgets/home_page_main_card_widget.dart";

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("\n\nHomePage\n\n");
    return Scaffold(
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

            IconButton(
              onPressed: (){
                InheritedLocalNotifier.maybeOf(context)?.changeLocal(LangCodes.en);
              },
              icon: const Text("En"),
            ),

            IconButton(
              onPressed: (){
                InheritedLocalNotifier.maybeOf(context)?.changeLocal(LangCodes.ru);
              },
              icon: const Text("Ru"),
            ),

            IconButton(
              onPressed: (){
                InheritedLocalNotifier.maybeOf(context)?.changeLocal(LangCodes.uz);
              },
              icon: const Text("Uz"),
            ),



            // custom tabbar
            SizedBox(
              height: 51.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: ref.read(homeVM).tabBarItems.length,
                padding: REdgeInsets.symmetric(horizontal: 30, vertical: 10),
                separatorBuilder: (BuildContext context, int index) => SizedBox(width: 5.w),
                itemBuilder: (ctx, i) => MaterialButton(
                  height: 31.h,
                  minWidth: 54.w,
                  elevation: 0,
                  highlightElevation: 0,
                  padding: REdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
            15.verticalSpace,
            SizedBox(
              height: 231.h,
              width: double.infinity,
              child: Center(
                child: ListView.separated(
                  padding: REdgeInsets.symmetric(horizontal: 30),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) => HomePageMainCardWidget(
                    imageUrl: "assets/images/food_card.png",
                    title: context.localized.helloWorld,
                    time: "15 Mins",
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
              height: 144.h,
              width: double.infinity,
              child: ListView.separated(
                itemCount: 4,
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
