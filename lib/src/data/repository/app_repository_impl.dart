import "dart:convert";

import "package:flutter/widgets.dart";
import "package:nutrition/src/core/server/api/api.dart";
import "package:nutrition/src/core/server/api/api_constants.dart";
import "package:nutrition/src/core/storage/app_storage.dart";
import "package:nutrition/src/data/repository/app_repository.dart";

class AppRepositoryImpl implements AppRepo {
  @override
  Future<void> getToken({required String email, required String password}) async {
    final data = await ApiService.post(ApiConst.apiToken, {"email": email, "password": password});
    final Map<String, dynamic> jsonMap = jsonDecode(data!);
    final String token = jsonMap['data']['token'];
    debugPrint(token);
    await AppStorage.$write(key: StorageKey.accessToken, value: token);
    final res = await AppStorage.$read(key: StorageKey.accessToken);
    debugPrint(res);
  }

  @override
  Future<bool> checkToken() async {
    final res = await AppStorage.$read(key: StorageKey.accessToken);
    return res!.isNotEmpty ? true : false;
  }

  @override
  Future<void> postData({
    required String name,
    required String email,
    required String password,
    required String acceptedPassword,
  }) async {
    try {
      debugPrint("Sending API request to create account...");
      await ApiService.post(
        ApiConst.createAccount,
        {
          "email": email,
          "name": name,
          "password": password,
          "acceptedPassword": acceptedPassword,
        },
      );
      debugPrint("Account creation successful.");
    } catch (e) {
      debugPrint("Error occurred while creating account: $e");
    }
  }

  @override
  Future<void> postOtp({required String email, required String code}) async {
    await ApiService.post(
      ApiConst.verifyEmail,
      {
        "email": email,
        "code": code,
      },
    );
  }
}
