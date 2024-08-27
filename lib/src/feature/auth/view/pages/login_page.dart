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
                    context.localized.hello,
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 30.sp,
                      fontFamily: "Poppins",
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    context.localized.welcomeBack,
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                      fontFamily: "Poppins",
                      color: AppColors.c121212,
                    ),
                  ),
                  57.verticalSpace,
                  Text(
                    context.localized.email,
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
                    hintText: context.localized.enterEmail,
                    validator: (value) {
                      if (value != null && value.contains("@gmail.com") && value.length > 10) {
                        return null;
                      } else {
                        return context.localized.errorExample;
                      }
                    },
                    onChanged: ctr.onChanged,
                  ),
                  30.verticalSpace,
                  Text(
                    context.localized.enterPassword,
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: "Poppins",
                      color: AppColors.c121212,
                    ),
                  ),
                  LoginTextfieldWidget(
                    controller: ctr.passwordController,
                    hintText: context.localized.enterPassword,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      } else {
                        return context.localized.errorPassword;
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
                        context.localized.forgetPassword,
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
                    text: context.localized.signIn,
                    onPressed: () async {
                      if (ctr.globalKey.currentState?.validate() ?? false) {
                        debugPrint("Form validation passed");
                        await ctr.getToken(email: ctr.emailController.text, password: ctr.passwordController.text, context: context);
                        ctr.emailController.clear();
                        ctr.passwordController.clear();
                      } else {}
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
                        context.localized.dontHaveAccount,
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
                          context.localized.signUp,
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
