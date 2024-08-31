import "package:flutter/material.dart";
import "package:nutrition/src/feature/notification/view/widgets/notification_card_widget.dart";

class NotificationPageWidget extends StatelessWidget {
  final int itemCount;

  const NotificationPageWidget({
    required this.itemCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) => const NotificationCardWidget(),
      );
}
