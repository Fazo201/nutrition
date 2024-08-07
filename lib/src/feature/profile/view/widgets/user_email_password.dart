import 'package:flutter/material.dart';

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
          style: AppTextStyle().profileTitle,
        ),
        Text(
          "Password: $password",
          style: AppTextStyle().profileTitle,
        ),
      ],
    );
  }
}
