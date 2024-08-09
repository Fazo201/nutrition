import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "../../vm/review_vm.dart";

class ActionModel {
  late String id;
  late bool action; // true= liked, false = disliked
  ActionModel({
    required this.action,
    required this.id,
  });
}

class ReviewWidget extends ConsumerWidget {
  final String name;
  final String date;
  final String comment;
  final int reviewIndex;
  String selected;
  List<ActionModel> actions;
  final Image profileImage;

  ReviewWidget({
    required this.name,
    required this.date,
    required this.comment,
    required this.reviewIndex,
    required this.profileImage,
    required this.actions,
    this.selected = "",
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(reviewVM);
    return SizedBox(
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
              GestureDetector(
                onTap: () {
                  ref.read(reviewVM).hasLikePressed(reviewIndex);
                },
                child: SizedBox(
                  width: 55.w,
                  height: 30.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: ref.read(reviewVM).isLiked(reviewIndex)! == true ? AppColors.c71B1A1 : AppColors.cDBEBE7,
                      borderRadius: BorderRadius.all(Radius.circular(17.r)),
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
                          ref.read(reviewVM).likeCount(reviewIndex).toString(),
                          style: context.theme.textTheme.labelSmall?.copyWith(
                            fontSize: 15.sp,
                            color: AppColors.c484848,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
              GestureDetector(
                onTap: () {
                  ref.read(reviewVM).hasDislikePressed(reviewIndex);
                },
                child: SizedBox(
                  width: 55.w,
                  height: 30.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: ref.read(reviewVM).isLiked(reviewIndex) == false ? AppColors.c71B1A1 : AppColors.cDBEBE7,
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
                          ref.read(reviewVM).dislikeCount(reviewIndex).toString(),
                          style: context.theme.textTheme.labelSmall?.copyWith(
                            fontSize: 15.sp,
                            color: AppColors.c484848,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
