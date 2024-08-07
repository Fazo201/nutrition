import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/app_colors.dart';
import 'package:nutrition/src/core/style/text_style.dart';
import 'package:nutrition/src/core/widgets/eleveted_button_widget.dart';
import 'package:nutrition/src/feature/auth/view/pages/login_page.dart';
import 'package:nutrition/src/feature/auth/view/widget/login_or_widget.dart';
import 'package:nutrition/src/feature/auth/view/widget/login_textfield_widget.dart';
import 'package:nutrition/src/feature/auth/view/widget/register_text_widget.dart';

import '../../../home/view/pages/home_page.dart';
import '../widget/login_sizedbox_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  final bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  style: const AppTextStyle().registerCreateAccount,
                ),
                const SizedBox(height: 5),
                Text(
                  'Let’s help you set up your account,\nit won’t take long.',
                  style: const AppTextStyle().registerLetsHelp,
                ),
                const SizedBox(height: 20),
                const RegisterTextWidget(text: 'Name'),
                const SizedBox(height: 5),
                const LoginTextfieldWidget(
                  hintText: 'Enter Name',
                ),
                const SizedBox(height: 20),
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
                      value: isCheck,
                      onChanged: (value) {},
                    ),
                    Text(
                      'Accept terms & Condition',
                      style: const AppTextStyle().loginForgotPassword,
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                ElevetedButtonWidget(
                  text: "Sign Up",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                ),
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
                      style: const AppTextStyle().loginDont,
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
                        style: const AppTextStyle().loginMinSign,
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
}
