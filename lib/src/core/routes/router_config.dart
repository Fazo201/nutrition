import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/feature/auth/view/pages/register_page.dart";
import "package:nutrition/src/feature/auth/view/pages/splash_page.dart";

import "../../feature/bookmark/view/pages/bookmark_page.dart";
import "../../feature/main/view/pages/home_page.dart";
import "../../feature/main/view/pages/primary_page.dart";
import "../../feature/main/view/pages/search_recipes_page.dart";
import "../../feature/notification/view/pages/notification_page.dart";
import "../../feature/profile/view/pages/profile_page.dart";
import "../../feature/recipe/view/pages/recipe_page.dart";

GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

@immutable
final class RouterConfigService {
  const RouterConfigService._();
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteNames.splash,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) => PrimaryPage(child),
        routes: [
          GoRoute(
            name: "HomePage",
            path: AppRouteNames.homePage,
            builder: (BuildContext context, GoRouterState state) => HomePage(),
            routes: [
              GoRoute(
                name: "SearchPage",
                path: AppRouteNames.search,
                builder: (context, state) => SearchRecipesPage(
                  isTextField: state.extra as bool,
                ),
              ),
            ],
          ),
          GoRoute(
            name: "Bookmark",
            path: AppRouteNames.bookmark,
            builder: (BuildContext context, GoRouterState state) => const BookmarkPage(),
          ),
          GoRoute(
            name: "Notification",
            path: AppRouteNames.notification,
            builder: (BuildContext context, GoRouterState state) => NotificationPage(),
          ),
          //profile page
          GoRoute(
            name: "ProfilePage",
            path: AppRouteNames.profile,
            builder: (BuildContext context, GoRouterState state) => const ProfilePage(),
          ),
        ],
      ),

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
      //recipe_page
      GoRoute(
        name: "RecipePage",
        path: AppRouteNames.recipePage,
        builder: (BuildContext context, GoRouterState state) => const RecipePage(),
      ),
    ],
  );
}
