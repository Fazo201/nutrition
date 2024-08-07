import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/feature/auth/view/pages/register_page.dart";
import "package:nutrition/src/feature/auth/view/pages/splash_page.dart";
import "package:nutrition/src/feature/main/view/pages/home_page.dart";

GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

mixin RouterConfigService {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteNames.homePage,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: "SplashPage",
        path: AppRouteNames.splash,
        builder: (BuildContext context, GoRouterState state) => const SplashPage(),
      ),
      GoRoute(
        name: "RegisterPage",
        path: AppRouteNames.register,
        builder: (BuildContext context, GoRouterState state) => const RegisterPage(),
      ),
      GoRoute(
        name: "HomePage",
        path: AppRouteNames.homePage,
        builder: (BuildContext context, GoRouterState state) => HomePage(),
      ),
    ],
  );
}
