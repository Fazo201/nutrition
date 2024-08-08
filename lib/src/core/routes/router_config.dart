import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/feature/auth/view/pages/register_page.dart";
import "package:nutrition/src/feature/auth/view/pages/splash_page.dart";
import "package:nutrition/src/feature/bookmark/view/pages/bookmark_page.dart";
import "package:nutrition/src/feature/main/view/pages/primary_page.dart";
import "package:nutrition/src/feature/profile/view/pages/profile_page.dart";
import "package:nutrition/src/feature/recipe/view/pages/recipe_page.dart";

import "../../feature/main/view/pages/home_page.dart";

GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

class RouterConfigService {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteNames.primary,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) => PrimaryPage(child),
        routes: [
          GoRoute(
            name: "HomePage",
            path: AppRouteNames.homePage,
            builder: (BuildContext context, GoRouterState state) => HomePage(),
          ),
          GoRoute(
            name: "Bookmark",
            path: AppRouteNames.bookmark,
            builder: (BuildContext context, GoRouterState state) => BookmarkPage(),
          ),
          // GoRoute(
          //   name: "Notification",
          //   path: AppRouteNames.notification,
          //   builder: (BuildContext context, GoRouterState state) => Notification(),
          // ),
          //profile page
          GoRoute(
            name: "ProfilePage",
            path: AppRouteNames.profile,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfilePage();
            },
          ),
        ]
      ),

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
      //recipe_page
      GoRoute(
        name: "RecipePage",
        path: AppRouteNames.recipePage,
        builder: (BuildContext context, GoRouterState state) => RecipePage(),
      ),
    ],
  );
}
