
// import '../data/enums/api_path.dart';
// import '../data/network/api_endpoints.dart';
// import '../data/network/http_client.dart';
// import '../services/shared_preferences.dart';
// import '../utils/app_logger.dart';

class AuthRemoteRepoSource {
  Future signupRepo(Map<String, String> input) async {}
  Future signinRepo(Map<String, String> input) async {}
  Future completeProfileRepo(Map<String, String> input) async {}
  Future verifyOTPRepo(Map<String, String> input) async {}
  Future verifyForgetPassOTPRepo(Map<String, String> input) async {}
  Future resendOTP() async {}
  Future forgetPasswordRepo(Map<String, String> input) async {}
  Future resetPasswordRepo(Map<String, String> input) async {}
  Future updateProfileRepo(Map<String, String> input) async {}
  Future deleteProfileRepo() async {}
  Future getScreenName() async {}
  Future contactSupport(String message) async {}
  Future logout(String fcmToken) async {}
  Future updateToken() async {}
  Future getPrivacy(String payLoad) async {}

}

class AuthRemoteRepo extends AuthRemoteRepoSource {
  AuthRemoteRepo._();

  static final AuthRemoteRepo _singleton = AuthRemoteRepo._();

  static AuthRemoteRepo get authRemoteInstance => _singleton;

}
