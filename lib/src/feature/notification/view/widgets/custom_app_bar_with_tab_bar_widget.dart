import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
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
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          padding: REdgeInsets.symmetric(horizontal: 20),
          indicator: BoxDecoration(
            color: context.theme.colorScheme.primary,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          labelColor: context.theme.colorScheme.onPrimary,
          labelStyle: context.textTheme.bodyMedium,
          unselectedLabelStyle: context.textTheme.bodyMedium?.copyWith(
            color: context.theme.colorScheme.primaryFixedDim,
          ),
          tabs: tabs,
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
