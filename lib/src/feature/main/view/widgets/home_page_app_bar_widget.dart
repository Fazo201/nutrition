import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/feature/main/view/widgets/home_page_tab_bar_button_widget.dart";
import "package:nutrition/src/feature/main/view_model/home_vm.dart";

class HomePageAppBar extends ConsumerWidget {
  final String? imgPath;

  const HomePageAppBar({
    required this.imgPath,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          20.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${context.localized.homePageHello} Jega",
                        style: context.textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      5.verticalSpace,
                      Text(
                        context.localized.homePageWhatAreYouCookingToday,
                        style: context.textTheme.bodySmall,
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image(
                        image: profileImage(profileImagePath: imgPath)!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          30.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40.h,
                    child: TextField(
                      keyboardType: TextInputType.none,
                      onTap: () {
                        context.go("${AppRouteNames.home}/${AppRouteNames.search}", extra: true);
                      },
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.theme.colorScheme.onSurface,
                      ),
                      cursorColor: context.theme.colorScheme.onSurface,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: REdgeInsets.symmetric(vertical: 10),
                          child: SvgPicture.asset("assets/icons/search_in_textfield_icon.svg"),
                        ),
                        hintText: context.localized.homePageSearchText,
                        // hintStyle:  TextStyle(color: ),
                        hintStyle: context.textTheme.labelSmall,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: context.theme.colorScheme.outline,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: context.theme.colorScheme.outline,
                          ),
                        ),
                        contentPadding: REdgeInsets.symmetric(vertical: 12),
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
                      color: context.theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
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
              ],
            ),
          ),
          15.verticalSpace,
          SizedBox(
            height: 51.h,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: ref.read(homeVM).tabBarItems.length,
              padding: REdgeInsets.symmetric(horizontal: 30, vertical: 10),
              separatorBuilder: (BuildContext context, int index) => 5.horizontalSpace,
              itemBuilder: (ctx, i) => HomePageTabBarButtonWidget(
                buttonColor: ref.watch(homeVM).currentIndex == i ? context.theme.colorScheme.primary : context.theme.colorScheme.surface,
                textColor: ref.watch(homeVM).currentIndex == i ? context.theme.colorScheme.onPrimary : context.theme.colorScheme.primaryFixed,
                onPressed: () {
                  ref.read(homeVM).changeTapBar(i);
                },
                text: ref.watch(homeVM).tabBarItems[i],
              ),
            ),
          ),
          14.verticalSpace,
        ],
      );
}

ImageProvider<Object>? profileImage({
  String? profileImagePath,
}) =>
    profileImagePath != null
        ? Image.file(File(profileImagePath)).image
        : const AssetImage(
            "assets/images/default_profile_image.png",
          );
