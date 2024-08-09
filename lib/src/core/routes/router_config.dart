import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrition/src/core/routes/app_route_names.dart';
import "package:nutrition/src/feature/auth/view/pages/login_page.dart";
import 'package:nutrition/src/feature/auth/view/pages/register_page.dart';
import 'package:nutrition/src/feature/auth/view/pages/splash_page.dart';
import "package:nutrition/src/feature/bookmark/view/pages/bookmark_page.dart";
import "package:nutrition/src/feature/main/view/pages/home_page.dart";
import "package:nutrition/src/feature/main/view/pages/primary_page.dart";
import "package:nutrition/src/feature/notification/view/pages/notification_page.dart";
import "package:nutrition/src/feature/profile/view/pages/profile_page.dart";
import "../../feature/bookmark/view/pages/reviews_page.dart";
import "../../feature/recipe/view/pages/recipe_page.dart";

GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

@immutable
final class RouterConfigService {
  // const RouterConfigService._();
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteNames.splash,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
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
      ),
      //register page
      GoRoute(
        name: "RegisterPage",
        path: AppRouteNames.register,
        builder: (BuildContext context, GoRouterState state) => RegisterPage(),
      ),
      //primery page
      GoRoute(
        name: "Primary",
        path: AppRouteNames.primary,
        builder: (BuildContext context, GoRouterState state) => PrimaryPage(
          HomePage(),
        ),
      ),
      //home page
      GoRoute(
        name: "HomePage",
        path: AppRouteNames.homePage,
        builder: (BuildContext context, GoRouterState state) => HomePage(),
      ),
      //recipe_page
      GoRoute(
        name: "RecipePage",
        path: AppRouteNames.recipePage,
        builder: (BuildContext context, GoRouterState state) => const RecipePage(),
      ),
      GoRoute(
        name: "ReviewsPage",
        path: AppRouteNames.reviewsPage,
        builder: (BuildContext context, GoRouterState state) => const ReviewsPage(),
      ),
      GoRoute(
        name: "BookmarkPage",
        path: AppRouteNames.bookmark,
        builder: (BuildContext context, GoRouterState state) => const BookmarkPage(),
      ),
      GoRoute(
        name: "NotificationPage",
        path: AppRouteNames.notification,
        builder: (BuildContext context, GoRouterState state) => NotificationPage(),
      ),
      GoRoute(
        name: "ProfilePage",
        path: AppRouteNames.profile,
        builder: (BuildContext context, GoRouterState state) => ProfilePage(),
      ),
    ],
  );
}
