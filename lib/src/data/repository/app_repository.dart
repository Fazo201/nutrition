abstract class AppRepo {
  // AppRepo._();

  void getToken({required String email, required String password});

  void postData({
    required String email,
    required String password,
    required String name,
    required String acceptedPassword,
  });

  Future<bool> checkToken();

  Future<void> postOtp({required String email, required String code});
}
