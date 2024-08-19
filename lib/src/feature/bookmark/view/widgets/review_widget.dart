import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "../../vm/review_vm.dart";

class ReviewWidget extends ConsumerWidget {
  final int reviewIndex;

  const ReviewWidget({
    required this.reviewIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(reviewVM);

    final review = ref.watch(reviewVM.notifier).reviews[reviewIndex];

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/default_profile_image.png",
                    image: review.profileImage ??
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/2048px-Default_pfp.svg.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              9.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.name,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.c121212,
                      fontFamily: "Poppins",
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    review.date,
                    style: context.theme.textTheme.labelSmall?.copyWith(
                      fontSize: 11.sp,
                      color: AppColors.cA9A9A9,
                      fontFamily: "Poppins",
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
              review.comment,
              style: context.theme.textTheme.labelSmall?.copyWith(
                fontSize: 17.sp,
                color: AppColors.c484848,
                fontFamily: "Poppins",
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
                      color: ref.read(reviewVM).isLiked(reviewIndex) == true
                          ? AppColors.c71B1A1
                          : AppColors.cDBEBE7,
                      borderRadius: BorderRadius.all(Radius.circular(17.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "👍",
                          style: context.theme.textTheme.labelSmall?.copyWith(
                            fontSize: 15.sp,
                            fontFamily: "Poppins",
                          ),
                        ),
                        Text(
                          ref.read(reviewVM).likeCount(reviewIndex).toString(),
                          style: context.theme.textTheme.labelSmall?.copyWith(
                            fontSize: 15.sp,
                            color: AppColors.c484848,
                            fontFamily: "Poppins",
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
                      color: ref.read(reviewVM).isLiked(reviewIndex) == false
                          ? AppColors.c71B1A1
                          : AppColors.cDBEBE7,
                      borderRadius: BorderRadius.all(Radius.circular(17.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "👎",
                          style: context.theme.textTheme.labelSmall?.copyWith(
                            fontSize: 15.sp,
                            fontFamily: "Poppins",
                          ),
                        ),
                        Text(
                          ref.read(reviewVM).dislikeCount(reviewIndex).toString(),
                          style: context.theme.textTheme.labelSmall?.copyWith(
                            fontSize: 15.sp,
                            color: AppColors.c484848,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}
