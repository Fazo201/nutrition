import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/style/app_colors.dart';

class LoginSizedboxWidget extends StatelessWidget {
  final String svgPicture;

  const LoginSizedboxWidget({super.key, required this.svgPicture});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 44,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.cD9D9D9,
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            svgPicture,
          ),
        ),
      ),
    );
  }
}
