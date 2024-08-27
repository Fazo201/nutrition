import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/feature/notification/view/widgets/custom_app_bar_with_tab_bar_widget.dart";
import "../widgets/custom_tab_widget.dart";
import "../widgets/notification_page_widget.dart";

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: CustomAppBarWithTabBarWidget(
            tabs: [
              CustomTabWidget(text: context.localized.all),
              CustomTabWidget(text: context.localized.read),
              CustomTabWidget(text: context.localized.unread),
            ],
          ),
          body: Padding(
            padding: REdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: const TabBarView(
              children: [
                NotificationPageWidget(
                  itemCount: 4,
                ),
                NotificationPageWidget(
                  itemCount: 5,
                ),
                NotificationPageWidget(
                  itemCount: 2,
                ),
              ],
            ),
          ),
        ),
      );
}
