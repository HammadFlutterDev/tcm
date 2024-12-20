// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:the_deal_spot/models/user_data_model.dart';
// import 'package:the_deal_spot/repository/auth_remote_repo.dart';
// import 'package:the_deal_spot/services/firebase_service.dart';
// import 'package:the_deal_spot/utils/app_extensions.dart';
// import 'package:the_deal_spot/utils/app_logger.dart';
// import 'package:the_deal_spot/view/change_password_view.dart';
// import 'package:the_deal_spot/view/otp_view.dart';
// import 'package:the_deal_spot/view/signin_view.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import '../data/network/api_response.dart';
// import '../services/shared_preferences.dart';
// import '../utils/app_router.dart';
// import '../utils/helper.dart';
// import '../view/complete_profile_view.dart';
// import '../view/navigation_view.dart';
// import '../view/password_successful_change_view.dart';
// import '../view/select_interest_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
// import 'package:crypto/crypto.dart';

// class AuthRepoProvider extends ChangeNotifier {
//   ApiResponse _apiSigninResponse = ApiResponse.undertermined();
//   ApiResponse _apiSignupResponse = ApiResponse.undertermined();
//   ApiResponse _apiCompleteResponse = ApiResponse.undertermined();
//   ApiResponse _apiVerifyOTPResponse = ApiResponse.undertermined();
//   ApiResponse _apiResendOTPResponse = ApiResponse.undertermined();
//   ApiResponse _apiForgetPassOTPVerifyResponse = ApiResponse.undertermined();
//   ApiResponse _apiForgetResponse = ApiResponse.undertermined();
//   ApiResponse _apiResetPassResponse = ApiResponse.undertermined();
//   ApiResponse _apiUpdateProfileResponse = ApiResponse.undertermined();
//   ApiResponse _apiDeleteResponse = ApiResponse.undertermined();
//   ApiResponse _apiContactSupportesponse = ApiResponse.undertermined();
//   ApiResponse _apiGoogleSignInResponse = ApiResponse.undertermined();
//   ApiResponse _apiAppleSignInResponse = ApiResponse.undertermined();
//   // ApiResponse _apiPrivacyPolicyResponse = ApiResponse.undertermined();


//   AuthRemoteRepo authRemoteRepo = AuthRemoteRepo.authRemoteInstance;
//   String? userEmail;
//   UserDataModel? userData;

//   Future signin(Map<String, String> input) async {
//     try {
//       input.putIfAbsent(
//         "fcm",
//         () => FirebaseService.fcmToken ?? "",
//       );
//       if (input['account_type'] == "Email") {
//         userEmail = input['email'] ?? "";
//         _apiSigninResponse = ApiResponse.loading("Loading...");
//         notifyListeners();
//       }

//       final response = await authRemoteRepo.signinRepo(input);
//       if (response != null) {
//         if (input['account_type'] == "Email") {
//           _apiSigninResponse = ApiResponse.completed(response);
//         } else if (input['account_type'] == "Google") {
//           _apiGoogleSignInResponse = ApiResponse.completed(response);
//         } else if (input['account_type'] == "Apple") {
//           _apiAppleSignInResponse = ApiResponse.completed(response);
//         }

//         if (apiSigninResponse.data != null &&
//             input['account_type'] == "Email") {
//           SharedPreferenceManager.sharedInstance
//               .storeToken(apiSigninResponse.data['access_token']);
//           SharedPreferenceManager.sharedInstance
//               .storeRefreshToken(apiSigninResponse.data['refresh_token']);
//           String screenName = response['data']['screen'] ?? "";
//           SharedPreferenceManager.sharedInstance.storeScreenName(screenName);
//           savedUserData(apiSigninResponse.data['data']['user']);
//           switch (screenName) {
//             case "otp":
//               AppRouter.pushWithAnimation(OTPView(email: userEmail!));
//               break;
//             case "home":
//               AppRouter.pushAndRemoveUntil(const NavigationView());
//               break;
//             case "favorites":
//               AppRouter.pushWithAnimation(const SelectInterestView());
//               break;
//             case "about":
//               AppRouter.pushWithAnimation(const CompleteProfileView());
//           }
//         } else if (apiGoogleSignInResponse.data != null &&
//             input['account_type'] == "Google") {
//           SharedPreferenceManager.sharedInstance
//               .storeToken(apiGoogleSignInResponse.data['access_token']);
//           SharedPreferenceManager.sharedInstance
//               .storeRefreshToken(apiGoogleSignInResponse.data['refresh_token']);
//           String screenName = response['data']['screen'] ?? "";
//           SharedPreferenceManager.sharedInstance.storeScreenName(screenName);
//           savedUserData(apiGoogleSignInResponse.data['data']['user']);
//           switch (screenName) {
//             case "otp":
//               AppRouter.pushWithAnimation(OTPView(email: userEmail!));
//               break;
//             case "home":
//               AppRouter.pushAndRemoveUntilWithAnimation(const NavigationView());
//               break;
//             case "favorites":
//               AppRouter.pushWithAnimation(const SelectInterestView());
//               break;
//             case "about":
//               AppRouter.pushWithAnimation(const CompleteProfileView());
//           }
//         } else if (apiAppleSignInResponse.data != null &&
//             input['account_type'] == "Apple") {
//           SharedPreferenceManager.sharedInstance
//               .storeToken(apiAppleSignInResponse.data['access_token']);
//           SharedPreferenceManager.sharedInstance
//               .storeRefreshToken(apiAppleSignInResponse.data['refresh_token']);
//           String screenName = response['data']['screen'] ?? "";
//           SharedPreferenceManager.sharedInstance.storeScreenName(screenName);
//           savedUserData(apiAppleSignInResponse.data['data']['user']);
//           switch (screenName) {
//             case "otp":
//               AppRouter.pushWithAnimation(OTPView(email: userEmail!));
//               break;
//             case "home":
//               AppRouter.pushAndRemoveUntilWithAnimation(const NavigationView());
//               break;
//             case "favorites":
//               AppRouter.pushWithAnimation(const SelectInterestView());
//               break;
//             case "about":
//               AppRouter.pushWithAnimation(const CompleteProfileView());
//           }
//         }

//         notifyListeners();
//       } else {
//         if (input['account_type'] == "Email") {
//           _apiSigninResponse = ApiResponse.error("Something went wrong!");
//         } else if (input['account_type'] == "Google") {
//           _apiGoogleSignInResponse = ApiResponse.error("Something went wrong!");
//         } else if (input['account_type'] == "Apple") {
//           _apiAppleSignInResponse = ApiResponse.error("Something went wrong!");
//         }
//         notifyListeners();
//       }
//     } catch (e) {
//       if (input['account_type'] == "Email") {
//         _apiSigninResponse =
//             ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       } else if (input['account_type'] == "Google") {
//         _apiGoogleSignInResponse =
//             ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       } else if (input['account_type'] == "Apple") {
//         _apiAppleSignInResponse =
//             ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       }

//       notifyListeners();
//     }
//   }

//   Future signup(Map<String, String> input) async {
//     try {
//       userEmail = input['email'];
//       input.putIfAbsent(
//         "fcm",
//         () => FirebaseService.fcmToken ?? "",
//       );
//       if (input['account_type'] == "Email") {
//         _apiSignupResponse = ApiResponse.loading("Loading...");
//       } else if (input['account_type'] == "Google") {
//         _apiGoogleSignInResponse = ApiResponse.loading("Loading...");
//       } else if (input['account_type'] == "Apple") {
//         _apiAppleSignInResponse = ApiResponse.loading("Loading...");
//       }

//       notifyListeners();
//       final response = await authRemoteRepo.signupRepo(input);
//       if (response != null) {
//         if (input['account_type'] == "Email") {
//           _apiSignupResponse = ApiResponse.completed(response);
//         } else if (input['account_type'] == "Google") {
//           _apiGoogleSignInResponse = ApiResponse.completed(response);
//         } else if (input['account_type'] == "Apple") {
//           _apiAppleSignInResponse = ApiResponse.completed(response);
//         }

//         if (apiSignupResponse.data != null &&
//             input['account_type'] == "Email") {
//           SharedPreferenceManager.sharedInstance
//               .storeToken(apiSignupResponse.data['access_token']);
//           savedUserData(apiSignupResponse.data['data']['user']);

//           AppRouter.pushWithAnimation(OTPView(email: userEmail!));
//         } else if (apiGoogleSignInResponse.data != null &&
//             input['account_type'] == "Google") {
//           SharedPreferenceManager.sharedInstance
//               .storeToken(apiGoogleSignInResponse.data['access_token']);
//           savedUserData(apiGoogleSignInResponse.data['data']['user']);

//           AppRouter.pushWithAnimation(const CompleteProfileView());
//         } else if (apiGoogleSignInResponse.data != null &&
//             input['account_type'] == "Apple") {
//           SharedPreferenceManager.sharedInstance
//               .storeToken(apiAppleSignInResponse.data['access_token']);
//           savedUserData(apiAppleSignInResponse.data['data']['user']);

//           AppRouter.pushWithAnimation(const CompleteProfileView());
//         }
//         notifyListeners();
//       } else {
//         if (input['account_type'] == "Email") {
//           _apiSignupResponse = ApiResponse.error("Something went wrong!");
//         } else if (input['account_type'] == "Google") {
//           _apiGoogleSignInResponse = ApiResponse.error("Something went wrong!");
//         } else if (input['account_type'] == "Apple") {
//           _apiAppleSignInResponse = ApiResponse.error("Something went wrong!");
//         }

//         // Helper.showMessage("Something went wrong!");
//         notifyListeners();
//       }
//     } catch (e) {
//       if (input['account_type'] == "Email") {
//         _apiSignupResponse =
//             ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       } else if (input['account_type'] == "Google") {
//         _apiGoogleSignInResponse =
//             ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       } else if (input['account_type'] == "Apple") {
//         _apiAppleSignInResponse =
//             ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       }

//       notifyListeners();
//     }
//   }

//   Future completeProfile(Map<String, dynamic> input, String title) async {
//     try {
//       _apiCompleteResponse = ApiResponse.loading("Loading...");
//       notifyListeners();
//       final response = await authRemoteRepo.completeProfileRepo(input);
//       if (response != null) {
//         if (response['data'] != null) {
//           savedUserData(response['data']['user']);
//         }
//         Helper.showMessage(response['message']);
//         _apiCompleteResponse = ApiResponse.completed(response);
//         if (title == 'about') {
//           AppRouter.pushWithAnimation(const SelectInterestView());
//         } else if (title == 'favorites') {
//           AppRouter.pushAndRemoveUntilWithAnimation(const NavigationView());
//         }
//         // savedUserData(userMap)
//         notifyListeners();
//       } else {
//         _apiCompleteResponse = ApiResponse.error("Something went wrong!");
//         appLog("$apiCompleteResponse");
//         notifyListeners();
//       }
//     } catch (e) {
//       _apiCompleteResponse =
//           ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       notifyListeners();
//     }
//   }

//   Future verifyOTP(Map<String, String> input) async {
//     try {
//       _apiVerifyOTPResponse = ApiResponse.loading("Loading...");
//       notifyListeners();
//       final response = await authRemoteRepo.verifyOTPRepo(input);
//       if (response != null) {
//         Helper.showMessage(response['message']);
//         _apiVerifyOTPResponse = ApiResponse.completed(response);

//         AppRouter.pushWithAnimation(const CompleteProfileView());

//         // savedUserData(userMap)
//         notifyListeners();
//       } else {
//         _apiVerifyOTPResponse = ApiResponse.error("Something went wrong!");
//         appLog("Api Response ${apiVerifyOTPResponse.status}");
//         notifyListeners();
//       }
//     } catch (e) {
//       _apiVerifyOTPResponse =
//           ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       notifyListeners();
//     }
//   }

//   Future verifyForgetPassOTP(Map<String, dynamic> input) async {
//     try {
//       _apiForgetPassOTPVerifyResponse = ApiResponse.loading("Loading...");
//       notifyListeners();
//       final response = await authRemoteRepo.verifyForgetPassOTPRepo(input);
//       if (response != null) {
//         Helper.showMessage(response['message']);
//         _apiForgetPassOTPVerifyResponse = ApiResponse.completed(response);

//         AppRouter.pushWithAnimation(const ChangePasswordView());

//         // savedUserData(userMap)
//         notifyListeners();
//       } else {
//         _apiForgetPassOTPVerifyResponse =
//             ApiResponse.error("Something went wrong!");
//         appLog("Api Response ${apiForgetPassVerifyOTPResponse.status}");
//         notifyListeners();
//       }
//     } catch (e) {
//       _apiForgetPassOTPVerifyResponse =
//           ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       notifyListeners();
//     }
//   }

//   Future resendOTP() async {
//     try {
//       _apiResendOTPResponse = ApiResponse.loading("Loading...");
//       notifyListeners();
//       final response = await authRemoteRepo.resendOTP();
//       if (response != null) {
//         Helper.showMessage(response['message']);
//         _apiResendOTPResponse = ApiResponse.completed(response);

//         // savedUserData(userMap)
//         notifyListeners();
//       } else {
//         _apiResendOTPResponse = ApiResponse.error("Something went wrong!");
//         appLog("Api Response ${apiVerifyOTPResponse.status}");
//         notifyListeners();
//       }
//     } catch (e) {
//       _apiResendOTPResponse =
//           ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       notifyListeners();
//     }
//   }

//   Future forgetPassRequest(Map<String, String> input, bool isSendOtp) async {
//     userEmail = input['email'];
//     try {
//       _apiForgetResponse = !isSendOtp
//           ? ApiResponse.loading("Loading...")
//           : ApiResponse.undertermined();
//       notifyListeners();
//       final response = await authRemoteRepo.forgetPasswordRepo(input);
//       if (response != null) {
//         if (!isSendOtp) {
//           Helper.showMessage(response['message']);
//           AppRouter.pushWithAnimation(OTPView(
//             email: userEmail!,
//             isForgetPass: true,
//           ));
//         } else {
//           Helper.showMessage("A new OTP has been sent to your email");
//           return true;
//         }

//         _apiForgetResponse = !isSendOtp
//             ? ApiResponse.completed(response)
//             : ApiResponse.undertermined();

//         notifyListeners();
//       } else {
//         _apiForgetResponse = !isSendOtp
//             ? ApiResponse.error("Something went wrong!")
//             : ApiResponse.undertermined();
//         appLog("$apiForgetResponse");

//         notifyListeners();
//         return false;
//       }
//     } catch (e) {
//       _apiForgetResponse = !isSendOtp
//           ? ApiResponse.errors(Helper.genericErrorHandler(e.toString()))
//           : ApiResponse.undertermined();
//       notifyListeners();
//       return false;
//     }
//   }

//   Future forgetPassOTPVerify(Map<String, dynamic> input) async {
//     try {
//       _apiForgetPassOTPVerifyResponse = ApiResponse.loading("Loading...");
//       notifyListeners();
//       final response = await authRemoteRepo.verifyForgetPassOTPRepo(input);
//       if (response != null) {
//         Helper.showMessage(response['message']);
//         _apiForgetPassOTPVerifyResponse = ApiResponse.completed(response);
//         AppRouter.pushWithAnimation(OTPView(
//           email: userEmail!,
//           isForgetPass: true,
//         ));
//         notifyListeners();
//       } else {
//         _apiForgetPassOTPVerifyResponse =
//             ApiResponse.error("Something went wrong!");
//         appLog("$apiForgetResponse");
//         notifyListeners();
//       }
//     } catch (e) {
//       _apiForgetPassOTPVerifyResponse =
//           ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       notifyListeners();
//     }
//   }

//   Future resetPassword(Map<String, String> input) async {
//     try {
//       _apiResetPassResponse = ApiResponse.loading("Loading...");
//       notifyListeners();
//       final response = await authRemoteRepo.resetPasswordRepo(input);
//       if (response != null) {
//         _apiResetPassResponse = ApiResponse.completed(response);
//         AppRouter.pushAndRemoveUntilWithAnimation(
//             const PasswordSuccessfulChangeView());
//         notifyListeners();
//       } else {
//         _apiResetPassResponse = ApiResponse.error("Something went wrong!");
//         appLog("$apiResetPassResponse");
//         notifyListeners();
//       }
//     } catch (e) {
//       _apiResetPassResponse =
//           ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       notifyListeners();
//     }
//   }

//   Future updateProfile(Map<String, dynamic> input) async {
//     try {
//       _apiUpdateProfileResponse = ApiResponse.loading("Loading...");
//       notifyListeners();
//       final response = await authRemoteRepo.updateProfileRepo(input);
//       if (response != null) {
//         if (!input.containsKey("notification_allow")) {
//           Helper.showMessage(response['message']);
//         }

//         if (response['data'] != null) {
//           savedUserData(response['data']);
//         }
//         _apiUpdateProfileResponse = ApiResponse.completed(response);
//         notifyListeners();
//       } else {
//         _apiUpdateProfileResponse = ApiResponse.error("Something went wrong!");
//         appLog("$apiUpdateProfileResponse");
//         notifyListeners();
//       }
//     } catch (e) {
//       _apiUpdateProfileResponse =
//           ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       notifyListeners();
//     }
//   }

//   Future deleteProfile() async {
//     try {
//       _apiDeleteResponse = ApiResponse.loading("Loading...");
//       notifyListeners();
//       final response = await authRemoteRepo.deleteProfileRepo();
//       if (response != null) {
//         _apiDeleteResponse = ApiResponse.completed(response);
//         AppRouter.pushAndRemoveUntil(const SignInView());
//         notifyListeners();
//       } else {
//         _apiDeleteResponse = ApiResponse.error("Something went wrong!");
//         appLog("$apiDeleteResponse");
//         notifyListeners();
//       }
//     } catch (e) {
//       _apiDeleteResponse =
//           ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       notifyListeners();
//     }
//   }

//   Future<String> getScreenChecker() async {
//     try {
//       final response = await authRemoteRepo.getScreenName();
//       if (response['data'] != null && response['data']['screen'] != null) {
//         String name = response['data']['screen'];
//         return name;
//       } else {
//         return "";
//       }
//     } catch (e) {
//       return "";
//     }
//   }

//   Future<bool> contactSupport(String message) async {
//     try {
//       _apiContactSupportesponse = ApiResponse.loading("Loading...");
//       notifyListeners();
//       final response = await authRemoteRepo.contactSupport(message);
//       if (response != null) {
//         _apiContactSupportesponse = ApiResponse.completed(response);
//         if (response['message'] != null && response['message'] != "") {
//           Helper.showMessage(response['message']);
//         }
//         notifyListeners();
//         return true;
//       } else {
//         _apiContactSupportesponse = ApiResponse.error("Something went wrong!");
//         notifyListeners();
//         return false;
//       }
//     } catch (e) {
//       _apiContactSupportesponse =
//           ApiResponse.errors(Helper.genericErrorHandler(e.toString()));
//       notifyListeners();
//       return false;
//     }
//   }

//   Future signInWithGoogle(BuildContext context, String tag) async {
//     _apiGoogleSignInResponse = ApiResponse.loading("Loading...");
//     notifyListeners();
//     await GoogleSignIn().signOut();
//     await FirebaseAuth.instance.signOut();
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       if (googleUser != null) {
//         // Obtain the auth details from the request
//         final GoogleSignInAuthentication googleAuth =
//             await googleUser.authentication;

//         // Create a new credential
//         final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );
//         final UserCredential user =
//             await FirebaseAuth.instance.signInWithCredential(credential);

        

//         final jwt = JWT(
//             // Payload
//             {
//               'email': user.additionalUserInfo?.profile?['email'],
//               'first_name':
//                   removeSpecialCharacters(user.additionalUserInfo?.profile?['given_name'] ?? "") ,
//               'last_name':
//                   removeSpecialCharacters(user.additionalUserInfo?.profile?['family_name'] ?? "") ,

                 
//             });

//         final token = jwt.sign(SecretKey('secret passphrase'));

        

     
//         if (tag == "Sign up") {
//           signup({"access_token": token, "account_type": "Google"});
//         } else {
//           signin({"access_token": token, "account_type": "Google"});
//         }
//       } else {
//         _apiGoogleSignInResponse = ApiResponse.error("Something went wrong!");
//         notifyListeners();
//       }
//     } catch (e) {
//       Helper.showMessage("Something went wrong!");
//       _apiGoogleSignInResponse =
//           ApiResponse.error("Something went wrong!");
//       notifyListeners();
//     }
//     // Trigger the authentication flow
//   }

//   String generateNonce([int length = 32]) {
//   const charset =
//       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//   final random = Random.secure();
//   return List.generate(length, (_) => charset[random.nextInt(charset.length)])
//       .join();
// }

// /// Returns the sha256 hash of [input] in hex notation.
// String sha256ofString(String input) {
//   final bytes = utf8.encode(input);
//   final digest = sha256.convert(bytes);
//   return digest.toString();
// }


//   Future appleSignIn(BuildContext context, String type) async {
//     _apiAppleSignInResponse = ApiResponse.loading("Loading...");
//     notifyListeners();

//     await FirebaseAuth.instance.signOut();
//     try {
      
//       final rawNonce = generateNonce();
//   final nonce = sha256ofString(rawNonce);

//   // Request credential for the currently signed in Apple account.
//   final appleCredential = await SignInWithApple.getAppleIDCredential(
//     scopes: [
//       AppleIDAuthorizationScopes.email,
//       AppleIDAuthorizationScopes.fullName,
//     ],
//     nonce: nonce,
//   );

//   // Create an `OAuthCredential` from the credential returned by Apple.
//   final oauthCredential = OAuthProvider("apple.com").credential(
//     idToken: appleCredential.identityToken,
//     rawNonce: rawNonce,
//   );

//   // Sign in the user with Firebase. If the nonce we generated earlier does
//   // not match the nonce in `appleCredential.identityToken`, sign in will fail.
//   final UserCredential user =
//  await FirebaseAuth.instance.signInWithCredential(oauthCredential);
//   appLog(user.toString());
//   _apiAppleSignInResponse = ApiResponse.completed(user);
//     notifyListeners();
      
//     } catch (e) {
//       _apiAppleSignInResponse = ApiResponse.error("Something went wrong!");

//       notifyListeners();
//       Helper.showMessage("Something went wrong!");
//     }


//   }

//   Future<String> getPrivacyPolicy()async{
//     try {
//       final response = await authRemoteRepo.getPrivacy("privacy_policy");
    
//         appLog("$response");
//         return response['meta_data'] ?? "";
      
      
//     } catch (e) {
//       throw Exception(e);
//     }

//   }

//   Future logout() async {
//     try {
//       final response =
//           await authRemoteRepo.logout(FirebaseService.fcmToken ?? "");
//       appLog(response);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   // Future signInWithFacebook(BuildContext context, String type) async {
//   //   // Trigger the sign-in flow

//   //   await FacebookAuth.instance.logOut();
//   //   await FirebaseAuth.instance.signOut();
//   //   try {
//   //     // ignore: unnecessary_nullable_for_final_variable_declarations
//   //     final LoginResult loginResult = await FacebookAuth.instance.login();

//   //     // Create a credential from the access token

//   //     if (loginResult.accessToken != null) {
//   //       final OAuthCredential facebookAuthCredential =
//   //           FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

//   //       final UserCredential user = await FirebaseAuth.instance
//   //           .signInWithCredential(facebookAuthCredential);

//   //       appLog(user.toString());

//   //       final String? token =
//   //           await FirebaseAuth.instance.currentUser?.getIdToken();
//   //       if (context.mounted) {
//   //         appLog("$token");
//   //         context.read<SocialSignInBloc>().add(
//   //               SocialSignButtonPressed(
//   //                   accessToken: token!,
//   //                   type: type,
//   //                   fcmToken: context.read<FCMTokenCubit>().state),
//   //             );
//   //       }
//   //     } else {
//   //       if (context.mounted) {
//   //         context.read<SocialSignInBloc>().add(SocialSignRemoveLoading());
//   //       }
//   //     }
//   //   } catch (e) {
//   //     if (context.mounted) {
//   //       context.read<SocialSignInBloc>().add(SocialSignRemoveLoading());
//   //     }
//   //     throw Exception(e);
//   //   }
//   // }

//   void savedUserData(Map<String, dynamic> userMap) {
//     String user = jsonEncode(userMap);
//     SharedPreferenceManager.sharedInstance.storeUser(user);
//     userSet();
//   }

//   void userSet() {
//     Map<String, dynamic> userJson =
//         jsonDecode(SharedPreferenceManager.sharedInstance.getUserData()!);

//     userData = UserDataModel.fromJson(userJson);
//     appLog("user data $userData");
//   }

//   void responseSet() {
//     _apiSigninResponse = ApiResponse.undertermined();
//     _apiSignupResponse = ApiResponse.undertermined();
//     _apiCompleteResponse = ApiResponse.undertermined();
//     _apiVerifyOTPResponse = ApiResponse.undertermined();
//     _apiResendOTPResponse = ApiResponse.undertermined();
//     _apiForgetPassOTPVerifyResponse = ApiResponse.undertermined();
//     _apiForgetResponse = ApiResponse.undertermined();
//     _apiResetPassResponse = ApiResponse.undertermined();
//     _apiUpdateProfileResponse = ApiResponse.undertermined();
//     _apiDeleteResponse = ApiResponse.undertermined();
//     _apiContactSupportesponse = ApiResponse.undertermined();
//     _apiGoogleSignInResponse = ApiResponse.undertermined();
//     _apiAppleSignInResponse = ApiResponse.undertermined();
//     // _apiPrivacyPolicyResponse = ApiResponse.undertermined();
//         notifyListeners();
//   }

//   ApiResponse get apiSigninResponse => _apiSigninResponse;
//   ApiResponse get apiSignupResponse => _apiSignupResponse;
//   ApiResponse get apiCompleteResponse => _apiCompleteResponse;
//   ApiResponse get apiVerifyOTPResponse => _apiVerifyOTPResponse;
//   ApiResponse get apiResendOTPResponse => _apiResendOTPResponse;
//   ApiResponse get apiForgetResponse => _apiForgetResponse;
//   ApiResponse get apiForgetPassVerifyOTPResponse =>
//       _apiForgetPassOTPVerifyResponse;
//   ApiResponse get apiResetPassResponse => _apiResetPassResponse;
//   ApiResponse get apiUpdateProfileResponse => _apiUpdateProfileResponse;
//   ApiResponse get apiDeleteResponse => _apiDeleteResponse;
//   ApiResponse get apiContactSupportesponse => _apiContactSupportesponse;
//   ApiResponse get apiGoogleSignInResponse => _apiGoogleSignInResponse;
//   ApiResponse get apiAppleSignInResponse => _apiAppleSignInResponse;
//   // ApiResponse get apiPrivacyPolicyResponse => _apiPrivacyPolicyResponse;

// }

// final authRepoProvider =
//     ChangeNotifierProvider<AuthRepoProvider>((ref) => AuthRepoProvider());

// final privacyRepoProvider = FutureProvider.autoDispose<String>((ref) => ref.read(authRepoProvider).getPrivacyPolicy(),);
