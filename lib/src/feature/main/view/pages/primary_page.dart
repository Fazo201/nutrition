// import 'package:d_navigation_bar/d_navigation_bar.dart';
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";

class PrimaryPage extends StatelessWidget {
  final Widget child;
  const PrimaryPage(this.child, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => context.go(
          index == 0
              ? AppRouteNames.homePage
              : index == 1
              ? AppRouteNames.bookmark
              : index == 2
              ? AppRouteNames.recipePage
              : AppRouteNames.profile,
        ),
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset("assets/icons/home_bottom_navigation_bar_icon.svg"),
            activeIcon: SvgPicture.asset("assets/icons/home_bottom_navigation_bar_selected_icon.svg"),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset("assets/icons/recipe_bottom_navigation_bar_icon.svg"),
            activeIcon: SvgPicture.asset("assets/icons/recipe_bottom_navigation_bar_selected_icon.svg"),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset("assets/icons/notification_bottom_navigation_bar_icon.svg"),
            activeIcon: SvgPicture.asset("assets/icons/notification_bottom_navigation_bar_selected_icon.svg"),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset("assets/icons/profile_bottom_navigation_bar_icon.svg"),
            activeIcon: SvgPicture.asset("assets/icons/profile_bottom_navigation_bar_selected_icon.svg"),
          ),
        ],
      ),
      // bottomNavigationBar: DNavigationBar(
      //   onChanged: (index) {
      //     setState(() {});
      //     // context.go(
      //     //     index == 0
      //     //         ? AppRouteName.home
      //     //         : index == 1
      //     //         ? AppRouteName.level
      //     //         : AppRouteName.profile
      //     // );
      //   },
      //   backgroundColor: Colors.transparent,
      //   useShadow: false,
      //   items: [
      //     DNavigationBarItem(
      //       icon: SvgPicture.asset("assets/icons/home_bottom_navigation_bar_icon.svg"),
      //       activeIcon: SvgPicture.asset("assets/icons/home_bottom_navigation_bar_selected_icon.svg")
      //     ),
      //     DNavigationBarItem(
      //       icon: SvgPicture.asset("assets/icons/recipe_bottom_navigation_bar_icon.svg"),
      //       activeIcon: SvgPicture.asset("assets/icons/recipe_bottom_navigation_bar_selected_icon.svg")
      //     ),
      //     DNavigationBarItem(
      //       icon: SvgPicture.asset("assets/icons/notification_bottom_navigation_bar_icon.svg"),
      //       activeIcon: SvgPicture.asset("assets/icons/notification_bottom_navigation_bar_selected_icon.svg")
      //     ),
      //     DNavigationBarItem(
      //       icon: SvgPicture.asset("assets/icons/profile_bottom_navigation_bar_icon.svg"),
      //       activeIcon: SvgPicture.asset("assets/icons/profile_bottom_navigation_bar_selected_icon.svg")
      //     )
      //   ],
      // ),
    );
}
