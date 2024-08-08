import "package:flutter/material.dart";

import "../../../../core/style/text_style.dart";

class RegisterTextWidget extends StatelessWidget {
  final String text;

  const RegisterTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const AppTextStyle().headlineLarge,
      );
}
