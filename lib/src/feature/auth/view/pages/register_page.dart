import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/widgets/eleveted_button_widget.dart";
import "package:nutrition/src/feature/auth/view/widgets/login_or_widget.dart";
import "package:nutrition/src/feature/auth/view/widgets/login_textfield_widget.dart";
import "package:nutrition/src/feature/auth/view/widgets/register_text_widget.dart";
import "package:nutrition/src/feature/auth/view_model/login_vm.dart";
import "../widgets/login_sizedbox_widget.dart";

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctr = ref.read(loginVM);
    ref.watch(loginVM);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Form(
              key: ctr.globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create an account",
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      fontFamily: "Poppins",
                      color: AppColors.black,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    "Let’s help you set up your account,\nit won’t take long.",
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      fontFamily: "Poppins",
                      color: AppColors.c121212,
                    ),
                  ),
                  15.verticalSpace,
                  const RegisterTextWidget(text: "Name"),
                  3.verticalSpace,
                  LoginTextfieldWidget(
                    controller: ctr.nameController,
                    hintText: "Enter Name",
                    validator: (value) {
                      if (value != null && value.isNotEmpty && value.length >= 2) {
                        return null;
                      } else {
                        return "Please enter your name";
                      }
                    },
                    onChanged: ctr.onChanged,
                  ),
                  18.verticalSpace,
                  const RegisterTextWidget(text: "Email"),
                  3.verticalSpace,
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
                  18.verticalSpace,
                  const RegisterTextWidget(text: "Password"),
                  3.verticalSpace,
                  LoginTextfieldWidget(
                    controller: ctr.passwordController,
                    hintText: "Enter Password",
                    validator: (value) {
                      final regex = RegExp(r"^(?=.*?[a-z])(?=.*?[0-9]).{8,}$");
                      if (value != null && value.contains(regex)) {
                        return null;
                      } else {
                        return "Must be 8 or more characters  and contain at least 1\nnumber or special character";
                      }
                    },
                    onChanged: ctr.onChanged,
                  ),
                  18.verticalSpace,
                  const RegisterTextWidget(text: "Confirm Password"),
                  3.verticalSpace,
                  LoginTextfieldWidget(
                    controller: ctr.confirmPasswordController,
                    hintText: "Retype Password",
                    validator: (value) {
                      if (value == ctr.passwordController.text) {
                        return null;
                      } else {
                        return "Must be 8 or more characters  and contain at least 1\nnumber or special character";
                      }
                    },
                    onChanged: ctr.onChanged,
                  ),
                  5.verticalSpace,
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side: const BorderSide(width: 1, color: AppColors.cFF9C00),
                        checkColor: AppColors.cFF9C00,
                        value: ref.watch(loginVM).isCheck,
                        onChanged: (value) {
                          ref.read(loginVM).check(value);
                        },
                      ),
                      Text(
                        "Accept terms & Condition",
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp,
                          fontFamily: "Poppins",
                          color: AppColors.cFF9C00,
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  ElevatedButtonWidget(
                    text: "Sign Up",
                    onPressed: () {
                      final result = ctr.globalKey.currentState!.validate();
                      if (result &&
                          ctr.nameController.text.isNotEmpty &&
                          ctr.emailController.text.isNotEmpty &&
                          ctr.passwordController.text.isNotEmpty &&
                          ctr.isCheck) {
                        context.pushReplacement(AppRouteNames.homePage);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Ma`lumotlarni to'liq to`ldiring"),
                          ),
                        );
                      }
                    },
                  ),
                  10.verticalSpace,
                  const LoginOrWidget(),
                  15.verticalSpace,
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
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member?",
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                          fontFamily: "Poppins",
                          color: AppColors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go(AppRouteNames.login);
                        },
                        child: Text(
                          " Sign In",
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
