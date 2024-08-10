import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../core/style/app_colors.dart";

class SearchRecipesTextFieldButtonWidget extends StatelessWidget {
  const SearchRecipesTextFieldButtonWidget({
    required this.controller,
    required this.onSubmitted,
    required this.onTapFilter,
    required this.onChanged,
    super.key,
    this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final Function() onTapFilter;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: SizedBox(
          height: 40.h, // Set height to 40 px for the search bar
          child: TextField(
            cursorColor: Colors.black,
            controller: controller,
            focusNode: focusNode,
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: "Search recipe",
              hintStyle: const TextStyle(
                color: AppColors.cD9D9D9,
              ),
              prefixIcon: Padding(
                padding: REdgeInsets.all(11),
                child: SvgPicture.asset("assets/icons/search_in_textfield_icon.svg"),
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                borderSide: const BorderSide(color: AppColors.cD9D9D9),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                borderSide: const BorderSide(color: AppColors.cD9D9D9),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.cD9D9D9),
              ),
              contentPadding: REdgeInsets.symmetric(vertical: 10), // Adjust content padding to match height
            ),
          ),
        ),
      ),
      SizedBox(
        width: 20.w,
      ),
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
              onPressed: onTapFilter,
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
  );
}
