import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/data/repository/app_repository_impl.dart";

final registerVm = ChangeNotifierProvider((ref) => RegisterVm());

class RegisterVm extends ChangeNotifier {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isCheck = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final AppRepositoryImpl repositoryImpl = AppRepositoryImpl();

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

  Future<void> getToken({required String email, required String password, required BuildContext context}) async {
    debugPrint("2222222222222");
    await repositoryImpl.getToken(email: email, password: password);
    await nextPage(context);
  }

  Future<void> nextPage(BuildContext context) async {
    debugPrint("33333333333333");
    await repositoryImpl.checkToken() ? context.pushReplacement(AppRouteNames.home) : "Am";
  }

  Future<void> postData({required String name, required String email, required String password, required String acceptedPassword}) async {
    await repositoryImpl.postData(name: name, email: email, password: password, acceptedPassword: acceptedPassword);
  }
}
