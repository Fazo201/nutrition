import "package:flutter/material.dart";

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
