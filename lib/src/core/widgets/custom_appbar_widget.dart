import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/text_style.dart';

class CustomAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  const CustomAppbarWidget({
    super.key,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? "", style: const AppTextStyle().appBarText),
      centerTitle: true,
      actions: actions
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
