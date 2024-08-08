import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrition/src/core/routes/app_route_names.dart';
import 'package:nutrition/src/feature/auth/view/pages/register_page.dart';
import 'package:nutrition/src/feature/auth/view/pages/splash_page.dart';

GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

@immutable
final class RouterConfigService {
  const RouterConfigService._();
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteNames.recipePage,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      //splash page
      GoRoute(
        name: "SplashPage",
        path: AppRouteNames.splash,
        builder: (BuildContext context, GoRouterState state) => const SplashPage(),
      ),
      //register page
      GoRoute(
        name: "RegisterPage",
        path: AppRouteNames.register,
        builder: (BuildContext context, GoRouterState state) => const RegisterPage(),
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
      //recipe_page
      GoRoute(
        name: "RecipePage",
        path: AppRouteNames.recipePage,
        builder: (BuildContext context, GoRouterState state) => RecipePage(),
      ),
    ],
  );
}
