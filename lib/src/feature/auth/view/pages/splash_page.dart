import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/style/app_colors.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final Animation<Offset> _animationIcons;
  int? language;

  void changeLanguage(int n) {
    setState(() {
      language = n;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller);
    _animationIcons = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xff171A21),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset("assets/images/splash_backgraund_image.png").image,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Column(
                children: [
                  FadeTransition(
                    opacity: _animation,
                    child: Image.asset(
                      "assets/images/img.png",
                      height: 80,
                      width: 80,
                    ),
                  ),
                  14.verticalSpace,
                  FadeTransition(
                    opacity: _animation,
                    child: Text(
                      "100K+ Premium Recipe ",
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        fontFamily: "Poppins",
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 3),
              PreferredSize(
                preferredSize: const Size(4, 4),
                child: FadeTransition(
                  opacity: _animation,
                  child: SlideTransition(
                    position: _animationIcons,
                    child: Column(
                      children: [
                        Text(
                          "Get",
                          style: context.theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 50.sp,
                            fontFamily: "Poppins",
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          "Cooking",
                          style: context.theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 50.sp,
                            fontFamily: "Poppins",
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Simple way to find Tasty Recipe",
                          style: context.theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            fontFamily: "Poppins",
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 20),
                child: FadeTransition(
                  opacity: _animation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: language == 1 ? AppColors.c129575 : AppColors.cD9D9D9.withOpacity(0.1),
                          minimumSize: Size(90.w, 36.h),
                        ),
                        onPressed: () {
                          changeLanguage(1);
                        },
                        child: Text(
                          "UZBEK",
                          style: context.theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: language == 2 ? AppColors.c129575 : AppColors.cD9D9D9.withOpacity(0.1),
                          minimumSize: Size(90.w, 36.h),
                        ),
                        onPressed: () {
                          changeLanguage(2);
                        },
                        child: Text(
                          "РУССКИЙ",
                          style: context.theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            // fontSize: 16.sp,
                            fontFamily: "Poppins",
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: language == 3 ? AppColors.c129575 : AppColors.cD9D9D9.withOpacity(0.1),
                          minimumSize: Size(90.w, 36.h),
                        ),
                        onPressed: () {
                          changeLanguage(3);
                          // context.go(AppRouteNames.login);
                        },
                        child: Text(
                          "ENGLISH",
                          style: context.theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            // fontSize: 16.sp,
                            fontFamily: "Poppins",
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.verticalSpace,
              if (language != null)
                IconButton.outlined(
                  onPressed: () {
                    context.go(AppRouteNames.home);
                  },
                  highlightColor: AppColors.c129575,
                  icon: const Icon(
                    CupertinoIcons.right_chevron,
                    color: AppColors.white,
                  ),
                ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      );
}
