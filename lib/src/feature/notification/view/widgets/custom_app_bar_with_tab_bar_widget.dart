import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/feature/settings/theme_controller.dart";
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
    backgroundColor: context.theme.colorScheme.surface,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(flex: 5),
            Text(
              context.localized.notification,
              style: context.theme.textTheme.bodyLarge?.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
              ),
            ),
            const Spacer(flex: 2),
            IconButton(
              onPressed: (){
                ThemeController().switchTheme();
              },
              icon: const Icon(Icons.dark_mode_outlined),
            ),
            const Spacer(),
            IconButton(
              onPressed: (){
              },
              icon: const Icon(Icons.light_mode_outlined),
            ),
            const Spacer(),
          ],
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
