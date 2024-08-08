import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrition/src/core/routes/app_route_names.dart';
import 'package:nutrition/src/feature/auth/view/pages/register_page.dart';
import 'package:nutrition/src/feature/auth/view/pages/splash_page.dart';
import "package:nutrition/src/feature/profile/view/pages/profile_page.dart";

import "../../feature/main/view/pages/home_page.dart";

GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

class RouterConfigService {

  static final GoRouter router = GoRouter(
    initialLocation: AppRouteNames.profile,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      //splash page
      GoRoute(
        name: "SplashPage",
        path: AppRouteNames.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      //register page
      GoRoute(
        name: "RegisterPage",
        path: AppRouteNames.register,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterPage();
        },
      ),
      //profile page
      GoRoute(
        name: "ProfilePage",
        path: AppRouteNames.profile,
        builder: (BuildContext context, GoRouterState state) {
          return const ProfilePage();
        },
      ),
      // home page
      GoRoute(
        name: "HomePage",
        path: AppRouteNames.homePage,
        builder: (BuildContext context, GoRouterState state) => HomePage(),
      ),
    ],
  );
}
