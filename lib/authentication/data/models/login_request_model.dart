// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    required this.socialId,
    required this.contact,
    required this.name,
    required this.email,
  });

  String socialId;
  String contact;
  String name;
  String email;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        socialId: json["socialId"],
        contact: json["contact"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "socialId": socialId,
        "contact": contact,
        "name": name,
        "email": email,
      };
}
