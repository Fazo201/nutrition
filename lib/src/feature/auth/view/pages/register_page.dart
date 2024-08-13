import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "../../../../core/routes/app_route_names.dart";
import "../../../../core/style/app_colors.dart";
import "../../../../core/widgets/eleveted_button_widget.dart";
import "../../view_model/login_vm.dart";
import "../widgets/login_or_widget.dart";
import "../widgets/login_sizedbox_widget.dart";
import "../widgets/login_textfield_widget.dart";
import "../widgets/register_text_widget.dart";

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctr = ref.watch(loginVM);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Form(
            key: ctr.globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.localized.creatAnAccount,
                  style: context.theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    fontFamily: "Poppins",
                    color: AppColors.black,
                  ),
                ),
                5.verticalSpace,
                Text(
                  context.localized.letsHelp,
                  style: context.theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    fontFamily: "Poppins",
                    color: AppColors.c121212,
                  ),
                ),
                15.verticalSpace,
                RegisterTextWidget(text: context.localized.name),
                3.verticalSpace,
                LoginTextfieldWidget(
                  controller: ctr.nameController,
                  hintText: context.localized.enterName,
                  validator: (value) {
                    if (value != null && value.isNotEmpty && value.length >= 2) {
                      return null;
                    } else {
                      return context.localized.pleaseEnterName;
                    }
                  },
                  onChanged: (value) => ctr.onChanged,
                ),
                18.verticalSpace,
                RegisterTextWidget(text: context.localized.email),
                3.verticalSpace,
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
                  onChanged: (value) => ctr.onChanged,
                ),
                18.verticalSpace,
                RegisterTextWidget(text: context.localized.password),
                3.verticalSpace,
                LoginTextfieldWidget(
                  controller: ctr.passwordController,
                  hintText: context.localized.enterPassword,
                  validator: (value) {
                    final regex = RegExp(r"^(?=.*?[a-z])(?=.*?[0-9]).{8,}$");
                    if (value != null && regex.hasMatch(value)) {
                      return null;
                    } else {
                      return context.localized.errorPassword;
                    }
                  },
                  onChanged: (value) => ctr.onChanged,
                ),
                18.verticalSpace,
                RegisterTextWidget(text: context.localized.confirmPassword),
                3.verticalSpace,
                LoginTextfieldWidget(
                  controller: ctr.confirmPasswordController,
                  hintText: context.localized.retypePassword,
                  validator: (value) {
                    if (value == ctr.passwordController.text) {
                      return null;
                    } else {
                      return context.localized.passwordDoNotMatch;
                    }
                  },
                  onChanged: (value) => ctr.onChanged,
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
                      value: ctr.isCheck,
                      onChanged: (value) {
                        ctr.check(value);
                      },
                    ),
                    Text(
                      context.localized.accept,
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
                  text: context.localized.signUp,
                  onPressed: () {
                    final result = ctr.globalKey.currentState!.validate();
                    if (result &&
                        ctr.nameController.text.isNotEmpty &&
                        ctr.emailController.text.isNotEmpty &&
                        ctr.passwordController.text.isNotEmpty &&
                        ctr.isCheck) {
                      context.pushReplacement(AppRouteNames.home);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(context.localized.pleaseFill),
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
                      context.localized.already,
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                        fontFamily: "Poppins",
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      context.localized.signIn,
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                        fontFamily: "Poppins",
                        color: AppColors.cFF9C00,
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
