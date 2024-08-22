import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/routes/router_config.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/feature/auth/view_model/otp_vm.dart";

import "../widgets/pincode_textfield_widget.dart";

class VerifyAccount extends ConsumerWidget {
  final String email;
  const VerifyAccount({
    required this.email,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctr = ref.read(otpVm);
    ref.watch(otpVm);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wotp(
            controller: ctr.otp,
            onChanged: (value) async {
              debugPrint("$value salommmmmmm");
              if (value.length == 4) {
                debugPrint("$email ${ctr.otp.text}");
                await ctr.otpPost(email: email, code: ctr.otp.text);
                context.go(AppRouteNames.home);
              }
            },
          ),
          ctr.isLoading == false
              ? Text("Enter Otp")
              : CircularProgressIndicator(
                  strokeWidth: 8,
                  color: Colors.red,
                ),
          const SizedBox(height: 124),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.85,
            child: GridView.builder(
              itemCount: ctr.buttons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 4),
                crossAxisCount: 3,
                crossAxisSpacing: 18,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => ElevatedButton(
                key: ValueKey(index),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.cD9D9D9,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  ctr.onButtonPressed(ctr.buttons[index]);
                  ctr.otp.text;
                  await ctr.otpPost(email: email, code: ctr.otp.text);
                },
                child: Text(
                  ctr.buttons[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
