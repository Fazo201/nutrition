import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/color_schema.dart";
import "package:nutrition/src/core/widgets/app_material_context.dart";

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget();

  @override
  Widget build(BuildContext context) => Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: SizedBox(
          width: 315.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.theme.colorScheme.surfaceBright,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          context.localized.new_recipes_alert,
                          style: context.textTheme.titleSmall?.copyWith(
                            color: themeController.isLight ? lightColorScheme.onSurface : darkColorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 28.h,
                        width: 28.w,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: SvgPicture.asset("assets/icons/reviews_icon_wich_has_not_read.svg"),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Lorem Ipsum ut labore et dolore,in voluptate velit esse cillum",
                    style: context.textTheme.bodySmall,
                  ),
                  5.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "30 mins ago",
                        style: context.textTheme.labelLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
