import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final loginVM = ChangeNotifierProvider((ref) => LoginVm());

class LoginVm with ChangeNotifier {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isCheck = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void onChanged(String? value) {
    globalKey.currentState!.validate();
    notifyListeners();
  }

  String? validator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return "Please enter your name";
    }
  }

  void check(bool? value) {
    isCheck = value ?? false;
    notifyListeners();
  }
}
