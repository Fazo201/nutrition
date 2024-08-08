import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:nutrition/src/core/constants/context_extension.dart";
import 'package:nutrition/src/core/style/app_colors.dart';
import 'package:nutrition/src/core/style/text_style.dart';
import 'package:nutrition/src/core/widgets/eleveted_button_widget.dart';
import 'package:nutrition/src/feature/auth/view/pages/login_page.dart';
import 'package:nutrition/src/feature/auth/view/widgets/login_or_widget.dart';
import 'package:nutrition/src/feature/auth/view/widgets/login_textfield_widget.dart';
import 'package:nutrition/src/feature/auth/view/widgets/register_text_widget.dart';
import 'package:nutrition/src/feature/auth/view_model/login_vm.dart';

import '../widgets/login_sizedbox_widget.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an account',
                    style: const AppTextStyle().headlineSmall,
                  ),
                  5.verticalSpace,
                  Text(
                    'Let’s help you set up your account,\nit won’t take long.',
                    style: const AppTextStyle().headlineSmall?.copyWith(color: AppColors.c121212),
                  ),
                  20.verticalSpace,
                  const RegisterTextWidget(text: 'Name'),
                  5.verticalSpace,
                  const LoginTextfieldWidget(
                    hintText: 'Enter Name',
                  ),
                  20.verticalSpace,
                  const RegisterTextWidget(text: 'Email'),
                  const SizedBox(height: 5),
                  const LoginTextfieldWidget(
                    hintText: 'Enter Email',
                  ),
                  const SizedBox(height: 20),
                  const RegisterTextWidget(text: 'Password'),
                  const SizedBox(height: 5),
                  const LoginTextfieldWidget(
                    hintText: 'Enter Password',
                  ),
                  const SizedBox(height: 20),
                  const RegisterTextWidget(text: 'Confirm Password'),
                  const SizedBox(height: 5),
                  const LoginTextfieldWidget(
                    hintText: 'Retype Password',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: AppColors.cFF9C00,
                        value: ref.read(loginVM).isCheck,
                        onChanged: (value) {},
                      ),
                      Text(
                        'Accept terms & Condition',
                        style: const AppTextStyle().headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                  const ElevatedButtonWidget(text: 'Sign Up'),
                  const SizedBox(height: 14),
                  const LoginOrWidget(),
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginSizedboxWidget(
                        svgPicture: 'assets/icons/sign_in_google_icon.svg',
                      ),
                      SizedBox(width: 25),
                      LoginSizedboxWidget(
                        svgPicture: 'assets/icons/sign_in_facebook_icon.svg',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member?",
                        style: context.theme.textTheme.bodyMedium?.copyWith(),
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
                          style: const AppTextStyle().labelSmall,
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
