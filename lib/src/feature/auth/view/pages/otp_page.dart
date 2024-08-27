import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:nutrition/src/core/storage/app_storage.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/feature/auth/view_model/otp_vm.dart";
import "../widgets/pincode_textfield_widget.dart";

class VerifyAccount extends ConsumerWidget {
  const VerifyAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctr = ref.read(otpVm); //
    ref.watch(otpVm); // Ensure to use ref.watch to get the latest value of otpVm.
    // Ensure to use ref.watch to get the latest value of otpVm.
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wotp(
            controller: ctr.otp, // Use the controller from otpVm.
            onChanged: (value) async {
              final res = await AppStorage.$read(key: StorageKey.accessToken);
              if (value.length == 4) {
                await ctr.otpPost(email: "$res", code: value, context: context);
              }
            },
          ),
          if (ctr.isLoading == false)
            const Text("Enter Otp")
          else
            const CircularProgressIndicator(
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
                  // await ctr.otpPost(email: email, code: ctr.otp.text); // Ensure the post happens with the latest text.
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
