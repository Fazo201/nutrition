import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/widgets/eleveted_button_widget.dart";
import "package:nutrition/src/feature/auth/view/pages/login_page.dart";
import "package:nutrition/src/feature/auth/view/widgets/login_or_widget.dart";
import "package:nutrition/src/feature/auth/view/widgets/login_textfield_widget.dart";
import "package:nutrition/src/feature/auth/view/widgets/register_text_widget.dart";
import "package:nutrition/src/feature/auth/view_model/login_vm.dart";
import "../widgets/login_sizedbox_widget.dart";

class RegisterPage extends ConsumerWidget {
  RegisterPage({super.key});

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Form(
                key: globalKey,
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
                    20.verticalSpace,
                    const RegisterTextWidget(text: "Name"),
                    5.verticalSpace,
                    const LoginTextfieldWidget(
                      hintText: "Enter Name",
                    ),
                    20.verticalSpace,
                    const RegisterTextWidget(text: "Email"),
                    5.verticalSpace,
                    const LoginTextfieldWidget(
                      hintText: "Enter Email",
                    ),
                    20.verticalSpace,
                    const RegisterTextWidget(text: "Password"),
                    5.verticalSpace,
                    const LoginTextfieldWidget(
                      hintText: "Enter Password",
                    ),
                    20.verticalSpace,
                    const RegisterTextWidget(text: "Confirm Password"),
                    5.verticalSpace,
                    const LoginTextfieldWidget(
                      hintText: "Retype Password",
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        Checkbox(
                          checkColor: AppColors.cFF9C00,
                          value: ref.read(loginVM).isCheck,
                          onChanged: (value) {},
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
                    10.verticalSpace,
                    ElevatedButtonWidget(
                      text: "Sign Up",
                      onPressed: () {
                        context.pushReplacement(AppRouteNames.homePage);
                      },
                    ),
                    14.verticalSpace,
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
                    15.verticalSpace,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
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
