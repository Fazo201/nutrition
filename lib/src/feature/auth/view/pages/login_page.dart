import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/text_style.dart';
import 'package:nutrition/src/core/widgets/eleveted_button_widget.dart';
import 'package:nutrition/src/feature/auth/view/pages/register_page.dart';
import 'package:nutrition/src/feature/auth/view/widget/login_or_widget.dart';
import 'package:nutrition/src/feature/auth/view/widget/login_sizedbox_widget.dart';
import 'package:nutrition/src/feature/auth/view/widget/login_textfield_widget.dart';
import 'package:nutrition/src/feature/home/view/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Form(
            key: globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: const AppTextStyle().loginHello,
                ),
                Text(
                  'Welcome Back!',
                  style: const AppTextStyle().loginWelcomeBack,
                ),
                const SizedBox(height: 57),
                Text(
                  'Email',
                  style: const AppTextStyle().loginEmail,
                ),
                const SizedBox(height: 5),
                const LoginTextfieldWidget(
                  hintText: 'Enter Email',
                ),
                const SizedBox(height: 30),
                Text(
                  'Enter Password',
                  style: const AppTextStyle().loginEmail,
                ),
                const LoginTextfieldWidget(
                  hintText: 'Enter Password',
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Forgot Password?',
                    style: const AppTextStyle().loginForgotPassword,
                  ),
                ),
                const SizedBox(height: 25),
                ElevetedButtonWidget(
                  text: 'Sign In',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 25),
                const LoginOrWidget(),
                const SizedBox(height: 20),
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
                const SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: const AppTextStyle().loginDont,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        " Sign up",
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
