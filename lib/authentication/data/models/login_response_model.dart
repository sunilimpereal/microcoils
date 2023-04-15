// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.otp,
    required this.message,
    required this.user,
  });

  int otp;
  String message;
  User user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        otp: json["otp"] ?? 0,
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "message": message,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.companyName,
    this.imageUrl,
    required this.address,
    required this.email,
    required this.contact,
    required this.os,
    required this.osVersion,
    required this.applicationVersion,
    required this.deviceId,
    required this.socialId,
    required this.isActive,
    required this.createdon,
  });

  int id;
  String name;
  String? companyName;
  String? imageUrl;
  String? address;
  String? email;
  String contact;
  String? os;
  String? osVersion;
  String? applicationVersion;
  String? deviceId;
  String socialId;
  int isActive;
  DateTime createdon;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        companyName: json["companyName"],
        imageUrl: json["imageUrl"],
        address: json["address"],
        email: json["email"],
        contact: json["contact"],
        os: json["os"],
        osVersion: json["osVersion"],
        applicationVersion: json["applicationVersion"],
        deviceId: json["deviceId"],
        socialId: json["socialId"],
        isActive: json["isActive"],
        createdon: DateTime.parse(json["createdon"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "companyName": companyName,
        "imageUrl": imageUrl,
        "address": address,
        "email": email,
        "contact": contact,
        "os": os,
        "osVersion": osVersion,
        "applicationVersion": applicationVersion,
        "deviceId": deviceId,
        "socialId": socialId,
        "isActive": isActive,
        "createdon":
            "${createdon.year.toString().padLeft(4, '0')}-${createdon.month.toString().padLeft(2, '0')}-${createdon.day.toString().padLeft(2, '0')}",
      };
}
