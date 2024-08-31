import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/widgets/raiting_card_widget.dart";

class HomePageMainCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final double rating;
  final bool isBookMarkPressed;
  final Function()? onTap;

  const HomePageMainCardWidget({
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.rating,
    required this.onTap,
    required this.isBookMarkPressed,
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
              color: context.theme.colorScheme.outline,
              elevation: 0,
              highlightElevation: 0,
              highlightColor: Colors.grey.shade400,
              padding: REdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              onPressed: () {
                context.go("${AppRouteNames.home}/${AppRouteNames.foodDetails}");
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
                      style: context.textTheme.titleMedium!.copyWith(color: AppColors.c484848),
                    ),
                  ),
                  20.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.localized.homePageTime,
                        style: context.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: context.theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      5.verticalSpace,
                      Text(
                        "$time ${context.localized.homePageTime2}",
                        style: context.textTheme.titleSmall!.copyWith(color: AppColors.c484848),
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
            bottom: 0.h,
            right: 0.w,
            child: IconButton(
              splashColor: Colors.blue,
              // padding: REdgeInsets.only(top: 5),
              // splashRadius: 50,
              onPressed: onTap,
              // padding: EdgeInsets.all(0),
              icon: !isBookMarkPressed
                  ? Container(
                      height: 24.h,
                      width: 24.w,
                      padding: REdgeInsets.all(3),
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: SvgPicture.asset(
                        "assets/icons/bookmark_icon_off.svg",
                      ),
                    )
                  : Container(
                      height: 24.h,
                      width: 24.w,
                      padding: REdgeInsets.all(4),
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: SvgPicture.asset(
                        "assets/icons/bookmark_icon_on.svg",
                      ),
                    ),
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
            child: RaitingCardWidget(rating: rating),
          ),
        ],
      );
}
