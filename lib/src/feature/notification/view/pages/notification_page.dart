import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/style/text_style.dart";

class NotificationPage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(
      title: Text(
        "Notifications",
        style: context.textTheme.titleLarge?.copyWith(
          color: AppColors.c121212,
          fontSize: FontSize.size18,
          fontWeight: FontWeight.w600,
       ),
      ),
      centerTitle: true,
    ),
    body: ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) => SizedBox(
        height: 92,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "New Recipe Alert!",
                      style: context.textTheme.labelSmall?.copyWith(
                        color: AppColors.c121212,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                    20.verticalSpace,
                    Text(
                      "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum",
                      style: context.textTheme.labelSmall?.copyWith(
                        fontSize: FontSize.size11,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "10 mins ago",
                      style: context.textTheme.labelSmall?.copyWith(fontSize: 7),
                    )
                  ],
                ),
              ),
              Align(
                alignment: const Alignment(0.9, -0.9),
                child: SvgPicture.asset("assets/icons/notication_page_icon.svg"),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
