abstract class AppRepo {
  // AppRepo._();

  void getToken({required String email, required String password});

  void createUser({
    required String email,
    required String password,
    required String name,
    required String acceptedPassword,
  });

  Future<bool> checkToken();
}
