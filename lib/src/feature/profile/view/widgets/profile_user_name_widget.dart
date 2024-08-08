import 'package:flutter/material.dart';
import "package:nutrition/src/core/constants/context_extension.dart";

class UserNameWidget extends StatelessWidget {
  UserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Azimjon ",
        style: context.theme.textTheme.bodyLarge,
      ),
    );
  }
}
