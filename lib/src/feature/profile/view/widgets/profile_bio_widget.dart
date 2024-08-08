import 'package:flutter/material.dart';
import "package:nutrition/src/core/constants/context_extension.dart";
import 'package:nutrition/src/core/style/text_style.dart';

import '../../../../core/style/app_colors.dart';

class UserNameWidget extends StatelessWidget {
  final String userName;


  UserNameWidget(
      {super.key,
      required this.userName,
     });

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        userName,
        style: context.theme.textTheme.bodyLarge,
      ),
    );
  }
}
