final class ApiConst {
  const ApiConst._();

  static const Duration connectionTimeout = Duration(minutes: 1);
  static const Duration sendTimeout = Duration(minutes: 1);
  static const Duration receiveTimeout = Duration(minutes: 1);

  static const String baseUrl = "http://45.138.158.240";
  static const String version = "/api/v1";

  // static const String sendSms = "$version/cabinet/sms/send";
  // static const String apiSendCode = "$version/auth/check-phone";
  // static const String apiCheckCode = "$version/auth/check-code";
  // static const String apiGetCurrentUser = "$version/user/me";
  // static const String apiRefreshToken = "$version/auth/refresh-token";

  // auth
  static const String apiToken = "$version/auth/login";
  static const String createAccount = "$version/auth/register";
  static const String verifyEmail = "$version/auth/verify/email";

  // get all projects list
  static const String apiGetAllProjects = "$version/mobile/project";

  // additional
  static const String apiFAQ = "$version/mobile/faq";
  static const String apiGetHelpCredentials = "$version/mobile/company-info";
  static const String apiGetPrivacyPolicy = "$version/mobile/doc";
  static const String apiVerifyUser = "$version/mobile/identification/verificate";
  static const String apiUserMe = "$version/user/me";
}

final class ApiParams {
  const ApiParams._();

  static Map<String, dynamic> cabinetSmsCheckParams({required String phone, required String code}) => <String, dynamic>{
        "phone": phone,
        "code": code,
      };

  static Map<String, dynamic> emptyParams() => <String, dynamic>{};
}
