import 'package:flutter/material.dart';
import "package:nutrition/src/feature/profile/view/widgets/profile_abstract_snakebar_widget.dart";
class CommonSnackBar extends BuildSnackBar {
  final String contentText;
  CommonSnackBar({
    required super.context,
    required this.contentText
  });
  @override
  SnackBar build() => SnackBar(
      content: Text(contentText),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black,
      dismissDirection: DismissDirection.horizontal,
    );
}
