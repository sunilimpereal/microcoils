import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../utils/ApiUrls.dart';
import '../../../utils/api_requests.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

class AuthRepository {
  //login with email password
  Future<LoginResponse?> loginWithEmailPassword(
      {required String email, required String password}) async {
    LoginResponse? loginResponse = await ApiRequest<LoginRequest, LoginResponse>().postLogin(
        url: "${ApiUrls.loginEmailPassword}?email=$email&password=$password",
        request: LoginRequest(),
        reponseFromJson: loginResponseFromJson,
        requestToJson: loginRequestToJson);
    // log(loginResponse!.toJson().toString());
    return loginResponse;
  }

  //register with email password
  Future<LoginResponse?> registerWithEmailPassword(
      {required String email, required String password}) async {
    LoginResponse? loginResponse = await ApiRequest<LoginRequest, LoginResponse>().postLogin(
        url: "${ApiUrls.loginEmailPassword}?email=$email&password=$password",
        request: LoginRequest(),
        reponseFromJson: loginResponseFromJson,
        requestToJson: loginRequestToJson);
    // log(loginResponse!.toJson().toString());
    return loginResponse;
  }

  Future<LoginResponse?> validateOtp({required String email, required String otp}) async {
    LoginResponse? loginResponse = await ApiRequest<LoginRequest, LoginResponse>().post(
        url: "${ApiUrls.validateOtp}?email=$email&otp=$otp",
        request: LoginRequest(),
        reponseFromJson: loginResponseFromJson,
        requestToJson: loginRequestToJson);
    return loginResponse;
  }

  //login with number and otp
  Future<LoginResponse?> loginWithNumber(LoginRequest loginRequest) async {
    LoginResponse? loginResponse = await ApiRequest<LoginRequest, LoginResponse>().post(
        url: ApiUrls.login,
        request: loginRequest,
        reponseFromJson: loginResponseFromJson,
        requestToJson: loginRequestToJson);
    log(loginResponse!.toJson().toString());
    return loginResponse;
  }

  // sign in google with firebase
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // sign in with facebook
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
