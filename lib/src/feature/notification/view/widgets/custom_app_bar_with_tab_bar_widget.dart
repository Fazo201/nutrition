import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "../../../../core/style/app_colors.dart";
import "custom_tab_widget.dart";

class CustomAppBarWithTabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final List<CustomTabWidget> tabs;

  const CustomAppBarWithTabBarWidget({
    required this.tabs,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(
          context.localized.notification,
          style: context.theme.textTheme.bodyLarge?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          padding: REdgeInsets.symmetric(horizontal: 20),
          indicator: BoxDecoration(
            color: AppColors.c129575,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          labelColor: AppColors.white,
          labelStyle: context.theme.textTheme.bodyLarge?.copyWith(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
          ),
          unselectedLabelColor: AppColors.c71B1A1,
          unselectedLabelStyle: context.theme.textTheme.bodyLarge?.copyWith(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
          ),
          tabs: tabs,
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
