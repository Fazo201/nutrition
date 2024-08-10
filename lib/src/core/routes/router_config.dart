import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/feature/auth/view/pages/login_page.dart";
import "package:nutrition/src/feature/auth/view/pages/register_page.dart";
import "package:nutrition/src/feature/auth/view/pages/splash_page.dart";
import "package:nutrition/src/feature/bookmark/view/pages/reviews_page.dart";
import "package:nutrition/src/feature/food_details/view/pages/food_details_page.dart";

import "../../feature/bookmark/view/pages/bookmark_page.dart";
import "../../feature/main/view/pages/home_page.dart";
import "../../feature/main/view/pages/primary_page.dart";
import "../../feature/main/view/pages/search_recipes_page.dart";
import "../../feature/notification/view/pages/notification_page.dart";
import "../../feature/profile/view/pages/profile_page.dart";

GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

@immutable
final class RouterConfigService {
  const RouterConfigService._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRouteNames.notificationPage,
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
              // search page
              GoRoute(
                name: "SearchPage",
                path: AppRouteNames.search,
                builder: (context, state) => SearchRecipesPage(
                  isTextField: state.extra! as bool,
                ),
                routes: [
                  // recipe_page
                  // GoRoute(
                  //   name: "Food Detail Page",
                  //   path: AppRouteNames.foodDetailsPage,
                  //   builder: (BuildContext context, GoRouterState state) => const FoodDetailsPage(),
                  // ),
                ],
              ),
              // food detail page
              GoRoute(
                name: "Food Detail Page",
                path: AppRouteNames.foodDetailsPage,
                builder: (BuildContext context, GoRouterState state) => const FoodDetailsPage(),
              ),
            ],
          ),
          GoRoute(
            name: "Bookmark",
            path: AppRouteNames.bookmark,
            builder: (BuildContext context, GoRouterState state) => const BookmarkPage(),
          ),
          GoRoute(
            name: "NotificationPage",
            path: AppRouteNames.notificationPage,
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

      GoRoute(
        name: "ReviewsPage",
        path: AppRouteNames.reviewsPage,
        builder: (context, state) => const ReviewsPage(),
      ),

      //splash page
      GoRoute(
        name: "SplashPage",
        path: AppRouteNames.splash,
        builder: (BuildContext context, GoRouterState state) => const SplashPage(),
      ),

      //login page
      GoRoute(
        name: "LoginPage",
        path: AppRouteNames.login,
        builder: (BuildContext context, GoRouterState state) => LoginPage(),
        routes: [
          //register page
          GoRoute(
            name: "RegisterPage",
            path: AppRouteNames.register,
            builder: (BuildContext context, GoRouterState state) => const RegisterPage(),
          ),
        ],
      ),
    ],
  );
}
