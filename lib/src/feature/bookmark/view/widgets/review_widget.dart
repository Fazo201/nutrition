import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
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
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    review.date,
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: context.theme.colorScheme.onSurfaceVariant,
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
              style: context.textTheme.bodySmall?.copyWith(
                color: context.theme.colorScheme.onSurface,
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
                      color: true == ref.read(reviewVM).isLiked(reviewIndex)
                          ? context.theme.colorScheme.primaryFixed
                          : context.theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.all(Radius.circular(17.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "👍",
                          style: context.textTheme.headlineMedium,
                        ),
                        Text(
                          ref.read(reviewVM).likeCount(reviewIndex).toString(),
                          style: context.textTheme.headlineMedium,
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
                          ? context.theme.colorScheme.primaryFixed
                          : context.theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.all(Radius.circular(17.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "👎",
                          style: context.textTheme.headlineMedium,
                        ),
                        Text(
                          ref.read(reviewVM).dislikeCount(reviewIndex).toString(),
                          style: context.textTheme.headlineMedium,
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
