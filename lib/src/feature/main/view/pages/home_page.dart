import "dart:developer";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/feature/main/view_model/home_vm.dart";
import "package:nutrition/src/feature/profile/view_model/profile_vm.dart";
import "../widgets/home_page_app_bar_widget.dart";
import "../widgets/home_page_bottom_card_widget.dart";
import "../widgets/home_page_main_card_widget.dart";

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("home");
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(224.h),
          child: HomePageAppBar(
            imgPath: ref.watch(profileVM).profileImagePath,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // home page main cards
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
                    separatorBuilder: (BuildContext context, int index) => 15.horizontalSpace,
                  ),
                ),
              ),

              // home page text
              20.verticalSpace,
              Padding(
                padding: REdgeInsets.only(left: 30),
                child: Text(
                  context.localized.homePageNewRecipes,
                  style: context.textTheme.titleMedium,
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
                  separatorBuilder: (BuildContext context, int index) => 15.horizontalSpace,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
