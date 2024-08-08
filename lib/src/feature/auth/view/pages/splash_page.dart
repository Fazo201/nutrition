import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/feature/auth/view/pages/login_page.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final Animation<Offset> _animationIcons;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween(end: 1.0.sp, begin: 0.0.sp).animate(_controller);
    _animationIcons = Tween<Offset>(begin: const Offset(0.0, -1.0), end: const Offset(0.0, 0.0)).animate(_controller);
    _controller.forward();
    stack();
    super.initState();
  }

  Future<void> stack() async => Future.delayed(const Duration(seconds: 4), () {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      });

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
              Column(
                children: [
                  FadeTransition(
                    opacity: _animation,
                    child: Image.asset(
                      "assets/images/img.png",
                      height: 80.h,
                      width: 80.w,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  FadeTransition(
                    opacity: _animation,
                    child: Text(
                      "100K+ Premium Recipe",
                      style: context.theme.textTheme.bodyLarge?.copyWith(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.45.w),
              PreferredSize(
                preferredSize: Size(4.sp, 4.sp),
                child: FadeTransition(
                  opacity: _animation,
                  child: SlideTransition(
                    position: _animationIcons,
                    child: Column(
                      children: [
                        Text(
                          "Get",
                          // style: const AppTextStyle().bodyLarge,
                          style: context.theme.textTheme.bodyLarge,
                        ),
                        Text(
                          "Cooking",
                          style: context.theme.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Simple way to find Tasty Recipe",
                          style: context.theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.2.w),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 66),
                child: FadeTransition(
                  opacity: _animation,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.c129575,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      fixedSize: Size(double.maxFinite, 60.h),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Start Cooking",
                          style: context.theme.textTheme.displayLarge,
                        ),
                        SizedBox(width: 20.w),
                        const Icon(Icons.arrow_forward_outlined),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
