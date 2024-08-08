import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
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
            height: 95.h,
            width: 251.w,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.1), // Semi-transparent black
                    // spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.1), // Semi-transparent black
                    // spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Padding(
                padding: REdgeInsets.all(10),
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
                                  8.verticalSpace,
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
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      );
}
