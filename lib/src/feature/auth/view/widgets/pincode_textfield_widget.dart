import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:pin_code_fields/pin_code_fields.dart";

class Wotp extends StatelessWidget {
  final String? otpText;
  final String? otpsubText;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const Wotp({
    super.key,
    this.otpText,
    this.otpsubText,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        children: [
          PinCodeTextField(
            controller: controller,
            cursorColor: AppColors.c121212,
            keyboardType: TextInputType.number,
            appContext: context,
            length: 4,
            cursorHeight: 36,
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            pinTheme: PinTheme(
              selectedColor: AppColors.black,
              activeColor: Colors.green,
              shape: PinCodeFieldShape.box,
              borderWidth: 1,
              fieldWidth: 54,
              fieldHeight: 68,
              inactiveColor: AppColors.cD9D9D9,
              borderRadius: BorderRadius.circular(18),
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
}
