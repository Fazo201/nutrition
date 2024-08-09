import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/app_colors.dart";

class ReviewWidget extends StatelessWidget {

  final String name;
  final String date;
  final String comment;
  final int likeCount;
  final int disLikeCount;
  final Image profileImage;

  const ReviewWidget({required this.name, required this.date, required this.comment, required this.likeCount, required this.disLikeCount, super.key, required this.profileImage});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 200.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 26.r,
              child: profileImage,
            ),
            9.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.c121212,
                  ),
                ),
                2.verticalSpace,
                Text(
                  date,
                  style: context.theme.textTheme.labelSmall?.copyWith(
                    fontSize: 11.sp,
                    color: AppColors.cA9A9A9,
                  ),
                ),
              ],
            ),
          ],
        ),
        18.verticalSpace,
        Expanded(
          flex: 0,
          child: Text(
            comment,
            style: context.theme.textTheme.labelSmall?.copyWith(
              fontSize: 17.sp,
              color: AppColors.c484848,
            ),
          ),
        ),
        10.verticalSpace,
        Row(
          children: [
            SizedBox(
              width: 55.w,
              height: 30.h,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xff71B1A1),
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "👍",
                      style: context.theme.textTheme.labelSmall?.copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      likeCount.toString(),
                      style: context.theme.textTheme.labelSmall?.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.c484848,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            10.horizontalSpace,
            SizedBox(
              width: 55.w,
              height: 30.h,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.cDBEBE7,
                  borderRadius: BorderRadius.all(Radius.circular(17.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "👎",
                      style: context.theme.textTheme.labelSmall?.copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      disLikeCount.toString(),
                      style: context.theme.textTheme.labelSmall?.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.c484848,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
