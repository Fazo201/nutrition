import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/widgets/eleveted_button_widget.dart";
import "package:nutrition/src/feature/auth/view/widgets/login_or_widget.dart";
import "package:nutrition/src/feature/auth/view/widgets/login_sizedbox_widget.dart";
import "package:nutrition/src/feature/auth/view/widgets/login_textfield_widget.dart";

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,",
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 30.sp,
                      fontFamily: "Poppins",
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "Welcome Back!",
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                      fontFamily: "Poppins",
                      color: AppColors.c121212,
                    ),
                  ),
                  57.verticalSpace,
                  Text(
                    "Email",
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: "Poppins",
                      color: AppColors.c121212,
                    ),
                  ),
                  5.verticalSpace,
                  const LoginTextfieldWidget(
                    hintText: "Enter Email",
                  ),
                  30.verticalSpace,
                  Text(
                    "Enter Password",
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: "Poppins",
                      color: AppColors.c121212,
                    ),
                  ),
                  const LoginTextfieldWidget(
                    hintText: "Enter Password",
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: REdgeInsets.only(left: 10),
                    child: Text(
                      "Forgot Password?",
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: "Poppins",
                        color: AppColors.cFF9C00,
                      ),
                    ),
                  ),
                  25.verticalSpace,
                  ElevatedButtonWidget(
                    text: "Sign In",
                    onPressed: () {
                      context.pushReplacement(AppRouteNames.homePage);
                    },
                  ),
                  25.verticalSpace,
                  const LoginOrWidget(),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LoginSizedboxWidget(
                        svgPicture: "assets/icons/sign_in_google_icon.svg",
                      ),
                      25.horizontalSpace,
                      const LoginSizedboxWidget(
                        svgPicture: "assets/icons/sign_in_facebook_icon.svg",
                      ),
                    ],
                  ),
                  55.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                          fontFamily: "Poppins",
                          color: AppColors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go(AppRouteNames.register);
                        },
                        child: Text(
                          " Sign up",
                          style: context.theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp,
                            fontFamily: "Poppins",
                            color: AppColors.cFF9C00,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
