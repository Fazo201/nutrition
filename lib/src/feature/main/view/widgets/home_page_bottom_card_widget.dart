import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/style/app_colors.dart";

class HomePageBottomCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double time;
  final String owner;
  final String profilImgUrl;

  const HomePageBottomCardWidget({
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.owner,
    required this.profilImgUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Stack(
        alignment: const Alignment(1, 0.8),
        children: [
          SizedBox(
            height: 100.h,
            width: 251.w,
            child: MaterialButton(
              padding: REdgeInsets.all(10),
              minWidth: 251.w,
              height: 100.h,
              color: Colors.white,
              elevation: 1,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              onPressed: () {
                context.go("${AppRouteNames.home}/${AppRouteNames.foodDetails}");
                // log('got to next page home page botton card');
              },
              child: Padding(
                padding: REdgeInsets.all(0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.c484848,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          5.verticalSpace,
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 12.h,
                              ),
                            ),
                          ),
                          15.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 10.r,
                                    backgroundImage: Image.asset(profilImgUrl).image,
                                  ),
                                  8.horizontalSpace,
                                  Text(
                                    owner,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColors.cA9A9A9,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/timer_in_card_icon.svg"),
                                  5.horizontalSpace,
                                  Text(
                                    "$time mins",
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.cA9A9A9,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 10,
            child: SizedBox(
              height: 86,
              width: 86,
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
        ],
      );
}
