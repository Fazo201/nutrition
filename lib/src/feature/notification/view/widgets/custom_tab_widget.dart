import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "../../../../core/style/app_colors.dart";

class CustomTabWidget extends StatelessWidget {

  final String text;

  const CustomTabWidget({
    required this.text,
  });

  @override
  Widget build(BuildContext context) => Tab(
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
