import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/widgets/eleveted_button_widget.dart";
import "package:nutrition/src/feature/auth/view/widgets/login_or_widget.dart";
import "package:nutrition/src/feature/auth/view/widgets/login_sizedbox_widget.dart";
import "package:nutrition/src/feature/auth/view/widgets/login_textfield_widget.dart";
import "package:nutrition/src/feature/auth/view_model/login_vm.dart";

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("\n\n\nLoginPage\n\n");
    final ctr = ref.read(loginVM);
    ref.watch(loginVM);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Form(
              key: ctr.globalKey,
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
                  LoginTextfieldWidget(
                    controller: ctr.emailController,
                    hintText: "Enter Email",
                    validator: (value) {
                      if (value != null && value.contains("@gmail.com") && value.length > 10) {
                        return null;
                      } else {
                        return "Please enter your email address\nExample => (example@gmail.com)";
                      }
                    },
                    onChanged: ctr.onChanged,
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
                  LoginTextfieldWidget(
                    controller: ctr.passwordController,
                    hintText: "Enter Password",
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      } else {
                        return "Please enter your password";
                      }
                    },
                    onChanged: ctr.onChanged,
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: REdgeInsets.only(left: 10),
                    child: GestureDetector(
                      onTap: () {
                        context.go(AppRouteNames.home);
                      },
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
                  ),
                  25.verticalSpace,
                  ElevatedButtonWidget(
                    text: "Sign In",
                    onPressed: () {
                      if (ctr.globalKey.currentState?.validate() ?? false) {
                        context.pushReplacement(AppRouteNames.home);
                      } else {
                        // Optionally, show a message or do something when validation fails
                      }
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
                          context.go("${AppRouteNames.login}/${AppRouteNames.register}");
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
      ),
    );
  }
}
