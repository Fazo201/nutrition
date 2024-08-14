import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "../../../../core/style/app_colors.dart";

class NotificationCardWidget extends StatelessWidget{

  const NotificationCardWidget();

  @override
  Widget build(BuildContext context) => Padding(
    padding: REdgeInsets.symmetric(vertical: 10, horizontal: 5),
    child: SizedBox(
      width: 315.w,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.cD9D9D9,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "New Recipe Alert!",
                      style: context.theme.textTheme.labelSmall?.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.c121212,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 28.h,
                      width: 28.w,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.cFFE1B3,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: SvgPicture.asset("assets/icons/reviews_icon_wich_has_not_read.svg"),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Lorem Ipsum ut labore et dolore,in voluptate velit esse cillum",
                  style: context.theme.textTheme.labelSmall?.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.cA9A9A9,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "30 mins ago",
                      style: context.theme.textTheme.labelSmall?.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c797979,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
  );
}
