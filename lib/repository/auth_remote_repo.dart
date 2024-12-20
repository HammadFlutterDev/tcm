
import '../data/enums/api_path.dart';
import '../data/network/api_endpoints.dart';
import '../data/network/http_client.dart';
import '../services/shared_preferences.dart';
import '../utils/app_logger.dart';

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

  @override
  Future signupRepo(Map<String, String> input) async {
    try {
      final response = await HttpClient.instance
          .post(ApiEndpoints.getValue(APIPath.signup), input, isToken: false);
      appLog("Response - $response");
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future signinRepo(Map<String, String> input) async {
    try {
      final response = await HttpClient.instance.post(
        ApiEndpoints.getValue(APIPath.signin),
        input,
        isToken: false,
      );
      appLog("Response - $response");

      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future completeProfileRepo(Map<String, dynamic> input) async {
    try {
      final response = await HttpClient.instance.patch(
        ApiEndpoints.getValue(APIPath.completeProfile),
        input,
        isToken: true,
      );
      appLog("Response - $response");
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future verifyOTPRepo(Map<String, String> input) async {
    try {
      final response = await HttpClient.instance.patch(
        ApiEndpoints.getValue(APIPath.verifyOTP),
        input,
        isToken: true,
      );
      appLog("Response - $response");
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future resendOTP() async {
    try {
      final response = await HttpClient.instance.patch(
        ApiEndpoints.getValue(APIPath.resendOTP),
        null,
        isToken: true,
      );
      appLog("Response - $response");
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future forgetPasswordRepo(Map<String, String> input) async {
    try {
      final response = await HttpClient.instance.patch(
        ApiEndpoints.getValue(APIPath.forgetPassword),
        input,
        isToken: false,
      );
      appLog("Response - $response");
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future verifyForgetPassOTPRepo(Map<String, dynamic> input) async {
    try {
      final response = await HttpClient.instance.patch(
        ApiEndpoints.getValue(APIPath.forgetPasswordVerify),
        input,
        isToken: false,
      );
      appLog("Response - $response");
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future resetPasswordRepo(Map<String, String> input) async {
    try {
      final response = await HttpClient.instance.patch(
        ApiEndpoints.getValue(APIPath.resetPassword),
        input,
        isToken: false,
      );
      appLog("Response - $response");
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future updateProfileRepo(Map<String, dynamic> input) async {
    try {
      final response = await HttpClient.instance.patch(
        ApiEndpoints.getValue(APIPath.updateProfile),
        input,
        isToken: true,
      );
      appLog("Response - $response");
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future deleteProfileRepo() async {
    try {
      final response = await HttpClient.instance.delete(
        ApiEndpoints.getValue(APIPath.deleteProfile),
        null,
        isToken: true,
      );
      appLog("Response - $response");
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future getScreenName() async {
    try {
      final response = await HttpClient.instance.get(
        ApiEndpoints.getValue(APIPath.screenName),
        isToken: true,
      );
      appLog("Response - $response");
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future contactSupport(String message) async {
    try {
      final response = await HttpClient.instance.post(
        ApiEndpoints.getValue(APIPath.contactSupport),
        {"message": message},
        isToken: true,
      );
      appLog("Response - $response");
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future logout(String fcmToken) async {
    try {
      final response = await HttpClient.instance.patch(
        ApiEndpoints.getValue(APIPath.logout),
        {"fcm": fcmToken},
        isToken: true,
      );
      appLog("Response - $response");
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future updateToken() async {
    try {
      final response = await HttpClient.instance.post(
        ApiEndpoints.getValue(APIPath.refresh),
        null,
        isToken: true,
      );
      appLog("Response - $response");
      if (response != null) {
        SharedPreferenceManager.sharedInstance
            .storeToken(response['data']?['access_token'] ?? "");
        SharedPreferenceManager.sharedInstance
            .storeRefreshToken(response['data']?['refresh_token'] ?? "");
      }
    } catch (e) {
      return null;
    }
  }
  
  @override
  Future getPrivacy(String payLoad)async {
   try {
      final response = await HttpClient.instance.get(
        ApiEndpoints.getValue(APIPath.privacyPolicy),
        params: {
          "key" : payLoad
        },
        isToken: true,
      );
    
      if (response != null) {
        return response;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
