import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/style/app_colors.dart';

class SearchRecipesTextFieldButtonWidget extends StatelessWidget {
  const SearchRecipesTextFieldButtonWidget({
    super.key,
    this.focusNode,
    required this.controller,
    required this.onSubmitted,
    required this.onTapFilter,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final Function() onTapFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              hintText: 'Search recipe',
              hintStyle: const TextStyle(
                color: AppColors.cD9D9D9,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(11.0),
                child: SvgPicture.asset('assets/icons/search_in_textfield_icon.svg'),
              ),
              filled: true,
              fillColor: Colors.grey[200],
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide.none,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            ),
          ),
        ),
        const SizedBox(width: 20,),
        InkWell(
          onTap: () {
            onTapFilter();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 50,
              width: 50,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.c129575,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset('assets/icons/filter_icon.svg'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}