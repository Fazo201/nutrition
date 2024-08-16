import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/style/app_colors.dart";

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: REdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${context.localized.homePageHello} Jega",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      5.verticalSpace,
                      Text(
                        context.localized.homePageWhatAreYouCookingToday,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.cFFCE80,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40.h,
                    child: TextField(
                      keyboardType: TextInputType.none,
                      onTap: () {
                        context.go("${AppRouteNames.home}/${AppRouteNames.search}", extra: true);
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: REdgeInsets.symmetric(vertical: 10),
                          child: SvgPicture.asset("assets/icons/search_in_textfield_icon.svg"),
                        ),
                        hintText: context.localized.homePageSearchText,
                        hintStyle: const TextStyle(color: AppColors.cD9D9D9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(color: AppColors.cD9D9D9),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(color: AppColors.cD9D9D9),
                        ),
                        contentPadding: REdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
                20.horizontalSpace,
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.c129575,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: MaterialButton(
                        padding: REdgeInsets.all(0),
                        onPressed: () {
                          context.push("${AppRouteNames.home}/${AppRouteNames.search}", extra: false);
                        },
                        child: Padding(
                          padding: REdgeInsets.all(8),
                          child: SvgPicture.asset(
                            "assets/icons/filter_icon.svg",
                          ),
                        ),
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
