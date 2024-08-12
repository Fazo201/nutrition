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

  static final GoRoute search = GoRoute(
    name: "SearchPage",
    parentNavigatorKey: parentNavigatorKey,
    path: AppRouteNames.search,
    pageBuilder: (BuildContext context, GoRouterState state) => _customEachTransitionAnimation(
      context,
      state,
      SearchRecipesPage(
        isTextField: state.extra as bool,
      ),
    ),
  );

  static final GoRoute foodDetails = GoRoute(
    parentNavigatorKey: parentNavigatorKey,
    name: "FoodDetailPage",
    path: AppRouteNames.foodDetails,
    pageBuilder: (BuildContext context, GoRouterState state) => _customEachTransitionAnimation(context, state, const FoodDetailsPage()),
    routes: [reviews],
  );

  static final GoRoute foodDetailsFromSearch = GoRoute(
    parentNavigatorKey: parentNavigatorKey,
    name: "FoodDetailFromSearchPage",
    path: AppRouteNames.foodDetails,
    pageBuilder: (BuildContext context, GoRouterState state) => _customEachTransitionAnimation(context, state, const FoodDetailsPage()),
    routes: [reviews],
  );

  static final GoRoute reviews = GoRoute(
    parentNavigatorKey: parentNavigatorKey,
    name: "ReviewPage",
    path: AppRouteNames.reviews,
    pageBuilder: (BuildContext context, GoRouterState state) => _customEachTransitionAnimation(context, state, const ReviewsPage()),
  );

  static Page<dynamic> _customEachTransitionAnimation(BuildContext context, GoRouterState state, Widget child) =>
      CustomTransitionPage<Object>(
        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          final tween = Tween<double>(begin: 0, end: 1);
          final scaleAnimation = animation.drive(tween);
          return ScaleTransition(
            scale: scaleAnimation,
            child: child,
          );
        },
        child: child,
      );

  static Page<dynamic> _customNavigatorTransitionAnimation(BuildContext context, GoRouterState state, Widget child) =>
      CustomTransitionPage<Object>(
        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          // var begin = Offset(1.0, 0.0); // From right
          // var end = Offset.zero;
          // var tween = Tween(begin: begin, end: end);
          // var offsetAnimation = animation.drive(tween);
          //
          // return SlideTransition(
          //   position: offsetAnimation,
          //   child: child,
          // );

          // var tween = Tween<double>(begin: 0, end: 1);
          // var scaleAnimation = animation.drive(tween);
          //
          // return ScaleTransition(
          //   scale: scaleAnimation,
          //   child: child,
          // );

          final tween = Tween<double>(begin: 0.6, end: 1.0);
          final sizeAnimation = animation.drive(tween);

          return SizeTransition(
            sizeFactor: sizeAnimation,
            child: child,
          );

          // var tween = Tween<double>(begin: 0.5, end: 1); // Full rotation
          // var rotationAnimation = animation.drive(tween);
          //
          // return RotationTransition(
          //   turns: rotationAnimation,
          //   child: child,
          // );

          // return FadeTransition(
          //   opacity: animation,
          //   child: child,
          // );
        },
        child: child,
      );

  static final GoRouter router = GoRouter(
    initialLocation: AppRouteNames.splash,
    navigatorKey: parentNavigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) => PrimaryPage(child),
        routes: [
          /// Homa Page
          GoRoute(
            name: "HomePage",
            path: AppRouteNames.home,
            pageBuilder: (BuildContext context, GoRouterState state) => _customNavigatorTransitionAnimation(context, state, HomePage()),
            routes: [
              // search page
              search,
              // food detail page
              foodDetails,
            ],
          ),

          /// BookMark Page
          GoRoute(
            name: "BookmarkPage",
            path: AppRouteNames.bookmark,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                _customNavigatorTransitionAnimation(context, state, const BookmarkPage()),
          ),

          /// Notification Page
          GoRoute(
            name: "NotificationPage",
            path: AppRouteNames.notification,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                _customNavigatorTransitionAnimation(context, state, NotificationPage()),
          ),

          /// Profile Page
          GoRoute(
            name: "ProfilePage",
            path: AppRouteNames.profile,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                _customNavigatorTransitionAnimation(context, state, const ProfilePage()),
          ),
        ],
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
        builder: (BuildContext context, GoRouterState state) => const LoginPage(),
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
