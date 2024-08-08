import 'package:flutter/material.dart';
import "package:nutrition/src/core/constants/context_extension.dart";

import '../../../../core/style/text_style.dart';

class UserEmailPassword extends StatelessWidget {
 final String email;
 final String password;
  const UserEmailPassword({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          "Email: $email",
          style: context.theme.textTheme.bodyLarge,
        ),
        Text(
          "Password: $password",
          style: context.theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
