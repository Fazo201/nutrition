import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/text_style.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const ElevatedButtonWidget({required this.text, super.key, this.onPressed});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.c129575,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fixedSize: const Size(double.maxFinite, 60),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              // style: const AppTextStyle().splashButton,
            ),
            const SizedBox(width: 20),
            const Icon(Icons.arrow_forward_outlined),
          ],
        ),
      );
}
