import "dart:convert";

import "package:flutter/widgets.dart";
import "package:nutrition/src/core/server/api/api.dart";
import "package:nutrition/src/core/server/api/api_constants.dart";
import "package:nutrition/src/core/storage/app_storage.dart";
import "package:nutrition/src/data/repository/app_repository.dart";

class AppRepositoryImpl implements AppRepo {
  @override
  void createUser({required String email, required String password, required String name, required String acceptedPassword}) {}

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

  Future<void> postData({
    required String name,
    required String email,
    required String password,
    required String acceptedPassword,
  }) async {
    await ApiService.post(
      ApiConst.createAccount,
      {
        "email": "musulmanovasliddin@gmail.com",
        "name": "Asliddin",
        "password": "asliddin1234",
        "acceptedPassword": "asliddin1234",
      },
    );
  }
}
