import "package:flutter/widgets.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:nutrition/src/core/style/app_colors.dart";

class RaitingCardWidget extends StatelessWidget {
  final double rating;
  const RaitingCardWidget({required this.rating, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 45.w,
        height: 23.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.cFFE1B3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                "assets/icons/star_selected_icon.svg",
                height: 10.h,
              ),
              Text(
                "$rating",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
}
