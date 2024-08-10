import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/feature/notification/vm/notification_vm.dart";
import "../../../../core/style/app_colors.dart";
import "../widgets/notification_card_widget.dart";
import "../widgets/notification_page_tab_widget.dart";

class NotificationPage extends ConsumerStatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final notificationVm = ref.read(notificationVMProvider);
    _tabController = TabController(length: 3, vsync: this, initialIndex: notificationVm.selectedIndex)
      ..addListener(() {
        if (_tabController.index != notificationVm.selectedIndex) {
          notificationVm.selectTab(_tabController.index);
        }
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notificationVm = ref.watch(notificationVMProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          "Notifications",
          style: context.theme.textTheme.bodyLarge?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          padding: REdgeInsets.symmetric(horizontal: 8),
          indicatorColor: AppColors.white,
          indicatorWeight: 1,
          dividerColor: AppColors.white,
          tabs: [
            NotificationPageTabWidget(
              text: "All",
              isSelected: notificationVm.selectedIndex == 0,
              index: 0,
              onTab: () {
                _tabController.animateTo(0);
              },
            ),
            NotificationPageTabWidget(
              text: "Read",
              isSelected: notificationVm.selectedIndex == 1,
              index: 1,
              onTab: () {
                _tabController.animateTo(1);
              },
            ),
            NotificationPageTabWidget(
              text: "Unread",
              isSelected: notificationVm.selectedIndex == 2,
              index: 2,
              onTab: () {
                _tabController.animateTo(2);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 30),
        child: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => const NotificationCardWidget(),
            ),
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => const NotificationCardWidget(),
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const NotificationCardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
