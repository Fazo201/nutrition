import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/routes/router_config.dart";
import "package:nutrition/src/data/repository/app_repository_impl.dart";

final otpVm = ChangeNotifierProvider((ref) => OtpVm());

class OtpVm extends ChangeNotifier {
  final AppRepositoryImpl repositoryImpl = AppRepositoryImpl();
  bool isLoading = false;
  final TextEditingController otp = TextEditingController(); // Moved to final to ensure it isn't recreated.

  final List<String> buttons = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '←', '0', '✖️'];

  void onButtonPressed(String buttonText) {
    if (buttonText == '←') {
      if (otp.text.isNotEmpty) {
        otp.text = otp.text.substring(0, otp.text.length - 1);
      }
    } else if (buttonText == '✖️') {
      otp.clear();
    } else if (otp.text.length < 4) {
      otp.text += buttonText;
    }
    notifyListeners(); // Notify listeners so that UI can be updated.
  }

  // Future<void> otpPost({required String email, required String code, required BuildContext context}) async {
  //   isLoading = true;
  //   notifyListeners();
  //   final res = await repositoryImpl.postOtp(email: email, code: code);
  //   if (res) context.go(AppRouteNames.home);
  //   debugPrint('RESULT $res)');
  //   isLoading = false;
  //   notifyListeners();
  // }

  // new
  Future<void> otpPost({
    required BuildContext context,
    required String email,
    required String code,
  }) async {
    final otpVerified = await repositoryImpl.postOtp(email: email, code: code);

    if (otpVerified) {
      // Navigate to home if OTP verification and token retrieval are successful
      context.go(AppRouteNames.home);
    } else {
      // Show an error message if OTP verification or token retrieval failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP or retrieve token')),
      );
    }
  }
}
