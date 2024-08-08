import "package:flutter/material.dart";
import "../../../../core/style/app_colors.dart";

class LoginTextfieldWidget extends StatelessWidget {
  final String hintText;

  const LoginTextfieldWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) => TextFormField(
        cursorColor: Colors.deepPurple,
        cursorHeight: 22,
        // controller: loginEmailC,
        // focusNode: emailFocusNode,
        // textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: hintText,
          // hintStyle: const AppTextStyle().loginEnter,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.cD9D9D9,
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.cD9D9D9,
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.cD9D9D9,
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );
}
