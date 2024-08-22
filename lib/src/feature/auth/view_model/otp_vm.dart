import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:nutrition/src/data/repository/app_repository_impl.dart";

final otpVm = ChangeNotifierProvider((ref) => OtpVm());

class OtpVm extends ChangeNotifier {
  TextEditingController otp = TextEditingController();
  final AppRepositoryImpl repositoryImpl = AppRepositoryImpl();
  bool isLoading = false;

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
  }

  Future<void> otpPost({required String email, required String code}) async {
    isLoading = true;
    notifyListeners();
    await repositoryImpl.postOtp(email: email, code: code);
    isLoading = false;
    notifyListeners();
  }
}
