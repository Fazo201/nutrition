import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;

  const ElevatedButtonWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.c129575,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: const Size(double.maxFinite, 60),
      ),
      onPressed: () {},
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
}
