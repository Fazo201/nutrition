import "package:flutter/material.dart";
import "package:nutrition/src/core/style/app_colors.dart";

class CustomAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  const CustomAppbarWidget({
    super.key,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) => AppBar(
    backgroundColor: AppColors.white,
      title: Text(title ?? "", ),
      centerTitle: true,
      actions: actions,
    );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
