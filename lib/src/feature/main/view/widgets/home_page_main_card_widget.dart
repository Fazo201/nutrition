import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/style/app_colors.dart";

class HomePageMainCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final double rating;

  const HomePageMainCardWidget({
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: 150.w,
            height: 176.h,
            child: MaterialButton(
              minWidth: 150.w,
              height: 176.h,
              color: AppColors.cD9D9D9,
              padding: REdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              onPressed: () {
                context.go("${AppRouteNames.homePage}/${AppRouteNames.foodDetailsPage}");
                log("go to food deatil page home page main card");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 130.w,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.c484848,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(
                          color: AppColors.cA9A9A9,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      5.verticalSpace,
                      Text(
                        time,
                        style: TextStyle(
                          color: AppColors.c484848,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              height: 110.h,
              width: 110.w,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  imageUrl,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 14.h,
            right: 14.w,
            child: InkWell(
              onDoubleTap: () {},
              // padding: EdgeInsets.all(0),
              child: SvgPicture.asset("assets/icons/bookmark_icon.svg"),
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
            child: RatingCard(rating: rating),
          ),
        ],
      );
}

class RatingCard extends StatelessWidget {
  final double rating;
  const RatingCard({super.key, required this.rating});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 45.w,
        height: 23.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.cFFE1B3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                "assets/icons/star_selected_icon.svg",
                height: 10.h,
              ),
              Text(
                "$rating",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
}
