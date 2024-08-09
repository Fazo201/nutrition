import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
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
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller);
    _animationIcons = Tween<Offset>(begin: const Offset(0.0, -1.0), end: const Offset(0.0, 0.0)).animate(_controller);
    _controller.forward();
    stack();
    super.initState();
  }

  Future<void> stack() async => Future.delayed(const Duration(seconds: 4), () {
        context.go(AppRouteNames.homePage);
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
                      height: 80,
                      width: 80,
                    ),
                  ),
                  const SizedBox(height: 14),
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
              SizedBox(height: MediaQuery.of(context).size.width * 0.45),
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
              SizedBox(height: MediaQuery.of(context).size.width * 0.2),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 66),
              //   child: FadeTransition(
              //     opacity: _animation,
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: AppColors.c129575,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         fixedSize: const Size(double.maxFinite, 60),
              //       ),
              //       onPressed: () {
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => LoginPage(),
              //           ),
              //         );
              //       },
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             "Start Cooking",
              //             style: context.theme.textTheme.bodySmall?.copyWith(
              //               fontWeight: FontWeight.w600,
              //               fontSize: 16.sp,
              //               fontFamily: "Poppins",
              //               color: AppColors.white,
              //             ),
              //           ),
              //           const SizedBox(width: 20),
              //           const Icon(Icons.arrow_forward_outlined),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );
}
