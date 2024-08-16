import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/feature/notification/view/widgets/notification_page_widget.dart";
import "package:nutrition/src/feature/notification/vm/notification_vm.dart";
import "../../../../core/style/app_colors.dart";
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
          context.localized.notification,
          style: context.theme.textTheme.bodyLarge?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
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
              text: context.localized.all,
              isSelected: notificationVm.selectedIndex == 0,
              index: 0,
              onPressed: () {
                _tabController.animateTo(0);
              },
            ),
            NotificationPageTabWidget(
              text: context.localized.read,
              isSelected: notificationVm.selectedIndex == 1,
              index: 1,
              onPressed: () {
                _tabController.animateTo(1);
              },
            ),
            NotificationPageTabWidget(
              text: context.localized.unread,
              isSelected: notificationVm.selectedIndex == 2,
              index: 2,
              onPressed: () {
                _tabController.animateTo(2);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 25),
        child: TabBarView(
          controller: _tabController,
          children: const [
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
    );
  }
}
