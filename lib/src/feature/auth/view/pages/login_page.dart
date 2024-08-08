import "package:flutter/material.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/text_style.dart";
import "package:nutrition/src/core/widgets/eleveted_button_widget.dart";
import "package:nutrition/src/feature/auth/view/pages/register_page.dart";
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
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,",
                    style: context.theme.textTheme.displayMedium,
                  ),
                  Text(
                    "Welcome Back!",
                    style: context.theme.textTheme.displaySmall,
                  ),
                  const SizedBox(height: 57),
                  Text(
                    "Email",
                    style: const AppTextStyle().headlineLarge,
                  ),
                  const SizedBox(height: 5),
                  const LoginTextfieldWidget(
                    hintText: "Enter Email",
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Enter Password",
                    style: const AppTextStyle().headlineLarge,
                  ),
                  const LoginTextfieldWidget(
                    hintText: "Enter Password",
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Forgot Password?",
                      style: const AppTextStyle().headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const ElevatedButtonWidget(text: "Sign In"),
                  const SizedBox(height: 25),
                  const LoginOrWidget(),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginSizedboxWidget(
                        svgPicture: "assets/icons/sign_in_google_icon.svg",
                      ),
                      SizedBox(width: 25),
                      LoginSizedboxWidget(
                        svgPicture: "assets/icons/sign_in_facebook_icon.svg",
                      ),
                    ],
                  ),
                  const SizedBox(height: 55),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: const AppTextStyle().labelMedium,
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
